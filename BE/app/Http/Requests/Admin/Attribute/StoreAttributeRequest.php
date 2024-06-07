<?php

namespace App\Http\Requests\Admin\Attribute;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreAttributeRequest extends FormRequest
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
            'name' => 'required|string|max:255|unique:attributes,name',
            'status' => 'required|in:0,1',
            'attribute_values' => 'required|array|min:1',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Vui lòng nhập tên thuộc tính',
            'name.string' => 'Tên thuộc tính phải là chuỗi',
            'name.max' => 'Tên thuộc tính không được quá 255 ký tự',
            'name.unique' => 'Tên thuộc tính đã tồn tại',
            'status.required' => 'Vui lòng chọn trạng thái',
            'attribute_values.required' => 'Vui lòng chọn thuộc tính',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors();

        throw new HttpResponseException(
            jsonResponse(1, $errors->all(), "Thông tin không hợp lệ")
        );
    }
}
