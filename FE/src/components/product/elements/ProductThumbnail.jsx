import Link from "next/link";
import Image from "next/image";
import ProductDiscountLabel from "./ProductDiscountLabel";
import ActionButtons from "./ActionButtons";

const ProductThumbnail = (props) => {
  return (
    <div className="thumbnail d-flex justify-content-center align-items-center">
      <div style={{ maxWidth: '300px', maxHeight: '300px', height: '100%' }}>
        <Link href={`/products/${props.product.product.id}`}>
          <img
          style={{ 
            height: '200px',
           }}
            src={process.env.NEXT_PUBLIC_APP_URL + "/storage/" + props.product.product_media[0].path}
            className="img-fluid"
            // width={'auto'}
            // height={'auto'}
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
    </div>
  );
};

export default ProductThumbnail;
