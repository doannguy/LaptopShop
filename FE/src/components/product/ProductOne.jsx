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
  console.log(productOption);
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
            <h5>{productOption.product.name + `(${productOption.name})`}</h5>
            <ProductPrice currentPrice={productOption.current_price} price={productOption.price} />
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductOne;
