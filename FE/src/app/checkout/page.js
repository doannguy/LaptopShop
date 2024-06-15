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
import { addToOrder } from '@/store/slices/productSlice';
import Currency from '@/components/widget/displayCurrency';

const Checkout = () => {
    const router = useRouter();
    const dispatch = useDispatch();
    const [openShippingForm, setopenShippingForm] = useState(false);
    const cartProducts = useSelector((state) => state.productData);

    const ShippingInfoHandler = (e) => {
        setopenShippingForm(e.target.checked)
    }
    const {
        register,
        handleSubmit,
        formState: { errors },
      } = useForm();

    const checkoutFormHandler = (data, e) => {
        if (data) {
            router.push('checkout/order-received');
            dispatch(addToOrder({
                billingAddress: {
                    firstName: data.firstName,
                    lastName: data.lastName,
                    companyName: data.companyName,
                    country: data.country,
                    street1: data.street1,
                    street2: data.street2,
                    city: data.city,
                    phone: data.phone,
                    email: data.email,
                    createAccount: data.createAccount,
                    notes: data.notes,
                    shippingDifferent: data.shippingDifferent,
                    payment: data.paymentMethod
                },
                shippingAdress: data.shippingDifferent === "true" ?  {
                    name: data.shippingName,
                    email: data.shippingEmail,
                    phone: data.shippingPhone,
                    country: data.shippingCountry,
                    street1: data.shippingStreet1,
                    street2: data.shippingStreet2,
                    city: data.shippingCity
                } : null,
                items: cartProducts.cartItems,
                totalAmount: cartProducts.cartTotalAmount,
                totalQuantity: cartProducts.cartQuantityTotal,
                orderDate: new Date().toLocaleString(),
            }));
        }
    }

    return ( 
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
                                            <label>Tên <span>*</span></label>
                                            <input type="text" {...register('firstName', { required: true })} placeholder="Adam" />
                                            {errors.firstName && <p className="error">First Name is required.</p>}
                                        </div>
                                    </div>
                                    <div className="col-lg-6">
                                        <div className="form-group">
                                            <label>Họ <span>*</span></label>
                                            <input type="text" {...register('lastName', { required: true })} placeholder="John" />
                                            {errors.lastName && <p className="error">Last Name is required.</p>}
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
                                            <label>Địa chỉ chi tiết <span>*</span></label>
                                                    <input type="text" {...register('street1', { required: true })} placeholder="Tên xóm, thôn"/>
                                            {errors.street1 && <p className="error">Street Address is required.</p>}
                                        </div>
                                    </div>
                                    <div className="col-lg-12">
                                        <div className="form-group">
                                            <label>Số điện thoại <span>*</span></label>
                                            <input type="number" {...register('phone', { required: true, maxLength: 11 })} />
                                            {errors.phone && <p className="error">Please enter 11 digit phone number.</p>}
                                        </div>
                                    </div>
                                    <div className="col-lg-12">
                                        <div className="form-group">
                                            <label>Địa chỉ Email <span>*</span></label>
                                            <input type="email" {...register('email', { required: true })} />
                                            {errors.email && <p className="error">Email is required.</p>}
                                        </div>
                                    </div>
                                    {/* <div className="col-lg-12">
                                        <div className="form-group input-group">
                                        <input {...register("createAccount")} id="accountCreate" type="checkbox" value="true" />
                                        <label htmlFor="accountCreate">Create an account</label>
                                        </div>
                                    </div>     */}
                                    <div className="col-lg-12">
                                        <div className="form-group">
                                            <label>Ghi chú (optional)</label>
                                            <textarea rows="2" {...register('notes')} placeholder="Notes about your order, e.g. speacial notes for delivery."></textarea>
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
                                                        <span className="amount">$35.00</span>
                                                    </div>
                                                    <div className="input-group">
                                                        <input type="radio" id="radio1" name="shipping" defaultChecked />
                                                        <label htmlFor="radio1">Giao hàng tiết kiệm (Miễn Phí)</label>
                                                    </div>
                                                    <div className="input-group">
                                                        <input type="radio" id="radio2" name="shipping" />
                                                        <label htmlFor="radio2">Giao hàng nhanh </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr className="order-total">
                                                <td>Tổng tiền cần thanh toán</td>
                                                <td className="order-total-amount">
                                                            <Currency currency={cartProducts.cartTotalAmount}/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div className="order-payment-method">
                                    <div className="single-payment">
                                        <div className="input-group">
                                            <input type="radio" {...register("paymentMethod")} id="bank" value="bank" />
                                            <label htmlFor="bank">Thanh toán qua thẻ ngân hàng</label>
                                        </div>
                                    </div>
                                    <div className="single-payment">
                                        <div className="input-group">
                                            <input type="radio" {...register("paymentMethod")} id="cash" value="cash" />
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
                    <h4>There is no item for checkout</h4>
                    <Link href="/shop" className="axil-btn btn-bg-primary">Back to shop</Link>
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