<?php

namespace App\Services;
use App\Models\ProductMedia;

class ProductMediaService extends Service
{
    public function setModel() {
        return new ProductMedia();
    }
    public function store($data) {

    }
}
