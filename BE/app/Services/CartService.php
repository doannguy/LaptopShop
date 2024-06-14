<?php

namespace App\Services;

use App\Models\Cart;
use App\Services\Service;

class CartService extends Service
{
    public function setModel()
    {
        return new Cart();
    }

    public function findByUserId($userId)
    {
        $carts = Cart::where('user_id', $userId)
            ->with(['productOption.product', 'productOption.productMedia'])
            ->get();
        return $carts->map(function ($cart) {
            return [
                'id' => $cart->id,
                'product_option_id' => $cart->product_option_id,
                'product_name' => $cart->productOption->product->name." (".$cart->productOption->name.")",
                'price' => $cart->productOption->price,
                'current_price' => $cart->productOption->current_price,
                'quantity' => $cart->quantity,
                'thumbnail' => $cart->productOption->productMedia->first()->path,
                'product_id' => $cart->productOption->product_id,
                'totalAmount' => $cart->productOption->current_price * $cart->quantity
            ];
        });
    }

    public function updateByUserId($userId, $data)
    {   $result = false;
        if ($data['quantity'] == 0) {
            $result = $this->deleteByUserId($userId, $data['product_option_id']);
        }else {
            $result = Cart::updateOrCreate([
                'user_id' => $userId,
                'product_option_id' => $data['product_option_id'],
            ], $data);
        }
        if($result == false) return false;
        return $this->findByUserId($userId);


    }

    public function deleteByUserId($userId, $productOptionId)
    {
        return Cart::where('user_id', $userId)
            ->where('product_option_id', $productOptionId)
            ->delete();
    }
}
