import UserService from "@/services/user_service";
import { useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
const useGetDetailedUser = () => {
    const getData = async () => {
        try {
            const response = await UserService.getUserInfomation();
            const data = response.data.data;
            return data;
        } catch (error) {
            throw error;
        }
    };

    const { data, error, isLoading, isError, refetch } = useQuery({ queryKey: ["get-user-infomation"], queryFn: getData });

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


export default useGetDetailedUser;