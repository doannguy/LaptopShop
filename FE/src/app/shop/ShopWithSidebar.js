'use client';
import Section from "@/components/elements/Section";
import ProductOne from "@/components/product/ProductOne";
import Loading from "@/components/widget/Loading";
import ProductsData from "@/data/Products";
import ProductService from "@/services/product_service";
import { slugify } from "@/utils";
import { useQuery } from "@tanstack/react-query";
import { useEffect, useState } from "react";
import { useSearchParams, useRouter, usePathname } from "next/navigation";


const ShopWithSidebar = (props) => {

    const [cateToggle, setcateToggle] = useState(true);
    const [seriToggle, setseriToggle] = useState(true);
    const [brandToggle, setbrandToggle] = useState(true);

    const params = useSearchParams();
    const pathname = usePathname();
    const router = useRouter();
    const [page, setPage] = useState(1);
    const [pageSize, setPageSize] = useState(10);
    const [productList, setProductList] = useState([]);
    const { data, error, isLoading, isFetching, refetch, isSuccess } = useQuery({
        queryKey: ["get-product-list"],
        queryFn: () => ProductService.getListProduct({ brand: props.brand, product_seri: props.seriFilter, category: props.category, page, pageSize }),
        refetchOnWindowFocus: false,
        refetchOnMount: false,
        refetchOnReconnect: false,

    }
    );
    const handleFetchData = () => {

        if (data) {
            const newProductList = data.data.products;
            const newProducts = newProductList.filter(
                product => !productList.some(p => p.id === product.id)
            );
            setProductList(prevList => [...prevList, ...newProducts]);
        }
    }


    useEffect(() => {
        if (isSuccess && !isFetching) {
            handleFetchData();
        }
    }, [isFetching]);

    useEffect(() => {
        refetch();
    }, [page]);

    useEffect(() => {
        if (props.isFilterChange) {
            console.log("refetch");
            setPage(1);
            setProductList([]);
            props.setIsFilterChange(false);
            refetch();
        }
    }, [props])
    const seriHandler = (seriSelect) => {
        let urlParams = new URLSearchParams(params.toString());
        urlParams.set("seri", seriSelect);
        router.push(pathname + "?" + urlParams.toString());
    }
    const categoryHandler = (cateSelect) => {
        let urlParams = new URLSearchParams(params.toString());
        urlParams.set("category", cateSelect);
        router.push(pathname + "?" + urlParams.toString());
    }
    const brandHandler = (brandSelect) => {
        let urlParams = new URLSearchParams(params.toString());
        urlParams.set("brand", brandSelect);
        router.push(pathname + "?" + urlParams.toString());
    }

    const ProductShowHandler = () => {
        setPage(page + 1);
    }




    return (
        isLoading || !data ? <>
            <Loading />
        </> : 
        <Section pClass="axil-shop-area">
            <div className="row">
                <div className="col-lg-3">
                    <div className="axil-shop-sidebar">
                        <div className="d-lg-none">
                            <button className="sidebar-close filter-close-btn"><i className="fas fa-times" /></button>
                        </div>
                            {/* category Filter */}
                            <div className={`toggle-list product-categories ${data.data.cateCount.length > 0 ? "active" : ""}`}>
                                <h6 onClick={() => setcateToggle(!cateToggle)} className="title">Danh mục</h6>
                                {cateToggle &&
                                    <div className="shop-submenu">
                                        <ul>
                                            {data.data.cateCount.map((item, index) => (
                                                <li className={props.seriFilter === item.id ? "current-cat" : ""} key={index}>
                                                    <button onClick={() => categoryHandler(item.id)}>{item.label + ` (${item.count})`}</button>
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                }
                            </div>
                        {/* seri Filter */}
                        <div className={`toggle-list product-categories ${data.data.seriCount.length  > 0 ? "active" : ""}`}>
                            <h6 onClick={() => setseriToggle(!seriToggle)} className="title">Dòng sản phẩm</h6>
                                {seriToggle &&
                                <div className="shop-submenu">
                                    <ul>
                                        {data.data.seriCount.map((item, index) => (
                                            <li className={props.seriFilter === item.id ? "current-cat" : ""} key={index}>
                                                <button onClick={() => seriHandler(item.id)}>{item.label + ` (${item.count})`}</button>
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                            }
                        </div>
                        {/* Brand Filter */}
                        <div className={`toggle-list product-categories ${data.data.brandCount.length > 0 ? "active" : ""}`}>
                            <h6 onClick={() => setbrandToggle(!brandToggle)} className="title">Thương hiệu</h6>
                                {brandToggle &&
                                <div className="shop-submenu">
                                    <ul>
                                        {data.data.brandCount.map((item, index) => (
                                            <li className={props.seriFilter === item.id ? "current-cat" : ""} key={index}>
                                                <button onClick={() => brandHandler(item.id)}>{item.label + ` (${item.count})`}</button>
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                            }
                        </div>

                    </div>
                </div>
                <div className="col-lg-9">
                    <div className="row row--15">
                        {data && productList.length > 0 ? productList.map((productOption, index) => (
                            <div className="col-xl-4 col-sm-6" key={index}>
                                <ProductOne productOption={productOption} pClass="mb--30" />
                            </div>
                        )) : <h4 className="text-center pt--30">Không tìm thấy sản phẩm nào phù hợp</h4>}
                    </div>
                    <div className="text-center pt--20">
                        {
                            (page < data.data.totalPages) &&
                            <button className={`axil-btn btn-bg-lighter btn-load-more `} onClick={ProductShowHandler}>Xem thêm</button>
                        }

                    </div>
                </div>
            </div>

        </Section>
    );
}

export default ShopWithSidebar;