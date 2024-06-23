'use client';
import { useRouter } from 'next/navigation'
import { useState } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useForm } from 'react-hook-form';
import { useSelector, useDispatch } from "react-redux";
import Section from "@/components/elements/Section";
import FooterTwo from "@/components/footer/FooterTwo";
import HeaderFive from "@/components/header/HeaderFive";
import ServiceTwo from "@/components/services/ServiceTwo";
import { addToOrder, cartClear } from '@/store/slices/productSlice';
import Currency from '@/components/widget/displayCurrency';
import Loading from '@/components/widget/Loading';
import { OrderService } from '@/services/order_service';
import Swal from 'sweetalert2';

const Checkout = () => {
    const router = useRouter();
    const dispatch = useDispatch();
    const cartProducts = useSelector((state) => state.productData);
    const [isLoading, setIsLoading] = useState(false);
    const [shipping, setShipping] = useState({
        "type": 0,
        "fee": 0,
    });
    const [paymentMethod, setPaymentMethod] = useState(1);
    const AuthData = useSelector((state) => state.auth);
    const handleChangeShipping = (value) => {
        if (value == 0) {
            setShipping({
                "type": 0,
                "fee": 0,
            })
        } else {
            setShipping({
                "type": 1,
                "fee": 35000,
            })
        }
    }
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm();

    const checkoutFormHandler = async (data, e) => {
        try {
            if (data) {
                setIsLoading(true);
                // router.push('checkout/order-received');
                const dataSend = {
                    first_name: data.firstName,
                    last_name: data.lastName,
                    phone: data.phone,
                    notes: data.notes,
                    address: data.address,
                    shipping_type: shipping.type,
                    shipping_fee: shipping.fee,
                    total_amount: cartProducts.cartTotalAmount + shipping.fee,
                    order_details: cartProducts.cartItems,
                    payment_method: paymentMethod
                }
                const res = await OrderService.store(dataSend);
                if (res.code == 0) {
                    setIsLoading(false);
                    router.push('checkout/order-received');
                    dispatch(cartClear());
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        html: `<div>
                        Đặt hàng thành công
                    </div>`,
                    })
                } else {
                    console.log(res);
                    setIsLoading(false);
                    if (res.data == false) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: res.message,
                        })
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            html: `<div>
                        ${res.data.join('<br/>')}
                    </div>`,
                        })
                    }

                    // window.localStorage.setItem('token', null);

                }
            }
        } catch (error) {
            setIsLoading(false);
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: error.message,
            })
        }
    }

    return isLoading ? <Loading /> : (
        <>
            <HeaderFive headerSlider />
            <main className="main-wrapper">
                <Section pClass="axil-checkout-area">
                    {cartProducts.cartItems.length > 0 ?
                        <form onSubmit={handleSubmit(checkoutFormHandler)}>
                            <div className="row">
                                <div className="col-lg-6">
                                    <div className="axil-checkout-billing">
                                        <h4 className="title mb--40">Thông tin đặt hàng</h4>
                                        <div className="row">
                                            <div className="col-lg-6">
                                                <div className="form-group">
                                                    <label>Họ <span>*</span></label>
                                                    <input type="text" {...register('lastName', { required: true })} placeholder="Nguyễn" />
                                                    {errors.lastName && <p className="error">Bạn chưa nhập họ.</p>}
                                                </div>
                                            </div>
                                            <div className="col-lg-6">
                                                <div className="form-group">
                                                    <label>Tên <span>*</span></label>
                                                    <input type="text" {...register('firstName', { required: true })} placeholder="Đoàn" />
                                                    {errors.firstName && <p className="error">Bạn chưa nhập tên.</p>}
                                                </div>
                                            </div>


                                            {/* <div className="col-lg-12">
                                        <div className="form-group">
                                            <label>Tỉnh thành<span>*</span></label>
                                            <select {...register('country', { required: true })}>
                                                <option value="">Chọn tỉnh của bạn</option>
                                                <option value="Australia">Australia</option>
                                                <option value="Australia">England</option>
                                                <option value="New Zealand">New Zealand</option>
                                                <option value="Switzerland">Switzerland</option>
                                                <option value="United Kindom (UK)">United Kindom (UK)</option>
                                                <option value="United States (USA)">United States (USA)</option>
                                            </select>
                                            {errors.country && <p className="error">Country Name is required.</p>}
                                        </div>
                                    </div>
                                    <div className="col-lg-12">
                                        <div className="form-group">
                                            <label>Huyện<span>*</span></label>
                                            <select {...register('country', { required: true })}>
                                                <option value="">Chọn huyện của bạn</option>
                                                <option value="Australia">Australia</option>
                                                <option value="Australia">England</option>
                                                <option value="New Zealand">New Zealand</option>
                                                <option value="Switzerland">Switzerland</option>
                                                <option value="United Kindom (UK)">United Kindom (UK)</option>
                                                <option value="United States (USA)">United States (USA)</option>
                                            </select>
                                            {errors.country && <p className="error">Country Name is required.</p>}
                                        </div>
                                    </div>
                                    <div className="col-lg-12">
                                        <div className="form-group">
                                            <label>Xã<span>*</span></label>
                                            <select {...register('country', { required: true })}>
                                                <option value="">Chọn xã của bạn</option>
                                                <option value="Australia">Australia</option>
                                                <option value="Australia">England</option>
                                                <option value="New Zealand">New Zealand</option>
                                                <option value="Switzerland">Switzerland</option>
                                                <option value="United Kindom (UK)">United Kindom (UK)</option>
                                                <option value="United States (USA)">United States (USA)</option>
                                            </select>
                                            {errors.country && <p className="error">Country Name is required.</p>}
                                        </div>
                                    </div> */}
                                            <div className="col-lg-12">
                                                <div className="form-group">
                                                    <label>Địa chỉ nhận hàng <span>*</span></label>
                                                    <input type="text" name='address' {...register('address', { required: true })} placeholder="Địa chỉ nhận hàng của bạn" />
                                                    {errors.address && <p className="error">Địa chỉ không được bỏ trống.</p>}
                                                </div>
                                            </div>
                                            <div className="col-lg-12">
                                                <div className="form-group">
                                                    <label>Số điện thoại <span>*</span></label>
                                                    <input type="number" defaultValue={AuthData ? AuthData.userData.phone : ''} {...register('phone', { required: true, maxLength: 11 })} />
                                                    {errors.phone && <p className="error">Số điện thoại tối đa 11 số và không được bỏ trống.</p>}
                                                </div>
                                            </div>
                                            {/* <div className="col-lg-12">
                                                <div className="form-group">
                                                    <label>Địa chỉ Email <span>*</span></label>
                                                    <input type="email" {...register('email', { required: true })} />
                                                    {errors.email && <p className="error">Email không được bỏ trống.</p>}
                                                </div>
                                            </div> */}
                                            {/* <div className="col-lg-12">
                                        <div className="form-group input-group">
                                        <input {...register("createAccount")} id="accountCreate" type="checkbox" value="true" />
                                        <label htmlFor="accountCreate">Create an account</label>
                                        </div>
                                    </div>     */}
                                            <div className="col-lg-12">
                                                <div className="form-group">
                                                    <label>Ghi chú (optional)</label>
                                                    <textarea rows="2" {...register('notes')} placeholder="Ghi chú về đơn hàng của bạn, như ghi chú đặc biệt cho giao hàng."></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="axil-order-summery order-checkout-summery">
                                        <h5 className="title mb--20">Hóa đơn</h5>
                                        <div className="summery-table-wrap">
                                            <table className="table summery-table">
                                                <thead>
                                                    <tr>
                                                        <th>Sản phẩm</th>
                                                        <th>Tổng tiền</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {cartProducts.cartItems.map((items, index) => (
                                                        <tr className="order-product" key={index}>
                                                            <td>{items.product_name} <span className="quantity">x{items.quantity}</span></td>
                                                            <td>
                                                                <Currency currency={items.current_price ? items.current_price : items.price} />
                                                            </td>
                                                        </tr>
                                                    ))}
                                                    <tr className="order-subtotal">
                                                        <td>Tổng cộng</td>
                                                        <td>${cartProducts.cartTotalAmount}</td>
                                                    </tr>
                                                    <tr className="order-shipping">
                                                        <td colSpan={2}>
                                                            <div className="shipping-amount">
                                                                <span className="title">Chọn đơn vị vận chuyển</span>
                                                                <span className="amount">
                                                                    <Currency currency={shipping.fee} />
                                                                </span>
                                                            </div>
                                                            <div className="input-group" onClick={() => handleChangeShipping(0)}>
                                                                <input type="radio" checked={shipping.type == 0} name="shipping" defaultChecked />
                                                                <label htmlFor="radio1" value={0}>Giao hàng tiết kiệm (Miễn Phí)</label>
                                                            </div>
                                                            <div className="input-group" onClick={() => handleChangeShipping(1)}>
                                                                <input type="radio" checked={shipping.type == 1} name="shipping" />
                                                                <label htmlFor="radio2">Giao hàng nhanh
                                                                    <Currency currency={35000} />
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr className="order-total">
                                                        <td>Tổng tiền cần thanh toán</td>
                                                        <td className="order-total-amount">
                                                            <Currency currency={cartProducts.cartTotalAmount + shipping.fee} />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div className="order-payment-method">
                                            <div className="single-payment" onClick={() => setPaymentMethod(0)}>
                                                <div className="input-group" >
                                                    <input type="radio" {...register("paymentMethod")} checked={paymentMethod == 0} id="bank" value="bank" />
                                                    <label htmlFor="bank">Thanh toán qua thẻ ngân hàng</label>
                                                </div>
                                            </div>
                                            <div className="single-payment" onClick={() => setPaymentMethod(1)}>
                                                <div className="input-group">
                                                    <input type="radio" {...register("paymentMethod")} checked={paymentMethod == 1} id="cash" value="cash" />
                                                    <label htmlFor="cash">Thanh toán khi nhận hàng</label>
                                                </div>
                                            </div>
                                            {/* <div className="single-payment">
                                        <div className="input-group justify-content-between align-items-center">
                                            <input type="radio" {...register("paymentMethod")} id="paypal" value="paypal" />
                                            <label htmlFor="paypal">Paypal</label>
                                            <Image 
                                                src="/images/others/payment.png" 
                                                height={28}
                                                width={156}
                                                alt="Paypal payment"
                                            />
                                        </div>
                                        <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                                    </div> */}
                                        </div>
                                        <button type="submit" className="axil-btn btn-bg-primary checkout-btn">Đặt hàng ngay</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        :
                        <div className="text-center">
                            <h4>Không có sản phẩm nào trong giỏ hàng</h4>
                            <Link href="/shop" className="axil-btn btn-bg-primary">Quay lại cửa hàng</Link>
                        </div>
                    }
                </Section>
                <ServiceTwo />
            </main>
            <FooterTwo />
        </>
    );
}

export default Checkout;