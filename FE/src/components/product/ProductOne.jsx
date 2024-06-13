'use client';
import { useState } from "react";
import ProductPrice from "./elements/ProductPrice";
import ProductColorAttribute from "./elements/ProductColorAttribute";
import ProductThumbnail from "./elements/ProductThumbnail";
import ProductTitle from "./elements/ProductTitle";

const ProductOne = ({ productOption, pClass }) => {

  return (
    <>
      <div
        className={`axil-product product-style-one position-relative overflow-hidden justify-content-stretch d-flex flex-column justify-content-between rounded ${pClass ?? ""}`}
        style={{ boxShadow: "0 0 4px rgb(0 0 0 / 10%)" }}
      >
        <ProductThumbnail
          product={productOption}
          discountLabel
          hoverItems
          wishlistBtn
          cartBtn
          quickViewBtn
          isHoverThumbnail
        />
        <div className="product-content m-0">
          <div className="inner p-4">
            <ProductTitle verified={false} productTitle={productOption} />
            <ProductPrice currentPrice={productOption.current_price} price={productOption.price} />
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductOne;
