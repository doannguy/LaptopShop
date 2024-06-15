<?php

namespace App\Services;

use App\Models\Brand;

class BrandService
{
    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;

        $query = Brand::query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy('id', 'desc');
        $recordsFiltered = $recordsTotal = $query->count();
        $brands = $query->skip($skip)
            ->withCount(['products'])
            ->take($pageLength)
            ->get();

        return [
            "draw" => $data['draw'] ?? 1,
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            'data' => $brands
        ];
    }

    public function delete($data)
    {
        $brand = Brand::find($data['id']);
        if ($data['delete_type'] == Brand::DELETE_TYPE['hard']) {
            $brand->products()->delete();
            return $brand->delete();
        } else if ($data['delete_type'] == Brand::DELETE_TYPE['soft']) {
            $brand->products()->update(['brand_id' => null]);
            return $brand->delete();
        }
    }

    public function store($data)
    {
        return Brand::create($data);
    }

    public function update($data)
    {
        $brand = Brand::find($data['id']);
        return $brand->update($data);
    }
    public function getAll()
    {
        return Brand::all();
    }
}
