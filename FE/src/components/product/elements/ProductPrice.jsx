
const ProductPrice = ({ currentPrice, price }) => {
  return (
    <div className="product-price-variant">
      {price ? (
        <span className="price old-price">
          {price}
          <span className="currency-symbol">đ</span>
        </span>
      ) : (
        ""
      )}
      <span className="price current-price">
        {currentPrice}
        <span className="currency-symbol">đ</span>
      </span>
    </div>
  );
}

export default ProductPrice;