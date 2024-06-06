<?php

namespace App\Services;

use App\Models\Attribute;
use App\Models\AttributeValue;
use App\Models\ProductAttributeValue;
use Illuminate\Support\Facades\DB;

class AttributeService extends Service
{
    public function setModel()
    {
        $this->model = new Attribute();
    }
    public function attributeValueService()
    {
        return app(AttributeValueService::class);
    }
    public function productAttributeValueService()
    {
        return app(ProductAttributeValueService::class);
    }

    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;

        $query = $this->model::query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy('id', 'desc');
        $recordsFiltered = $recordsTotal = $query->count();
        $attributes = $query->skip($skip)
            ->with('attributeValues')
            ->take($pageLength)
            ->get();

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $attributes
        ];
    }

    public function store($data)
    {
        DB::beginTransaction();
        try {
            $attribute = $this->model->create([
                "name" => $data['name'],
                "status" => $data['status']
            ]);
            if ($attribute) {
                $attribute_values = $data['attribute_values'];
                foreach ($attribute_values as $attribute_value) {
                    $this->attributeValueService()->store([
                        "attribute_id" => $attribute->id,
                        "value" => $attribute_value['value']
                    ]);
                }
            }
            DB::commit();
            return true;
        } catch (\Throwable $th) {
            \Log::error($th);
            DB::rollBack();
            return false;
        }
    }
    public function update($id, $data)
    {
        DB::beginTransaction();
        try {
            $attribute = $this->model->where('id', $id)->update([
                "name" => $data['name'],
                "status" => $data['status']
            ]);
            \Log::info($attribute);

            $attribute_values_remove = $this->attributeValueService()->getByAttributeId($id)->pluck('id')->toArray();
            $attribute_values = $data['attribute_values'];
            \Log::info($attribute_values);
            foreach ($attribute_values as $attribute_value) {
                if (in_array($attribute_value['id'], $attribute_values_remove)) {
                    unset($attribute_values_remove[array_search($attribute_value['id'], $attribute_values_remove)]);
                }
                AttributeValue::updateOrCreate(
                    [
                        "id" => $attribute_value['id'],
                    ],
                    [
                        "attribute_id" => $id,
                        "value" => $attribute_value['value']
                    ]
                );
            }
            $this->attributeValueService()->delete($attribute_values_remove);
            DB::commit();
            return true;
        } catch (\Throwable $th) {
            \Log::error($th);
            DB::rollBack();
            return false;
        }
    }

    public function delete($id)
    {
        DB::beginTransaction();
        try {
            $attribute_values_id = AttributeValue::where('attribute_id', $id)->pluck('id')->toArray();
            $product_attribute_values_id = ProductAttributeValue::whereIn('attribute_value_id', $attribute_values_id)->pluck('id')->toArray();
            $this->productAttributeValueService()->delete($product_attribute_values_id);
            $this->attributeValueService()->delete($attribute_values_id);
            $this->model->destroy($id);
            DB::commit();
            return true;
        } catch (\Throwable $th) {
            \Log::error($th);
            DB::rollBack();
            return false;
        }
    }

}