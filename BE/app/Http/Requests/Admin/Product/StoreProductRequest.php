<?php

namespace App\Http\Requests\Admin\Product;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
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
            'name' => 'required|string|max:255|unique:products,name',
            'short_description' => 'required|string|max:255',
            'description' => 'required|string',
            'brand_id' => 'required|exists:brands,id',
            'category_id' => 'required|exists:categories,id',
            'product_seri_id' => 'required|exists:product_series,id',
            'product_options' => 'required|json',
            'thumbnail' => 'required|image',
        ];
    }

    public function messages(): array
    {
        return [
            'name.unique' => 'Tên sản phẩm đã tồn tại',
            'name.required' => 'Vui lòng nhập tên sản phẩm',
            'name.max' => 'Tên sản phẩm không được quá 255 ký tự',
            'short_description.required' => 'Vui lòng nhập mô tả ngắn',
            'short_description.max' => 'Mô tả ngắn không được quá 255 ký tự',
            'description.required' => 'Vui lòng nhập mô tả',
            'brand_id.required' => 'Vui lòng chọn nhãn hiệu',
            'brand_id.exists' => 'Nhãn hiệu không tồn tại',
            'category_id.required' => 'Vui lòng chọn danh mục sản phẩm',
            'category_id.exists' => 'Danh mục sản phẩm không tồn tại',
            'product_seri_id.required' => 'Vui lòng chọn dòng sản phẩm',
            'product_seri_id.exists' => 'Dòng sản phẩm không tồn tại',
            'product_options.required' => 'Vui lòng chọn thuộc tính sản phẩm',
            'product_options.json' => 'Thuộc tính sản phẩm không hợp lệ',
            'thumbnail.required' => 'Vui lòng chọn ảnh bìa',
            'thumbnail.image' => 'Ảnh bìa không hợp lệ',
        ];
    }
}
