<?php

namespace App\Http\Requests\Admin\Brand;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class DeleteBrandRequest extends FormRequest
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
            'id' => 'required|exists:categories,id',
            'delete_type' => 'required|in:0,1'
        ];
    }

    public function messages()
    {
        return [
            'id.required' => 'Vui lòng chọn mục cần xóa',
            'id.exists' => 'Vui lòng chọn mục cần xóa',
            'delete_type.required' => 'Vui lòng chọn hình thức xóa',
            'delete_type.in' => 'Vui lòng chọn hình thức xóa'
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
