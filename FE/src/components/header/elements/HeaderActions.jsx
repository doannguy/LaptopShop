import Link from "next/link";
import { useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import ProductSearchModal from "@/components/header/elements/ProductSearchModal";
import MiniCart from "@/components/header/elements/MiniCart";
import { miniCartHandler } from "@/store/slices/productSlice";
import { mobileMenu } from "@/store/slices/menuSlice";
import React, { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import CartService from "@/services/cart_service";
import { updateCart } from "@/store/slices/productSlice";

const HeaderActions = (props) => {
  const [searchToggle, setSearchToggle] = useState(false);
  const [accountDropdown, setaccountDropdown] = useState(false);
  const [isLogin, setIsLogin] = useState(false);
  const router = useRouter();
  const getProducts = useSelector((state) => state.productData);
  const dispatch = useDispatch();

  useEffect(() => {
    if (window.localStorage.getItem('token') != null) {
      setIsLogin(true);
      console.log(getProducts.isLoadedCart);
      if (getProducts.isLoadedCart == false) {
        loadCart();
      }
    } else {
      setIsLogin(false);
    }
  }, []);

  const loadCart = async () => {
    const res = await CartService.get();
    if(res.code == 0) {
      dispatch(updateCart({ cartItems: res.data }));
    }else {
      toast.error("Lỗi lấy thông tin giỏ hàng");
      window.localStorage.setItem('token', null);
      router.push('/sign-in');
    }
  }




 
  const searchBoxToggleHandler = () => {
    setSearchToggle((toggler) => !toggler);
  };
  const accountDropdownToggler = () => {
    setaccountDropdown((toggler) => !toggler);
  };
  const cartHandler = (data) => {
    dispatch(miniCartHandler(data));
  }

  const mobileMneuHandler = (data) => {
    dispatch(mobileMenu(data))
  }

  const logOut = () => {
    window.localStorage.removeItem('token');
    router.push('/sign-in');
  }

  return (
    <div className="header-action">
      <ul className="action-list">
        {props.searchBox && (
          <li className="axil-search" onClick={searchBoxToggleHandler}>
            <input
              type="search"
              className="placeholder product-search-input"
              name="search2"
              placeholder="Bạn muốn tìm kiếm?"
              autoComplete="off"
            />
            <button type="submit" className="icon wooc-btn-search">
              <i className="far fa-search" />
            </button>
          </li>
        )}
        {props.searchIcon && (
          <li className="axil-search axil-search-icon">
            <button
              className="header-search-icon"
              onClick={searchBoxToggleHandler}
            >
              <i className="far fa-search" />
            </button>
          </li>
        )}

        <li className="wishlist">
          <Link href="/wishlist">
            {getProducts.wishListQuantity > 0 &&
              <span className="cart-count">{getProducts.wishListQuantity}</span>
            }
            <i className="far fa-heart" />
          </Link>
        </li>
        <li className="shopping-cart">
          <button className="cart-dropdown-btn" onClick={() => cartHandler(true)}>
            <span className="cart-count">{getProducts.cartQuantityTotal}</span>
            <i className="far fa-shopping-cart" />
          </button>
        </li>
        <li className="my-account">
          <button onClick={accountDropdownToggler}>
            <i className="far fa-user" />
          </button>
          <div
            className={`my-account-dropdown ${accountDropdown ? "open" : ""}`}
          >
            <span className="title">Liên kết nhanh</span>
            <ul>
              <li>
                <Link href="/dashboard">Tài khoản của tôi</Link>
              </li>
              <li>
                <Link href="dashboard/orders">Chi tiết đơn hàng</Link>
              </li>
              <li>
                <Link href="dashboard/account-details">Cài đặt</Link>
              </li>
            </ul>

            {isLogin ? <div className="login-btn">
              <button onClick={() => logOut()} className="axil-btn btn-bg-primary">
                Đăng xuất
              </button>
            </div> : <div className="login-btn">
              <Link href="/sign-in" className="axil-btn btn-bg-primary">
                Đăng nhập
              </Link>
            </div>}
            <div className="reg-footer text-center">
              Bạn không có tài khoản?
              <Link href="/sign-up" className="btn-link">
                ĐĂNG KÝ NGAY.
              </Link>
            </div>
          </div>
        </li>
        <li className="axil-mobile-toggle">
          <button className="menu-btn mobile-nav-toggler" onClick={() => mobileMneuHandler(true)}>
            <i className="fal fa-bars"></i>
          </button>
        </li>
      </ul>
      <MiniCart />
      {(props.searchIcon || props.searchBox) && (
        <ProductSearchModal
          toggleHandler={searchBoxToggleHandler}
          toggler={searchToggle}
        />
      )}
    </div>
  );
};

export default HeaderActions;
