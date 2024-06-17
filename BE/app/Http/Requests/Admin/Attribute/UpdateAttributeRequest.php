<?php

namespace App\Http\Requests\Admin\Attribute;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateAttributeRequest extends FormRequest
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
            'id' => 'required|exists:attributes,id',
            'name' => 'required|string|max:255',
            'status' => 'required|in:0,1',
            'attribute_values' => 'required|array|min:1',
            'attribute_values.*.id' => 'nullable',
            'attribute_values.*.value' => 'required|string|max:255',
        ];
    }

    public function messages(): array
    {
        return [
            'id.required' => 'Vui lòng chọn cấu hình cần sửa',
            'id.exists' => 'Cấu hình không tại',
            'name.required' => 'Vui lòng điền tên cấu hình',
            'name.max' => 'Tên cấu hình nhiều nhat 255 kiểu',
            'status.required' => 'Vui lòng chọn trạng thái của cấu hình',
            'status.in' => 'Trạng thái cấu hình không tồn tại',
            'attribute_values.required' => 'Vui lòng điền giá trị của cấu hình',
            'attribute_values.min' => 'Vui lòng điền ít nhất 1 giá trị',
            'attribute_values.*.value.required' => 'Vui lòng nhập giá trị cấu hình',
            'attribute_values.*.value.max' => 'Giá trị cấu hình có độ dài tối đa 255 kí tự',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
