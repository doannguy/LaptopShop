"use client";
import Link from "next/link";
import { useEffect, useRef } from "react";
import { useSelector } from "react-redux";
import Nav from "@/components/header/elements/Nav";
import HeaderTopNotify from "@/components/header/elements/HeaderTopNotify";
import HeaderQuickLink from "@/components/header/elements/HeaderQuickLink";
import HeaderBrand from "@/components/header/elements/HeaderBrand";
import HeaderActions from "@/components/header/elements/HeaderActions";

const HeaderOne = () => {
  const axilHeader = useRef();
  const axilPlaceholder = useRef();
  const axilMainmenu = useRef();
  const menuOption = useSelector((state) => state.menu);

  useEffect(() => {
    const headerHeight = axilHeader.current.clientHeight;
    const mainMenu = axilMainmenu.current;
    const mainMenuHeight = axilMainmenu.current.clientHeight;
    const mainmenuPlaceholder = axilPlaceholder.current;
    window.addEventListener("scroll", (event) => {
      if (window.scrollY > headerHeight) {
        mainmenuPlaceholder.style.height = mainMenuHeight + 'px';
        mainMenu.classList.add("axil-sticky");
      } else {
        mainmenuPlaceholder.style.height = '0';
        mainMenu.classList.remove("axil-sticky");
      }
    });
  }, []);

  return (
    <header className="header axil-header header-style-1" ref={axilHeader}>
    

      <div className="axil-header-top">
        <div className="container">
          <div className="row align-items-center">
            <div className="col-sm-6">
              <div className="header-top-dropdown">
              </div>
            </div>
            <div className="col-sm-6">
              <HeaderQuickLink />
            </div>
          </div>
        </div>
      </div>
      <div id="axil-sticky-placeholder" ref={axilPlaceholder} />
      <div className="axil-mainmenu" ref={axilMainmenu}>
        <div className="container">
          <div className="header-navbar">
            <HeaderBrand />
            <div className={`header-main-nav ${menuOption.isMobileMenuOpen ? "open" : ""}`}>
              <Nav />
            </div>
            <HeaderActions searchIcon />
          </div>
        </div>
      </div>
    </header>
  );
};

export default HeaderOne;
