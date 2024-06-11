<?php

namespace App\Services;
use App\Models\ProductAttributeValue;

class ProductAttributeValueService extends Service
{
    public function setModel()
    {
        return new ProductAttributeValue();
    }
}
