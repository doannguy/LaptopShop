<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Brand\DeleteBrandRequest;
use App\Http\Requests\Admin\Brand\StoreBrandRequest;
use App\Http\Requests\Admin\Brand\UpdateBrandRequest;
use App\Services\BrandService;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public function index()
    {
        return view('brand.index.main');
    }
    public function datatable(Request $request)
    {
        $result = $this->categoryService()->filterDatatable($request->input());
        return response()->json($result);
    }

    public function store(StoreBrandRequest $request)
    {
        $data = $request->validated();
        $result = $this->categoryService()->store($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function update(UpdateBrandRequest $request)
    {
        $data = $request->validated();
        $result = $this->categoryService()->update($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function delete(DeleteBrandRequest $request)
    {
        $data = $request->validated();
        $result = $this->categoryService()->delete($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function categoryService()
    {
        return app(BrandService::class);
    }
}
