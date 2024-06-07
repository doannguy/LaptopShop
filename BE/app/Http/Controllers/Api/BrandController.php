<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\BrandService;

class BrandController extends Controller
{
    public function brandService()
    {
        return app(BrandService::class);
    }

    public function getBrands()
    {
        $brands = $this->brandService()->getAll();
        return jsonResponse(1, $brands);
    }
}
