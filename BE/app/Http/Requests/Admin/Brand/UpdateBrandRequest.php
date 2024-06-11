<?php

namespace App\Http\Requests\Admin\Brand;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateBrandRequest extends FormRequest
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
            'id' => 'required|exists:brands,id',
            'name' => 'required|string|max:255|unique:brands,name,' . $this->id, // Ignore self
        ];
    }

    public function messages()
    {
        return [
            'id.required' => 'Vui lòng chọn thương hiệu',
            'id.exists' => 'Thương hiệu không tồn tại',
            'name.required' => 'Vui lòng nhập tên thương hiệu',
            'name.unique' => 'Tên thương hiệu đã tồn tại',
            'name.max' => 'Tên thương hiệu tối đa 255 ký tự',
            'name.string' => 'Tên thương hiệu phải là chuỗi',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
