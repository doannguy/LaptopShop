<?php

namespace App\Http\Requests\Api\Order;

use App\Rules\PhoneNumberRule;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreOrderRequest extends FormRequest
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
            'first_name' => 'required',
            'last_name' => 'required',
            'phone' => ['required', 'numeric', new PhoneNumberRule()],
            'address' => 'required',
            'notes' => 'nullable',
            'shipping_type' => 'required|in:0,1',
            'shipping_fee' => 'required|numeric',
            'payment_method' => 'required|in:0,1',
            'order_details' => 'required|array',
            'order_details.*.product_option_id' => 'required|exists:product_options,id',
            'order_details.*.price' => 'required|numeric',
            'total_amount' => 'required|numeric',
        ];
    }
    function message() {
        return [
            'first_name.required' => 'Vui lòng nhập họ',
            'last_name.required' => 'Vui lòng nhập tên',
            'phone.required' => 'Vui lòng nhập số điện thoại',
            'phone.numeric' => 'Số điện thoại không hợp lệ',
            'address.required' => 'Vui lòng nhập địa chỉ',
            'shipping_type.required' => 'Vui lòng chọn phương thức giao hàng',
            'shipping_fee.required' => 'Vui lòng nhập phí giao hàng',
            'shipping_fee.numeric' => 'Phí giao hàng không hợp lệ',
            'payment_method.required' => 'Vui lòng chọn phương thức thanh toán',
            'order_details.required' => 'Vui lòng chọn sản phẩm',
            'order_details.*.product_option_id.required' => 'Vui lòng nhập sản phẩm',
            'order_details.*.product_option_id.exists' => 'Sản phẩm không tồn tại',
            'order_details.*.price.required' => 'Vui lòng nhập giá sản phẩm',
            'order_details.*.price.numeric' => 'Giá sản phẩm không hợp lệ',
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors()->all();

        throw new HttpResponseException(jsonResponse(0, $errors));
    }
}
