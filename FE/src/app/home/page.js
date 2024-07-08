'use client';

import "@/components/chatbot/style.scss";
import Section from "@/components/elements/Section";
import SectionTitle from "@/components/elements/SectionTitle";
import SlickSlider from "@/components/elements/SlickSlider";
import FooterTwo from "@/components/footer/FooterTwo";
import HeaderTwo from "@/components/header/HeaderTwo";
import BannerThree from "@/components/hero-banner/BannerThree";
import NewsLetter from "@/components/newsletter/NewsLetter";
import PosterOne from '@/components/poster/PosterOne';
import ProductSeven from '@/components/product/ProductSeven';
import ProductTwo from '@/components/product/ProductTwo';
import ServiceOne from "@/components/services/ServiceOne";
import ServiceTwo from "@/components/services/ServiceTwo";
import TestimonialOne from '@/components/testimonial/TestimonialOne';
import Loading from '@/components/widget/Loading';
import SkeletonCustom from "@/components/widget/Skeleton";
import ProductsData from "@/data/Products";
import ProductService from "@/services/product_service";
import { slugify } from '@/utils';
import { useQuery } from "@tanstack/react-query";
import { usePathname } from 'next/navigation';
import { useEffect, useState } from "react";
import 'react-chatbot-kit/build/main.css';

const Home = () => {
  const pathname = usePathname();
  const split = pathname.split("/");
  const pageCategory = split[split.length - 1];
  const fashionProduct = ProductsData.filter(data => slugify(data.pCate) === pageCategory);
  const transparentProduct = ProductsData.filter(data => slugify(data.pCate) === pageCategory && data.thumbnailTransparent === true);
  // const exploreProduct = mapInSlices(fashionProduct, 8);
  const [loading, setLoading] = useState(true)
  const { data: lastestProduct, isFetched: isLastestFetched } = useQuery({
    queryKey: ["get-lastest-product-list"],
    queryFn: () => ProductService.getListProduct({ limit: 8, orderBy: 'id', orderDir: 'desc', search: '' })
  })
  useEffect(() => {
    if (typeof window !== 'undefined') {
      setTimeout(() => {
        setLoading(false)
      }, 1000)
    }
  }, []);

  if (loading) return <Loading />;
  return (
    <>
      <div style={{ position: 'relative' }}>
        <HeaderTwo />
        <main className="main-wrapper">
          <BannerThree />
          <ServiceOne />

          <Section pClass="pb--50">
            <SectionTitle
              title="Sản phẩm mới"
              subtitle="Sản phẩm tuần này"
              subtitleIcon="far fa-shopping-basket"
            />
            {isLastestFetched ?
              (
                <SlickSlider
                  class="slick-layout-wrapper--30 axil-slick-arrow arrow-top-slide"
                  slidesToShow={4}
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
                  {lastestProduct?.data.products.map((data) => (
                    <ProductTwo productOption={data} key={data.id} />
                  ))}

                </SlickSlider>
              )
              :
              <SkeletonCustom lines={8} />
            }
          </Section>


          {/* <Section pClass="pb--50 pb_sm--30">
            <SectionTitle
              title="Sản phẩm bán chạy"
              subtitle="Sản phẩm tháng này"
              subtitleIcon="far fa-shopping-basket"
              subColor="highlighter-secondary"
            />
            <SlickSlider
              class="product-transparent-layout slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide product-slide-mobile"
              slidesToShow={4}
              infinite={false}
              responsive={[
                {
                  breakpoint: 1200,
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
                  breakpoint: 576,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                  }
                },
              ]}
            >
              {transparentProduct.slice(0, 8).map((data) => (
                <ProductSeven product={data} key={data.id} />
              ))}

            </SlickSlider>
          </Section> */}
          <PosterOne
            subtitleIcon="far fa-shopping-basket"
            title="Khám phá cửa hàng hôm nay"
            thumbnail="/images/product/poster/poster-05.png"
            thumbWidth={418}
            thumbHeight={502}

          />

          <TestimonialOne />


          <NewsLetter bgImage="bg_image--12" />
          <ServiceTwo />
        </main>
        <FooterTwo />
      </div>
    </>
  );
}



export default Home;
