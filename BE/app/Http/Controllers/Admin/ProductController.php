<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Product\DeleteProductRequest;
use App\Http\Requests\Admin\Product\StoreProductRequest;
use App\Http\Requests\Admin\Product\UpdateProductRequest;
use App\Services\AttributeService;
use App\Services\BrandService;
use App\Services\CategoryService;
use App\Services\ProductOptionService;
use App\Services\ProductSeriService;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        return view('product.index.main');
    }
    public function create() {
        $categories = $this->categoryService()->getAll();
        $attributes = $this->attributeService()->getAllWithAttributeValuesArray();

        $brands = $this->brandService()->getAll();
        return view('product.create.main', compact('categories', 'attributes', 'brands'));
    }

    public function store(StoreProductRequest $request) {
     try {
            $result = $this->productService()->store($request);
            return jsonResponse(0, $result);
     } catch (\Throwable $th) {
            return jsonResponse(1,message: $th->getMessage());
     }
    }
    public function datatable(Request $request)
    {
        $result = $this->productService()->filterDatatable($request->input());
        return response()->json($result);
    }
    public function delete(DeleteProductRequest $request) {

        $data = $request->validated();
        $result = $this->productService()->delete($data);
        return jsonResponse($result ? 0 : 1);
    }
    function edit($id) {
        $product = $this->productService()->get($id);
        $categories = $this->categoryService()->getAll();
        $attributes = $this->attributeService()->getAllWithAttributeValuesArray();

        $brands = $this->brandService()->getAll();
        return view('product.edit.main', compact('categories', 'attributes', 'brands', 'product'));
    }
    function productOptionsDatatable(Request $request, $id) {
        $result = $this->productOptionService()->filterDatatable($id, $request->input());
        return response()->json($result);
    }

    function update(UpdateProductRequest $request) {

        $data = $request->validated();
        $result = $this->productService()->update($data['product_id'], $data);
        return jsonResponse($result ? 0 : 1, message: $result ? 'Cập nhật sản phẩm thành công' : 'Cập nhật sản phẩm thất bại, thử lại sau');
    }
    // List service
    public function categoryService() {

        return app(CategoryService::class);
    }
    public function attributeService() {

        return app(AttributeService::class);
    }
    public function brandService() {
        return app(BrandService::class);
    }
    public function productService() {
        return app(ProductService::class);
    }
    public function productOptionService() {
        return app(ProductOptionService::class);
    }
}
