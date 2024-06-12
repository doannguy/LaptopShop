"use client";
import Breadcrumb from "@/components/breadcrumb/Breadcrumb";
import FooterTwo from "@/components/footer/FooterTwo";
import HeaderFive from "@/components/header/HeaderFive";
import NewsLetter from "@/components/newsletter/NewsLetter";
import ServiceTwo from "@/components/services/ServiceTwo";
import ShopNoSidebar from "./ShopNoSidebar";
import ShopWithSidebar from "./ShopWithSidebar";
import { useSearchParams } from "next/navigation";
import { useEffect } from "react";

const Shop = ({ searchParams }) => {
    const router = useSearchParams();
    useEffect(() => {
        // console.log(router.query);
        console.log(router.get("brand"));
    }, [router.isReady, router.query]);

    return (
        <>
            <HeaderFive headerCampaign />
            <Breadcrumb activeItem="Shop" title="Khám phá tất cả sản phẩm" />
            <main className="main-wrapper">
                {searchParams.layout === "no-sidebar" ? <ShopNoSidebar /> : <ShopWithSidebar brand={router.get("brand")} />}
                <NewsLetter />
                <ServiceTwo />
            </main>
            <FooterTwo />
        </>
    );
}

export default Shop;