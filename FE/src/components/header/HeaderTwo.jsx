"use client";
import { useState } from "react";
import Link from "next/link";
import { useSelector } from "react-redux";
import Nav from "@/components/header/elements/Nav";
import HeaderTopNotify from "@/components/header/elements/HeaderTopNotify";
import HeaderBrand from "@/components/header/elements/HeaderBrand";
import HeaderActions from "@/components/header/elements/HeaderActions";
import HeaderAsideMenu from "./elements/HeaderAsideMenu";
import CountDown from "@/components/elements/CountDown";
import ProductSearchModal from "./elements/ProductSearchModal";

const HeaderTwo = () => {
  const menuOption = useSelector((state) => state.menu);
  const [searchToggle, setSearchToggle] = useState(false);
  const searchBoxToggleHandler = () => {
    setSearchToggle((toggler) => !toggler);
  };

  return (
    <header className="header axil-header header-style-2">
      
      <div className="axil-header-top">
        <div className="container">
          <div className="row align-items-center">
            <div className="col-lg-2 col-sm-3 col-5">
              <HeaderBrand />
            </div>
            <div className="col-lg-10 col-sm-9 col-7">
              <div className="header-top-dropdown dropdown-box-style">
                <div className="axil-search" onClick={searchBoxToggleHandler}>
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
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="axil-mainmenu aside-category-menu">
        <div className="container">
          <div className="header-navbar">
            <HeaderAsideMenu />
            <div className={`header-main-nav ${menuOption.isMobileMenuOpen ? "open" : ""}`}>
              <Nav />
            </div>
            <HeaderActions />
          </div>
        </div>
      </div>
      {searchToggle && (
        <ProductSearchModal
          toggleHandler={searchBoxToggleHandler}
          toggler={searchToggle}
        />
      )}
    </header>
  );
};

export default HeaderTwo;
