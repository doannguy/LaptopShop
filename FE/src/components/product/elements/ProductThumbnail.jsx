import Link from "next/link";
import Image from "next/image";
import ProductDiscountLabel from "./ProductDiscountLabel";
import ActionButtons from "./ActionButtons";

const ProductThumbnail = (props) => {
  
  return (
    <div className="thumbnail">
      <Link href={`/products/${props.product.id}`}>
        <Image
          src={
            "https://api-shop.codetify.tech/storage/"+props.product.product_media[0].path
          }
          width={props.width ?? 300}
          height={props.height ?? 300}
          alt={props.product.name}
        />
      </Link>

      <div className="product-hover-action">
        <ActionButtons
          // productAction={props.productThumb}
          // wishlistBtn={props.wishlistBtn}
          // cartBtn={props.cartBtn}
          // quickViewBtn={props.quickViewBtn}
        />
      </div>
    </div>
  );
};

export default ProductThumbnail;
