<?php

namespace App\Services;

use App\Models\Category;

class CategoryService extends Service
{
    public function setModel() {
        return new Category();
    }
    public function filterDatatable(array $data)
    {
        $pageNumber = ($data['start'] ?? 0) / ($data['length'] ?? 1) + 1;
        $pageLength = $data['length'] ?? 10;
        $skip = ($pageNumber - 1) * $pageLength;
        $orderBy = $data['columns'][$data['order'][0]['column']]['data'] ?? 'id';
        $orderDir = $data['order'][0]['dir'] ?? 'desc';

        $query = Category::query();

        if (isset($data['search'])) {
            $search = $data['search'];
            $query->where('name', 'like', "%{$search}%");
        }

        $query->orderBy($orderBy, $orderDir);
        $recordsFiltered = $recordsTotal = $query->count();
        $categories = $query->skip($skip)
            ->withCount(['productSeries'])
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
            $category->products()->delete();
            return $category->delete();
        } else if ($data['delete_type'] == Category::DELETE_TYPE['soft']) {
            $category->products()->update(['category_id' => null]);
            return $category->delete();
        }
    }

    public function store($data)
    {
        return Category::create($data);
    }




    public function getCategories()
    {
        return Category::select(['id', 'name'])->with(['productSeries'])->get()->map(function ($category) {
            if(count($category->productSeries) > 0) {
                $category['hasChildren'] = true;
            }else {
                $category['hasChildren'] = false;
            }

            return $category;

        });
    }
}
