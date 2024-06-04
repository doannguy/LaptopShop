<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Category\DeleteCategoryRequest;
use App\Http\Requests\Admin\Category\StoreCategoryRequest;
use App\Http\Requests\Admin\Category\UpdateCategoryRequest;
use App\Services\CategoryService;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        return view('category.index.main');
    }

    public function datatable(Request $request)
    {
        $result = $this->categoryService()->filterDatatable($request->input());
        return response()->json($result);
    }

    public function store(StoreCategoryRequest $request)
    {
        $data = $request->validated();
        $result = $this->categoryService()->store($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function update(UpdateCategoryRequest $request)
    {
        $data = $request->validated();
        $result = $this->categoryService()->update($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function delete(DeleteCategoryRequest $request)
    {
        $data = $request->validated();
        $result = $this->categoryService()->delete($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function categoryService()
    {
        return app(CategoryService::class);
    }
}
