<?php

namespace App\Http\Requests\Admin\ProductOption;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreProductOptionRequest extends FormRequest
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
            'name' => 'required|string',
            'product_id' => 'required|exists:products,id',
            'amount' => 'required|integer',
            'price' => 'required|integer',
            'current_price' => 'required|integer',
            'status' => 'required',
            'product_attribute_values' => 'required|array',
            'product_option_image_file' => 'required|array',
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Tên không được để trống',
            'name.string' => 'Tên phải là chuỗi',
            'product_id.required' => 'Sản phẩm không được để trống',
            'product_id.exists' => 'Sản phẩm không tồn tại',
            'amount.required' => 'Số lượng không được để trống',
            'amount.integer' => 'Số lượng phải là số nguyên',
            'price.required' => 'Giá gốc không được để trống',
            'price.integer' => 'Giá gốc phải là số nguyên',
            'current_price.required' => 'Giá bán không được để trống',
            'current_price.integer' => 'Giá bán phải là số nguyên',
            'status.required' => 'Trạng thái không được để trống',
            'product_attribute_values.required' => 'Cấu hình sản phẩm không được để trống',
            'product_attribute_values.array' => 'Cấu hình sản phẩm không hợp lệ',
            'product_option_image_file.required' => 'Hình ảnh không được để trống',
            'product_option_image_file.array' => 'Hình ảnh không hợp lệ',
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
