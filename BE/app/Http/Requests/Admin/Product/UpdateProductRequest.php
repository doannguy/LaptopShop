<?php

namespace App\Http\Requests\Admin\Product;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateProductRequest extends FormRequest
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
            'product_id' => 'required|exists:products,id',
            'name' => 'required|string',
            "short_description" => 'required|string',
            "description" => 'required|string',
            'thumbnail' => 'nullable|image',
            'category' => 'required|exists:categories,id',
            'product_seri' => 'required|exists:product_series,id',
            'brand' => 'required|exists:brands,id',
        ];
    }
    public function messages(): array
    {
        return [
            'product_id.required' => 'sản phẩm không hợp lệ',
            'product_id.exists' => 'sản phẩm không tồn tại',
            'name.required' => 'Tên sản phẩm không được để trống',
            'name.string' => 'Tên sản phẩm phải là một chuỗi',
            'short_description.required' => 'Mô tả ngắn gọn không được để trống',
            'short_description.string' => 'Mô tả ngắn gọn phải là một chuỗi',
            'description.required' => 'Mô tả không được để trống',
            'description.string' => 'Mô tả phải là một chuỗi',
            'thumbnail.image' => 'Thumbnail không phải là hình ảnh',
            'category.required' => 'Danh mục không được để trống',
            'category.exists' => 'Danh mục không tồn tại',
            'product_seri.required' => 'Dòng sản phẩm không được để trống',
            'product_seri.exists' => 'Dòng sản phẩm không tồn tại',
            'brand.required' => 'Thương hiệu không được để trống',
            'brand.exists' => 'Thương hiệu không tồn tại',
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
