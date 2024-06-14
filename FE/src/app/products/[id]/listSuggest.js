'use client';

import Section from "@/components/elements/Section";
import SectionTitle from "@/components/elements/SectionTitle";
import SlickSlider from "@/components/elements/SlickSlider";
import ProductOne from "@/components/product/ProductOne";
import Loading from "@/components/widget/Loading";
import ProductService from "@/services/product_service";
import { useQuery } from "@tanstack/react-query";

const ListSuggest = () => {
    const { data, error, isLoading, isFetching, refetch, isSuccess } = useQuery({
        queryKey: ["get-product-list"],
        queryFn: () => ProductService.getListProduct({ pageSize : 6 }),
        refetchOnWindowFocus: false,
        refetchOnMount: false,
        refetchOnReconnect: false,

    }
);
    return (
    isLoading ? <Loading /> :
    <Section pClass="pb--50 pb_sm--30">
        <SectionTitle
            title="Các sản phẩm khác"
            subtitle="Sản phẩm"
            subtitleIcon="far fa-shopping-basket"
            subColor="highlighter-primary"
        />
        <SlickSlider
            class="recent-product-activation slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide"
            slidesToShow={4}
            infinite={false}
            responsive={[
                {
                    breakpoint: 1400,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                },
                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 575,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                },
            ]}
        >
            {data?.data.products?.map((item) => (
                <ProductOne productOption={item} key={item.id} />
            ))}
        </SlickSlider>
    </Section> );
}
 
export default ListSuggest;