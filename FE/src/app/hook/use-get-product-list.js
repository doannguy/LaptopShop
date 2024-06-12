import UserService from "@/services/user_service";
import { useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import CategoryService from "@/services/category_service";
import ProductService from "@/services/product_service";
const useGetProductList = ({ brand, page, pageSize, onSuccess }) => {
    const getData = async () => {
        try {
            const response = await ProductService.getListProduct({ brand,page,pageSize });
            const data = response?.data;
            return data;
        } catch (error) {
            throw error;
        }
    };

    const { data, error, isLoading, isError, refetch, isSuccess } = useQuery({ 
        queryKey: ["get-product-list"], 
        queryFn: () => getData({ brand }), 
        onSuccess: (data) => onSuccess(data) });

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
        isSuccess
    };
};

export default useGetProductList;