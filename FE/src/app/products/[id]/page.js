import Section from "@/components/elements/Section";
import SectionTitle from "@/components/elements/SectionTitle";
import SlickSlider from "@/components/elements/SlickSlider";
import ProductsData from "@/data/Products";
import { slugify } from "@/utils";
import SingleLayouThree from "./SingleLayouThree";

const ProductDetails = ({ params }) => {
    const findProduct = ProductsData.filter(product => slugify(product.id) === slugify(params.id));
    console.log(params.id);
    const singleProduct = findProduct[0];
    const productCategory = singleProduct.pCate;
    const relatedProduct = ProductsData.filter(product => slugify(product.pCate) === slugify(productCategory));
    return (
        <>
            <SingleLayouThree singleData={singleProduct} productId={params.id}/>
            <Section pClass="pb--50 pb_sm--30">
                <SectionTitle 
                    title="Viewed Items"
                    subtitle="Your Recently"
                    subtitleIcon="far fa-shopping-basket"
                    subColor="highlighter-primary"
                />
                <SlickSlider
                class="recent-product-activation slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide"
                slidesToShow={4}
                infinite={false}
                responsive = {[
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
                  
                </SlickSlider>
            </Section>
        </>
    );
}

export default ProductDetails;


export async function generateStaticParams() {
    const products = ProductsData;

    return products.map((post) => ({
        id: slugify(post.id),
    }));
}