import Section from "@/components/elements/Section";
import SectionTitle from "@/components/elements/SectionTitle";
import SlickSlider from "@/components/elements/SlickSlider";
import ProductsData from "@/data/Products";
import { slugify } from "@/utils";
import SingleLayouThree from "./SingleLayouThree";
import ListSuggest from "./listSuggest";

const ProductDetails = ({ params }) => {
    const findProduct = ProductsData.filter(product => slugify(product.id) === slugify(params.id));
    console.log(params.id);
    const singleProduct = findProduct[0];
    const productCategory = singleProduct.pCate;
    const relatedProduct = ProductsData.filter(product => slugify(product.pCate) === slugify(productCategory));
    return (
        <>
            <SingleLayouThree singleData={singleProduct} productId={params.id} />
            <ListSuggest productId={params.id} />
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