<?php

namespace App\Http\Requests\Admin\User;

use App\Models\User;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;

class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize()
    {
        $currentUserId = Auth::id();
        $inputUserId = $this->input('id');

        return $inputUserId != $currentUserId;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'id' => 'required|exists:users,id|except:' . auth()->user()->id,
            'role' => 'required|exists:roles,name',
            'status' => 'required|in:' . implode(',', [User::STATUS_ACTIVE, User::STATUS_INACTIVE]),
        ];
    }

    public function messages()
    {
        return [
            'id.required' => 'Vui lòng chọn người dùng',
            'id.exists' => 'Người dùng không tồn tại trong hệ thống',
            'role.required' => 'Vui lòng chọn vai trò',
            'role.exists' => 'Vai trò không tồn tại',
            'status.required' => 'Vui lòng chọn trạng thái',
            'status.in' => 'Trạng thái không hợp lệ',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();
        throw new HttpResponseException(jsonResponse(1, $errors));
    }

    public function failedAuthorization()
    {
        $errors = ['Bạn không thể chỉnh sửa thông tin của chính bạn'];
        throw new HttpResponseException(jsonResponse(1, $errors));
    }
}
