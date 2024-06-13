"use client";
import Breadcrumb from "@/components/breadcrumb/Breadcrumb";
import FooterTwo from "@/components/footer/FooterTwo";
import HeaderFive from "@/components/header/HeaderFive";
import NewsLetter from "@/components/newsletter/NewsLetter";
import ServiceTwo from "@/components/services/ServiceTwo";
import ShopNoSidebar from "./ShopNoSidebar";
import ShopWithSidebar from "./ShopWithSidebar";
import { useSearchParams } from "next/navigation";
import { useEffect, useState } from "react";
import Loading from "@/components/widget/Loading";

const Shop = ({ searchParams }) => {
    const router = useSearchParams();
    const [brand, setBrand] = useState(null);
    const [seriFilter, setSeriFilter] = useState("");
    const [categoryFilter, setCategoryFilter] = useState("");
    const [isFilterChange, setIsFilterChange] = useState(false);
    const [isReady, setIsReady] = useState(false);
    useEffect(() => {
        if (router.get("seri")) {
            setSeriFilter(router.get("seri"));
        }else {
            setSeriFilter("");
        }
        if(router.get("brand")) {
            setBrand(router.get("brand"));
        }else {
            setBrand("");
        }
        if(router.get("category")) {
            setCategoryFilter(router.get("category"));
        }else {
            setCategoryFilter("");
        }
        setIsFilterChange(true);
        setIsReady(true);

    }, [router.isReady, router.get("brand"), router.get("seri"), router.get("category")]);

    return (
        <>
            {
                !isReady ? <Loading />
                    : <>
                        <HeaderFive headerCampaign />
                        <Breadcrumb activeItem="Shop" title="Danh sách sản phẩm" />
                        <main className="main-wrapper">
                            <ShopWithSidebar brand={brand} seriFilter={seriFilter} category={categoryFilter} isFilterChange={isFilterChange} setIsFilterChange={setIsFilterChange}/>
                            <NewsLetter />
                            <ServiceTwo />
                        </main>
                        <FooterTwo />
                    </>
            }
        </>
    );
}

export default Shop;