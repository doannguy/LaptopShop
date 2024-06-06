<?php

namespace App\Services;

use App\Models\Category;

class CategoryService
{
    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;
        $sort = $data['order'][0]['dir'] ?? 'desc';

        $query = Category::query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy('id', $sort);
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
        $category = Category::find($data['id']);
        if ($data['delete_type'] == Category::DELETE_TYPE['hard']) {
            // $category->products()->delete();
            return $category->delete();
        } else if ($data['delete_type'] == Category::DELETE_TYPE['soft']) {
            // $category->products()->update(['category_id' => null]);
            return $category->delete();
        }
    }

    public function store($data)
    {
        return Category::create($data);
    }

    public function update($data)
    {
        return Category::find($data['id'])->update($data);
    }

    public function getCategories()
    {
        return Category::select(['id', 'name'])->get();
    }
}
