"use client";
import Link from "next/link";
import { useDispatch, useSelector } from "react-redux";
import {
  addToCart,
  addToWishlist,
  addToQuickView,
  updateCart,
} from "@/store/slices/productSlice";
import CardService from "@/services/cart_service";
import Swal from "sweetalert2";

const ActionButtons = (props) => {
  const dispatch = useDispatch();
  const getWishlist = useSelector((state) => state.productData.wishlistItems);
  const isWishlistAdded = getWishlist.filter((data) => data.id === props.productAction.id);

  const cartDatas = useSelector((state) => state.productData.cartItems);

  const handleAddToCart = async (product) => {
    try {
      const existQuantity = cartDatas.find((data) => data.product_option_id === product.id)?.quantity || 0;
      const res = await CardService.update({ quantity: 1 + existQuantity, product_option_id: product.id });
      if (res.code == 0) {
        dispatch(updateCart({ cartItems: res.data }));
        Swal.fire({
         
          icon: 'success',
          title: 'Đã thêm vào giỏ hàng',
          showConfirmButton: false,
          timer: 1500
        })
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: res.message
        })
      }
    } catch (error) {
      console.log(error);
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng'
      })
    }
  };


  const handleAddToWishlist = (product) => {
    dispatch(addToWishlist(product));
  };

  const quickViewHandler = (product) => {
    dispatch(addToQuickView({
      viewItem: product,
      quickView: true
    }));
  };

  return (
    <ul className="cart-action">
      {props.wishlistBtn && props.productAction.pCate !== "NFT" && (
        <li className="wishlist">
          <button onClick={() => handleAddToWishlist(props.productAction)}>
		  <i className={isWishlistAdded.length === 1 ? "fas fa-heart" : "far fa-heart"} />
          </button>
        </li>
      )}
      {props.cartBtn && (
        <li className="select-option">
          {props.productAction.pCate === "NFT" || props.productAction.productType === "variable" ? (
            <Link href={`/products/${props.productAction.id}`}>
              Buy Product
            </Link>
          ) : (
            <button onClick={() => handleAddToCart(props.productAction)}>
              Thêm vào giỏ hàng
            </button>
          )}
        </li>
      )}
      {props.quickViewBtn && props.productAction.pCate !== "NFT" && (
        <li className="quickview">
          <button onClick={() => quickViewHandler(props.productAction)}>
            <i className="far fa-eye" />
          </button>
        </li>
      )}
    </ul>
  );
};

export default ActionButtons;
