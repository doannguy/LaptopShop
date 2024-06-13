'use client';
import Link from "next/link";
import { useCallback, useState } from "react";
import ProductsData from "@/data/Products";
import ProductThumbnail from "@/components/product/elements/ProductThumbnail";
import ProductTitle from "@/components/product/elements/ProductTitle";
import ProductPrice from "@/components/product/elements/ProductPrice";
import ProductRating from "@/components/product/elements/ProductRating";
import ActionButtons from "@/components/product/elements/ActionButtons";
import ProductService from "@/services/product_service";
import _ from 'lodash';

const ProductSearchModal = (props) => {
  const getProducts = ProductsData;
  const [productQuery, setProductQuery] = useState([]);
  const [query, setQuery] = useState('');
 

  const debounceSearch = useCallback(
    _.debounce(async (searchQuery) => {
      if (searchQuery.length > 0) {
        const res = await ProductService.getListProduct({ search: searchQuery, pageSize: 10 });
        let matchingData = res.data.products;
        setProductQuery(matchingData);
      } else {
        setProductQuery([]);
      }
    }, 500),
    []
  );
  const handleChange = (e) => {
    const value = e.target.value;
    setQuery(value);
    debounceSearch(value);
  };

  return (
    <>
      <div className={`header-search-modal ${props.toggler ? "open" : ""}`}>
        <button
          className="card-close sidebar-close"
          onClick={props.toggleHandler}
        >
          <i className="fas fa-times" />
        </button>
        <div className="header-search-wrap">
          <div className="card-header">
            <div className="input-group">
              <input
                type="search"
                className="form-control"
                placeholder="Write Something...."
                onChange={handleChange}
              />
              <button className="axil-btn btn-bg-primary">
                <i className="far fa-search" />
              </button>
            </div>
          </div>
          <div className="card-body">
            <div className="search-result-header">
              <h6 className="title">{productQuery.length} Result Found</h6>
              <Link href={"/shop?search="+query}>View All</Link>
            </div>
            <div className="psearch-results">
              {productQuery &&
                productQuery.map((data) => (
                  <div className="axil-product-list" key={data.id}>
					<div onClick={props.toggleHandler}>
						<ProductThumbnail
						product={data}
						width={120}
						height={120}
						/>
					</div>
                    <div className="product-content">
                      <ProductRating rating={data} />
					  <div onClick={props.toggleHandler}>
                      	<ProductTitle productTitle={data} titleTag="h6" />
					  </div>
                      <ProductPrice currentPrice={data.current_price} price={data.price} />
					  <ActionButtons productAction={data} wishlistBtn cartBtn/>
                    </div>
                  </div>
                ))}
            </div>
          </div>
        </div>
      </div>
      {props.toggler ? (
        <div className="closeMask" onClick={props.toggleHandler}></div>
      ) : (
        ""
      )}
    </>
  );
};

export default ProductSearchModal;
