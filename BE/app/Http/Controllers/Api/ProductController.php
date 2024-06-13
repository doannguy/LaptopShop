<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Product\StoreReviewRequest;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function ProductService()
    {
        return app(ProductService::class);
    }

    public function getProducts(Request $request)
    {
        $products = $this->ProductService()->filterProductList($request->all());
        return response()->json($products);
    }
    function getProductDetail($id)
    {
        $result = $this->ProductService()->getProductDetail($id);
        return response()->json($result);
    }

    public function storeProductReview(StoreReviewRequest $request)
    {
        $data = $request->validated();
        $result = $this->ProductService()->storeReview($data);
        return jsonResponse($result ? 0 : 1);
    }
}
