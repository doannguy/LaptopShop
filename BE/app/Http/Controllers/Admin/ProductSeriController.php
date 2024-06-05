<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProductSeri\DeleteProductSeriRequest;
use App\Http\Requests\Admin\ProductSeri\StoreProductSeriRequest;
use App\Http\Requests\Admin\ProductSeri\UpdateProductSeriRequest;
use App\Services\CategoryService;
use App\Services\ProductSeriService;
use Illuminate\Http\Request;

class ProductSeriController extends Controller
{
    public function index()
    {
        $categories = $this->categoryService()->getCategories();
        return view('product_seri.index.main', compact('categories'));
    }

    public function datatable(Request $request)
    {
        $result = $this->ProductSeriService()->filterDatatable($request->input());
        return response()->json($result);
    }

    public function store(StoreProductSeriRequest $request)
    {
        $data = $request->validated();
        $result = $this->ProductSeriService()->store($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function update(UpdateProductSeriRequest $request)
    {
        $data = $request->validated();
        $result = $this->ProductSeriService()->update($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function delete(DeleteProductSeriRequest $request)
    {
        $data = $request->validated();
        $result = $this->ProductSeriService()->delete($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function ProductSeriService()
    {
        return app(ProductSeriService::class);
    }

    public function categoryService()
    {
        return app(CategoryService::class);
    }
}
