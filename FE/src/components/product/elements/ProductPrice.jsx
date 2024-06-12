
const ProductPrice = ({ currentPrice, price }) => {
  return (
    <div className="product-price-variant">
      {price ? (
        <span className="price old-price">
          {new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price)}

        </span>
      ) : (
        ""
      )}
      <span className="price current-price">
        {new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(currentPrice)}
      
      </span>
    </div>
  );
}

export default ProductPrice;