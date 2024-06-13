import Currency from "@/components/widget/displayCurrency";

const ProductPrice = ({ currentPrice, price }) => {
  return (
    <div className="product-price-variant">
      {price ? (
        <span className="price old-price">
          <Currency currency={price} />

        </span>
      ) : (
        ""
      )}
      <span className="price current-price">
        <Currency currency={currentPrice} />
      </span>
    </div>
  );
}

export default ProductPrice;