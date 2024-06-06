<?php

namespace App\Services;
use App\Models\ProductAttributeValue;

class ProductAttributeValueService extends Service
{
    public function setModel()
    {
        $this->model = new ProductAttributeValue();
    }
}
