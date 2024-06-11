<?php

namespace App\Services;

use App\Models\ProductSeri;

class ProductSeriService
{
    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;
        $sort = $data['order'][0]['dir'] ?? 'desc';

        $query = ProductSeri::query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy('id', $sort);
        $recordsFiltered = $recordsTotal = $query->count();
        $categories = $query->skip($skip)
            ->with(['category'])
            ->take($pageLength)
            ->get();

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $categories
        ];
    }

    public function delete($data)
    {
        $productSeeri = ProductSeri::find($data['id']);
        if ($data['delete_type'] == ProductSeri::DELETE_TYPE['hard']) {
            // $productSeeri->products()->delete();
            return $productSeeri->delete();
        } else if ($data['delete_type'] == ProductSeri::DELETE_TYPE['soft']) {
            // $productSeeri->products()->update(['productSeeri_id' => null]);
            return $productSeeri->delete();
        }
    }

    public function store($data)
    {
        return ProductSeri::create($data);
    }

    public function update($data)
    {
        return ProductSeri::find($data['id'])->update($data);
    }

    public function getByCategoryId($categoryId)
    {
        return ProductSeri::where('category_id', $categoryId)->get();
    }
}
