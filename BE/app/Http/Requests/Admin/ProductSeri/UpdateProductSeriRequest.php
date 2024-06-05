<?php

namespace App\Http\Requests\Admin\ProductSeri;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateProductSeriRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'id' => 'required|exists:product_series,id',
            'name' => 'required|string|max:255|unique:product_series,name,' . $this->id, // Ignore self
            'category_id' => 'required|exists:categories,id',
        ];
    }

    public function messages()
    {
        return [
            'id.required' => 'Vui lòng chọn dòng sản phẩm',
            'id.exists' => 'Dòng sản phẩm không tồn tại',
            'name.required' => 'Vui lòng nhập tên dòng sản phẩm',
            'name.unique' => 'Tên dòng sản phẩm đã tồn tại',
            'name.max' => 'Tên dòng sản phẩm tối đa 255 ký tự',
            'name.string' => 'Tên dòng sản phẩm phải là chuỗi',
            'category_id.required' => 'Vui lòng chọn danh mục',
            'category_id.exists' => 'Danh mục không tồn tại',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
