import Image from "next/image";
import { useRouter } from 'next/navigation'
import { useDispatch, useSelector } from "react-redux";
import { removeCartItem, miniCartHandler, updateCartAmount } from "@/store/slices/productSlice";
import Currency from "@/components/widget/displayCurrency";
import Swal from "sweetalert2";
import CartService from "@/services/cart_service";

const MiniCart = () => {
const dispatch = useDispatch();
const getProducts = useSelector((state) => state.productData);
const router = useRouter();

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
const cartHandler = (data) => {
  dispatch(miniCartHandler(data));
}

const miniCartFooterBtnHandler = (data) => {
	router.push(data);
	dispatch(miniCartHandler(false));
}

return (
    <>
      <div className={`cart-dropdown ${getProducts.isMinicartOpen ? "open" : ""}`}>
        <div className="cart-content-wrap">
          <div className="cart-header">
            <h2 className="header-title">Giỏ hàng</h2>
            <button
              className="cart-close sidebar-close"
              onClick={() => cartHandler(false)}
            >
              <i className="fas fa-times"></i>
            </button>
          </div>
          <div className="cart-body">
            <ul className="cart-item-list">
              {getProducts.cartItems.length > 0 ? (
                getProducts.cartItems.map((data) => (
                  <li className="cart-item" key={data.id}>
                    <div className="item-img">
						<Image
                        src={"https://api-shop.codetify.tech/storage/" + data.thumbnail}
							alt={data.product_name}
							height={100}
							width={100}
						/>
						<button className="close-btn" onClick={() => removeCartHandler(data)}>
							<i className="fas fa-times"></i>
						</button>
                    </div>
                    <div className="item-content">
                      <h3 className="item-title">
                        {data.product_name}
                      </h3>
                      <div className="item-price">
                        <span className="currency-symbol">$</span>
                        <Currency currency={data.current_price
                          ? data.current_price
                          : data.price} />
                        <strong> x {data.quantity}</strong>
                      </div>
                      <div className="pro-qty item-quantity">
                        <input type="number" className="quantity-input" />
                      </div>
                    </div>
                  </li>
                ))
              ) : (
                <h4 className="text-center">Your cart are empty</h4>
              )}
            </ul>
          </div>
          {getProducts.cartItems.length > 0 ? (
            <div className="cart-footer">
              <h3 className="cart-subtotal">
                <span className="subtotal-title">Tổng tiền:</span>
                <span className="subtotal-amount">
                <Currency currency={getProducts.cartTotalAmount} />
                </span>
              </h3>
              <div className="group-btn">
				<button className="axil-btn btn-bg-primary viewcart-btn" onClick={() => miniCartFooterBtnHandler("/cart")}>View Cart</button>
				<button className="axil-btn btn-bg-secondary checkout-btn" onClick={() => miniCartFooterBtnHandler("/checkout")}>Checkout</button>
              </div>
            </div>
          ) : (
            ""
          )}
        </div>
      </div>
      {getProducts.isMinicartOpen && (
        <div className="closeMask" onClick={() => cartHandler(false)}></div>
      )}
    </>
  );
};

export default MiniCart;
