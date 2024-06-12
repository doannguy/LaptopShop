import UserService from "@/services/user_service";
import { useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import CategoryService from "@/services/category_service";
import ProductService from "@/services/product_service";
const useGetProductList = ({ brand }) => {
    const getData = async ({ brand }) => {
        try {
            const response = await ProductService.getListProduct({ brand: brand });
            console.log(response);
            const data = response?.data;
            console.log(data);
            return data;
        } catch (error) {
            throw error;
        }
    };

    const { data, error, isLoading, isError, refetch } = useQuery({ queryKey: "get-product-list", queryFn: () => getData({ brand }) });

    useEffect(() => {
        if (isError) {
            throw new Error(error);
        }
    }, [isError]);

    return {
        data,
        isLoading,
        isError,
        error,
        refetch,
    };
};

export default useGetProductList;