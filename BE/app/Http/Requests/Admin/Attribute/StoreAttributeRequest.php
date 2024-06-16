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
            'attribute_values.*.id' => 'nullable',
            'attribute_values.*.value' => 'required|string|max:255',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Vui lòng nhập tên cấu hình',
            'name.string' => 'Tên cấu hình phải là chuỗi',
            'name.max' => 'Tên cấu hình không được quá 255 ký tự',
            'name.unique' => 'Tên cấu hình đã tồn tại',
            'status.required' => 'Vui lòng chọn trạng thái',
            'attribute_values.required' => 'Vui lòng điền giá trị của cấu hình',
            'attribute_values.min' => 'Vui lòng tạo ít nhất 1 cấu hình',
            'attribute_values.*.value.required' => 'Vui lòng nhập giá trị cấu hình',
            'attribute_values.*.value.max' => 'Giá trị cấu hình có độ dài tối đa 255 kí tự',
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
