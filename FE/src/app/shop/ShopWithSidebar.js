'use client';
import Section from "@/components/elements/Section";
import ProductOne from "@/components/product/ProductOne";
import Loading from "@/components/widget/Loading";
import ProductService from "@/services/product_service";
import { useQuery } from "@tanstack/react-query";
import { useEffect, useState } from "react";


const ShopWithSidebar = (props) => {
    const [cateToggle, setcateToggle] = useState(true);
    const [seriToggle, setseriToggle] = useState(true);
    const [brandToggle, setbrandToggle] = useState(true);

    const [productList, setProductList] = useState([]);
    const [filterData, setFilterData] = useState({
        brand: props.brand,
        product_seri: props.seriFilter,
        category: props.category,
        page: 1,
        pageSize: 10,
        orderBy: 'id',
        orderDir: 'desc',
        search: '',
    });

    const { data, error, isLoading, isFetching, refetch, isSuccess } = useQuery({
        queryKey: ["get-product-list"],
        queryFn: () => ProductService.getListProduct(filterData),
        refetchOnWindowFocus: false,
        refetchOnMount: false,
        refetchOnReconnect: false,
    });

    const handleFetchData = () => {
        const newProductList = data?.data?.products || [];
        if (filterData.page > 1) {
            setProductList(prevList => [...prevList, ...newProductList]);
        } else {
            setProductList(newProductList);
        }
    }

    useEffect(() => {
        handleFetchData();
    }, [data]);

    useEffect(() => {
        refetch();
    }, [filterData]);

    useEffect(() => {
        if (props.isFilterChange) {
            console.log("refetch");
            setProductList([]);
            props.setIsFilterChange(false);
            refetch();
        }
    }, [props])

    const handleFilterChange = (key, value) => {
        if (key === 'sort') {
            let orderBy = 'id';
            let orderDir = 'desc';

            switch (value) {
                case 'default':
                    orderBy = 'id';
                    orderDir = 'desc';
                    break;
                case 'price_asc':
                    orderBy = 'price';
                    orderDir = 'asc';
                    break;
                case 'price_desc':
                    orderBy = 'price';
                    orderDir = 'desc';
                    break;
                case 'name_asc':
                    orderBy = 'name';
                    orderDir = 'asc';
                    break;
                case 'name_desc':
                    orderBy = 'name';
                    orderDir = 'desc';
                    break;
            }

            setFilterData(prev => ({ ...prev, orderBy: orderBy, orderDir: orderDir, page: 1 }));
        } else {
            setFilterData(prev => ({ ...prev, [key]: value }));
        }
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
                                                    <button onClick={() => handleFilterChange('category', item.id)}>{item.label + ` (${item.count})`}</button>
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                }
                            </div>
                            {/* seri Filter */}
                            <div className={`toggle-list product-categories ${data.data.seriCount.length > 0 ? "active" : ""}`}>
                                <h6 onClick={() => setseriToggle(!seriToggle)} className="title">Dòng sản phẩm</h6>
                                {seriToggle &&
                                    <div className="shop-submenu">
                                        <ul>
                                            {data.data.seriCount.map((item, index) => (
                                                <li className={props.seriFilter === item.id ? "current-cat" : ""} key={index}>
                                                    <button onClick={() => handleFilterChange('product_seri', item.id)}>{item.label + ` (${item.count})`}</button>
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
                                                    <button onClick={() => handleFilterChange('brand', item.id)}>{item.label + ` (${item.count})`}</button>
                                                </li>
                                            ))}
                                        </ul>
                                    </div>
                                }
                            </div>

                        </div>
                    </div>
                    <div className="col-lg-9">
                        <div className="d-flex w-100 justify-content-end mb-5">
                            <div>
                                <select className="single-select" onChange={(e) => handleFilterChange('sort', e.target.value)}>
                                    <option value="default">Mặc định</option>
                                    <option value="price_asc">Giá tăng dần</option>
                                    <option value="price_desc">Giá giảm dần</option>
                                    <option value="name_asc">Tên từ A-Z</option>
                                    <option value="name_desc">Tên từ Z-A</option>
                                </select>
                            </div>
                        </div>
                        <div className="row row--15">
                            {productList.length ? productList.map((productOption, index) => (
                                <div className="col-xl-4 col-sm-6 d-flex" key={index}>
                                    <ProductOne productOption={productOption} pClass="mb--30" />
                                </div>
                            )) : <h4 className="text-center pt--30">Không tìm thấy sản phẩm nào phù hợp</h4>}
                        </div>
                        <div className="text-center pt--20">
                            {
                                (filterData.page < data.data.totalPages) &&
                                <button className={`axil-btn btn-bg-lighter btn-load-more `} onClick={() => handleFilterChange('page', filterData.page + 1)}>Xem thêm</button>
                            }

                        </div>
                    </div>
                </div>

            </Section>
    );
}

export default ShopWithSidebar;