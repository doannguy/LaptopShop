<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Cart\UpdateCartRequest;
use App\Services\CartService;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function getMyCart()
    {
        $myCart = $this->cartService()->findByUserId(Auth::user()->id);
        return jsonResponse(0, $myCart);
    }

    public function updateMyCart(UpdateCartRequest $request)
    {
        $data = $request->validated();
        $myCart = $this->cartService()->updateByUserId(Auth::user()->id, $data);
        return jsonResponse($myCart ? 0 : 1, message: $myCart ? 'Cập nhật thành công!' : 'Có lỗi xảy ra, xin vui lòng tải lại trang và thử lại.');
    }

    public function cartService()
    {
        return app(CartService::class);
    }
}
