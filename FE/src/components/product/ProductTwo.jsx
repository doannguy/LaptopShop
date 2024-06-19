'use client';
import ProductThumbnail from "./elements/ProductThumbnail";
import ProductTitle from "./elements/ProductTitle";
import ProductPrice from "./elements/ProductPrice";
import ActionButtons from "./elements/ActionButtons";

const ProductTwo = ({productOption}) => {
  
    return (
      <div className="axil-product product-style-two">
        <ProductThumbnail 
        product={productOption}
        discountLabel 
        isHoverThumbnail
        />
        
        <div className="product-content">
          <div className="inner">
            <ProductTitle productTitle={productOption}/>
            <ProductPrice currentPrice={productOption.current_price} price={productOption.price} />
            <ActionButtons 
            productAction={productOption}
            
            cartBtn
            
            />
          </div>
        </div>
      </div>
    );
}
 
export default ProductTwo;