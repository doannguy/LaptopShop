'use client';
import Image from "next/image";
import Link from "next/link";
import { useSelector, useDispatch } from "react-redux";
import HeaderOne from "@/components/header/HeaderOne";
import { slugify } from "@/utils";
import { removeCartItem, cartQuantityIncrease, cartQuantityDecrease, cartClear, updateCartAmount } from "@/store/slices/productSlice";
import FooterTwo from "@/components/footer/FooterTwo";
import Currency from "@/components/widget/displayCurrency";
import Loading from "@/components/widget/Loading";
import CartService from "@/services/cart_service";
import Swal from "sweetalert2";
import { toast, ToastContainer } from "react-toastify";

const Cart = () => {
    const dispatch = useDispatch();
    const cartProducts = useSelector((state) => state.productData);

    const removeCartHandler = (cartItem) => {
        Swal.fire({
            title: 'Bạn có muốn xóa sản phẩm này?',
            showCancelButton: true,
            confirmButtonText: '<p style="color: white">Xóa</p>',
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            cancelButtonText: '<p style="color: white">Hủy</p>',
            showCloseButton: true,
            icon: 'warning',
        }).then(async (result) => {
            if (result.isConfirmed) {
                const res = await CartService.update({ quantity: 0, product_option_id: cartItem.product_option_id })
                if (res.code != 0) {
                    toast.error(res.message);
                } else {
                    dispatch(removeCartItem(cartItem));
                }
                dispatch(updateCartAmount())
            }
        })
    }

    const quantityIncreaseHandler = async (cartItem) => {
        dispatch(cartQuantityIncrease(cartItem))
        const res = await CartService.update({ quantity: cartItem.quantity + 1, product_option_id: cartItem.product_option_id })
        if (res.code != 0) {
            if(res.data && res.data.length > 0){
                for (let index = 0; index < res.data.length; index++) {
                    const error = res.data[index];
                    toast.error(error);
                }
            }else {
                toast.error(res.message);
            }
        }
        dispatch(updateCartAmount())
    }
    const quantityDecreaseHandler = async (cartItem) => {
        if (cartItem.quantity > 1) {
            dispatch(cartQuantityDecrease(cartItem))
            const res = await CartService.update({ quantity: cartItem.quantity - 1, product_option_id: cartItem.product_option_id })
            if (res.code != 0) {
                dispatch(cartQuantityIncrease(cartItem))
                if(res.data && res.data.length > 0){
                    for (let index = 0; index < res.data.length; index++) {
                        const error = res.data[index];
                        toast.error(error);
                    }
                }else {
                    toast.error(res.message);
                }
            }
            dispatch(updateCartAmount())
        } else {
            removeCartHandler(cartItem);
        }
    }
   

    return (

        <>
            <HeaderOne />
            <ToastContainer />
            <main className="main-wrapper">
                <div className="axil-product-cart-area axil-section-gap">
                    <div className="container">
                        {cartProducts.isLoadedCart == true ?
                            <>
                                {
                                    cartProducts.cartItems.length > 0 ?
                                        <div className="axil-product-cart-wrap">
                                            <div className="product-table-heading">
                                                <h4 className="title">Giỏ hàng của bạn</h4>
                            
                                            </div>
                                            <div className="table-responsive">
                                                <table className="table axil-product-table axil-cart-table mb--40">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" className="product-remove" />
                                                            <th scope="col" className="product-thumbnail">Tên sản phẩm</th>
                                                            <th scope="col" className="product-title" />
                                                            <th scope="col" className="product-price">Giá</th>
                                                            <th scope="col" className="product-quantity">Số lượng</th>
                                                            <th scope="col" className="product-subtotal">Tổng thành tiền</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {cartProducts.cartItems.map((product) => (
                                                            <tr key={product.id}>
                                                                <td className="product-remove">
                                                                    <button className="remove-wishlist" onClick={() => removeCartHandler(product)}>
                                                                        <i className="fal fa-times" />
                                                                    </button>
                                                                </td>
                                                                <td className="product-thumbnail">
                                                                    <Link href={`/products/${slugify(product.product_id)}`}>
                                                                        <Image
                                                                            src={process.env.NEXT_PUBLIC_APP_URL + "/storage/" + product.thumbnail}
                                                                            unoptimized
                                                                            width={80}
                                                                            height={80}
                                                                            alt={product.name}

                                                                        />
                                                                    </Link>
                                                                </td>
                                                                <td className="product-title">
                                                                    <Link href={`/products/${slugify(product.product_id)}`}>
                                                                        {product.product_name}
                                                                    </Link>
                                                                </td>
                                                                <td className="product-price" data-title="Price">
                                                                    <Currency currency={product.current_price ? product.current_price : product.price} />
                                                                </td>
                                                                <td className="product-quantity" data-title="Qty">
                                                                    <div className="pro-qty">
                                                                        <span className="qtybtn" onClick={() => quantityDecreaseHandler(product)}>-</span>
                                                                        <input type="number" className="quantity-input" value={product.quantity} readOnly />
                                                                        <span className="qtybtn" onClick={() => quantityIncreaseHandler(product)}>+</span>
                                                                    </div>
                                                                </td>
                                                                <td className="product-subtotal" data-title="Subtotal">
                                                                    <Currency currency={parseFloat(product.current_price ? product.current_price * product.quantity : product.price * product.quantity).toFixed(2)} />
                                                                </td>
                                                            </tr>
                                                        ))}

                                                    </tbody>
                                                </table>
                                            </div>
                                            {/* <div className="cart-update-btn-area">
                                                <div className="input-group product-cupon">
                                                    <input placeholder="Nhập mã giảm giá" type="text" />
                                                    <div className="product-cupon-btn">
                                                        <button type="submit" className="axil-btn btn-outline">Áp dụng</button>
                                                    </div>
                                                </div>
                                                
                                            </div> */}
                                            <div className="row">
                                                <div className="col-xl-5 col-lg-7 offset-xl-7 offset-lg-5">
                                                    <div className="axil-order-summery mt--80">
                                                        <div className="summery-table-wrap">
                                                            <table className="table summery-table mb--30">
                                                                <tbody>
                                                                   
                                                                    
                                                                    <tr className="order-total">
                                                                        <td>Tổng cộng</td>
                                                                        <td className="order-total-amount">
                                                                            <Currency currency={cartProducts.cartTotalAmount} />
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <Link href="/checkout" className="axil-btn btn-bg-primary checkout-btn">
                                                            Đặt hàng ngay
                                                        </Link>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> :
                                        <div className="text-center">
                                            <h4>Giỏ hàng hiện đang trống</h4>
                                            <Link className="axil-btn btn-bg-primary" href="/shop">Trở lại cửa hàng</Link>
                                        </div>
                                } </>
                            : <Loading />}

                    </div>
                </div>
            </main>
            <FooterTwo />
        </>
    );
}

export default Cart;