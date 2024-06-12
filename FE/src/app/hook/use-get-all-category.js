import UserService from "@/services/user_service";
import { useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import CategoryService from "@/services/category_service";
const useGetAllCategory = () => {
    const getData = async () => {
        try {
            const response = await CategoryService.getCategory();
            const data = response.data.data;
            return data;
        } catch (error) {
            throw error;
        }
    };

    const { data, error, isLoading, isError, refetch } = useQuery({ queryKey: ["get-all-category"], queryFn: getData });

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

export default useGetAllCategory;