<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProductOption\StoreProductOptionRequest;
use App\Http\Requests\Admin\ProductOption\UpdateProductOptionRequest;
use App\Services\ProductOptionService;
use Illuminate\Http\Request;

class ProductOptionController extends Controller
{
    function productOptionService()
    {
        return app(ProductOptionService::class);
    }
    function store(StoreProductOptionRequest $request)
    {
        $data = $request->validated();
        $result = $this->productOptionService()->store($data);
        return jsonResponse($result ? 0 : 1, message: $result ? 'Thêm phiên bản thành công' : 'Thêm phiên bản thất bại, thử lại sau');
    }
    function update(UpdateProductOptionRequest $request)
    {
        $data = $request->validated();
        $result = $this->productOptionService()->update($data['id'], $data);
        return jsonResponse($result ? 0 : 1, message: $result ? 'Cập nhật phiên bản thành công' : 'Cập nhật phiên bản thất bại, thử lại sau');
    }
    function delete(Request $request) {
        $request->validate([
            'id' => 'required|exists:product_options,id'
        ]);
        $id = $request->input('id');
        $result = $this->productOptionService()->delete($id);
        return jsonResponse($result ? 0 : 1, message: $result ? 'Xoá phiên bản thành công' : 'Xoá phiên bản thất bại, thử lại sau');
    }
}
