<?php

namespace App\Http\Requests\Api\Auth;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class ChangePasswordRequest extends FormRequest
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
            'current_password' => 'required|string|min:8',
            'password' => 'required|string|min:8|confirmed',
        ];
    }
    public function messages(): array
    {
        return [
            'current_password.required' => 'Mật khẩu hiện tại không được để trống',
            'current_password.string' => 'Mật khẩu hiện tại phải là một chuỗi',
            'current_password.min' => 'Mật khẩu hiện tại phải có ít nhất 8 ký tự',
            'password.required' => 'Mật khẩu mới không được để trống',
            'password.string' => 'Mật khẩu mới phải là một chuỗi',
            'password.min' => 'Mật khẩu mới phải có ít nhất 8 ký tự',
            'password.confirmed' => 'Mật khẩu xác nhận không khớp',
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();

        throw new HttpResponseException(
            jsonResponse(1, $errors)
        );
    }
}
