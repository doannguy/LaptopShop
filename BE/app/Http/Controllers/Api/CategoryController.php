<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\CategoryService;

class CategoryController extends Controller
{
    public function categoryService()
    {
        return app(CategoryService::class);
    }

    public function getCategories()
    {
        try {
            $result = $this->categoryService()->getCategories();
            return jsonResponse(0, $result);
        } catch (\Throwable $th) {
            return jsonResponse(2, $th->getMessage());
        }
    }
}
