<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function ProductService() {
       return app(ProductService::class);
    }

    public function getProducts(Request $request) {
        $products = $this->ProductService()->filterProductList($request->all());
        return response()->json($products);
    }
    function getProductDetail($id) {
        $result = $this->ProductService()->getProductDetail($id);
        return response()->json($result);
    }
}
