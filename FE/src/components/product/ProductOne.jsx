'use client';
import { useState } from "react";
import ProductPrice from "./elements/ProductPrice";
import ProductColorAttribute from "./elements/ProductColorAttribute";
import ProductThumbnail from "./elements/ProductThumbnail";
import ProductTitle from "./elements/ProductTitle";

const ProductOne = ({ productOption, pClass }) => {
  const [colorAttribute, setColorAttribute] = useState('');

  const getAttributeData = (data) => {
    setColorAttribute(data.img);
  }
  return (
    <>
      <div className={`axil-product product-style-one ${pClass ?? ""}`}>
        <ProductThumbnail
          product={productOption}
          attributeImg={colorAttribute}
          discountLabel
          hoverItems
          wishlistBtn
          cartBtn
          quickViewBtn
          isHoverThumbnail
        />
        <div className="product-content">
          <div className="inner">
            <ProductTitle verified={false} productTitle={productOption} />
            <ProductPrice currentPrice={productOption.current_price} price={productOption.price} />
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductOne;
