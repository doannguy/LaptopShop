<?php

namespace App\Services;

use App\Models\ProductMedia;
use App\Models\ProductOption;
use Illuminate\Support\Facades\DB;

class ProductOptionService extends Service
{
    public function setModel()
    {
        return new ProductOption();
    }
    function mediaService()
    {
        return app(MediaService::class);
    }
    function filterDatatable($id, $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;
        $sort = $data['order'][0]['dir'] ?? 'desc';

        $query = $this->model::query();
        $query->where('product_id', $id);
        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy('id', $sort);
        $recordsFiltered = $recordsTotal = $query->count();
        $categories = $query->skip($skip)
            ->with(['productMedia', 'attributeValues'])
            ->take($pageLength)
            ->get('*');

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $categories
        ];
    }
    public function store($data)
    {
        DB::beginTransaction();
        try {
            $product_option = $this->model->create([
                'name' => $data['name'],
                "amount" => $data["amount"],
                "price" => $data["price"],
                "current_price" => $data["current_price"],
                "status" => $data["status"],
                "product_id" => $data["product_id"],
            ]);
            $product_option_image_file = $data["product_option_image_file"];
            // create product media
            $this->uploadImage($product_option_image_file, $product_option);
            // create product attribute values
            $product_attribute_values = $data["product_attribute_values"];
            if (isset($product_attribute_values) && count($product_attribute_values) > 0) {
                $product_option->attributeValues()->attach($product_attribute_values);
            }

            DB::commit();
            return true;
        } catch (\Throwable $th) {
            \Log::error($th->getMessage());
            DB::rollBack();
            return false;

        }
    }
    public function delete($id)
    {
        $product_option = $this->model->find($id);
        $productMedia = $product_option->productMedia;
        foreach ($productMedia as $media) {
            $this->mediaService()->deleteFile($media->id);
        }
        $product_option->productMedia()->detach();
        // xóa product attribute values
        $product_option->attributeValues()->detach();
        return $product_option->delete();
    }
    public function update($id, $data)
    {
        DB::beginTransaction();
        try {
            $product_option = $this->model->where('id', $id)->first();
            $result = $product_option->update([
                'name' => $data['name'],
                "amount" => $data["amount"],
                "price" => $data["price"],
                "current_price" => $data["current_price"],
                "status" => $data["status"],
            ]);
            if($result === false) {
                DB::rollBack();
                return false;
            }
            // upload new imagge
            $product_option_image_file = $data["product_option_image_file"] ?? [];
            if(isset($product_option_image_file) && count($product_option_image_file) > 0) {

            $this->uploadImage($product_option_image_file, $product_option);
            }
            //delete old image
            $removed_images = json_decode($data["removed_images"], true);
            foreach ($removed_images as $remove_image) {
                $this->mediaService()->deleteFile($remove_image);
            }
            // update product attribute values
            $product_option->attributeValues()->detach();
            $product_attribute_values = $data["product_attribute_values"];
            if (isset($product_attribute_values) && count($product_attribute_values) > 0) {
                $product_option->attributeValues()->attach($product_attribute_values);
            }

            DB::commit();
            return true;
        } catch (\Throwable $th) {
            DB::rollBack();
            \Log::info($th->getMessage());
            throw new \Exception($th, 400);
        }
    }
    function uploadImage($product_option_image_file, $product_option) {
        $product_medias = [];
        if (isset($product_option_image_file)) {
            foreach ($product_option_image_file as $image_file) {
                $media = $this->mediaService()->saveFile($image_file, 'product_option', 'product/product_option');
                $product_medias[] = [
                    "media_id" => $media->id,
                ];
            }
            $product_option->productMedia()->attach($product_medias);
        } else {
            throw new \Exception("Thiếu ảnh sản phẩm", 400);
        }
    }
}
