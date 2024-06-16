<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Attribute\DeleteAttributeRequest;
use App\Http\Requests\Admin\Attribute\StoreAttributeRequest;
use App\Http\Requests\Admin\Attribute\UpdateAttributeRequest;
use App\Services\AttributeService;
use App\Services\AttributeValueService;
use Illuminate\Http\Request;

class AttributeController extends Controller
{
    public function index()
    {
        return view('attribute.index.main');
    }

    public function datatable(Request $request)
    {
        $result = $this->attributeService()->filterDatatable($request->input());
        return response()->json($result);
    }
    public function store(StoreAttributeRequest $request)
    {

        $data = $request->validated();
        $result = $this->AttributeService()->store($data);
        return jsonResponse($result ? 0 : 1);
    }

    public function update(UpdateAttributeRequest $request)
    {
        $data = $request->validated();
        $result = $this->AttributeService()->update($data['id'], $data);
        return jsonResponse($result ? 0 : 1);
    }

    public function delete(DeleteAttributeRequest $request)
    {
        $data = $request->validated();
        $result = $this->AttributeService()->delete($data['id']);
        return jsonResponse($result ? 0 : 1);
    }
    public function attributeService()
    {
        return app(AttributeService::class);
    }
}
