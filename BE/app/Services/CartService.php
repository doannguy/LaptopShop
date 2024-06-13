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
        return Cart::where('user_id', $userId)
            ->with('productOption.product')
            ->firstOrCreate();
    }

    public function updateByUserId($userId, $data)
    {
        if ($data['quantity'] == 0) {
            return $this->deleteByUserId($userId, $data['product_option_id']);
        }

        return Cart::updateOrCreate([
            'user_id' => $userId,
            'product_option_id' => $data['product_option_id'],
        ], $data);
    }

    public function deleteByUserId($userId, $productOptionId)
    {
        return Cart::where('user_id', $userId)
            ->where('product_option_id', $productOptionId)
            ->delete();
    }
}
