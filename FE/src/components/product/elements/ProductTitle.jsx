import Link from "next/link";

const ProductTitle = (props) => {
  const CustomTag = "h5";

  return (
    <h5 className="title">
      <Link href={`/products/${props.productTitle.product.id}`}>
        {props.productTitle.product.name + `(${props.productTitle.name})`}
		{props.verified && 
		<span className="verified-icon">
		<i className="fas fa-badge-check" />  
		</span>
		}
      </Link>
    </h5>
  );
};

export default ProductTitle;
