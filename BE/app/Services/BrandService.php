<?php

namespace App\Services;

use App\Models\Brand;
use App\Models\Category;

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
        $categories = $query->skip($skip)
            // ->withCount(['products'])
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
        $category = Brand::find($data['id']);
        if ($data['delete_type'] == Brand::DELETE_TYPE['hard']) {
            // $category->products()->delete();
            return $category->delete();
        } else if ($data['delete_type'] == Brand::DELETE_TYPE['soft']) {
            // $category->products()->update(['category_id' => null]);
            return $category->delete();
        }
    }

    public function store($data)
    {
        return Brand::create($data);
    }

    public function update($data)
    {
        $category = Brand::find($data['id']);
        return $category->update($data);
    }
    public function getAll() {
        return Brand::all();
    }
}
