<?php

namespace App\Http\Requests\Admin\ProductOption;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateProductOptionRequest extends FormRequest
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
            'id' => 'required|exists:product_options,id',
            'name' => 'required|string',
            'amount' => 'required|integer',
            'price' => 'required|integer',
            'current_price' => 'required|integer',
            'status' => 'required',
            'product_attribute_values' => 'required|array',
            'product_option_image_file' => 'nullable|array',
            'removed_images' => 'nullable|json',
        ];
    }

    public function messages(): array
    {
        return [
            'id.required' => 'ID không được để trống',
            'id.exists' => 'ID không tồn tại',
            'name.required' => 'Tên không được để trống',
            'name.string' => 'Tên phải là một chuỗi',
            'amount.required' => 'Số lượng không được để trống',
            'amount.integer' => 'Số lượng phải là một số nguyên',
            'price.required' => 'Giá không được để trống',
            'price.integer' => 'Giá phải là một số nguyên',
            'current_price.required' => 'Giá khuyến mãi không được để trống',
            'current_price.integer' => 'Giá khuyến mãi phải là một số nguyên',
            'status.required' => 'Trạng thái không được để trống',
            'product_attribute_values.required' => 'Cấu hình sản phẩm không được để trống',
            'product_attribute_values.array' => 'Cấu hình sản phẩm phải là một mảng',
            'product_option_image_file.array' => 'Ảnh không được để trống',
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
