'use client';
import { Controller, useForm } from 'react-hook-form';
import * as Yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import UserService from '@/services/user_service';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import useGetDetailedUser from '@/app/hook/use-get-details-user';


function ChangePassswordForm() {
    const schema = Yup.object().shape({
        password: Yup.string()
            .min(8, 'Mật khẩu phải trên 8 ký tự')
            .required('Vui lòng nhập mật khẩu'),
        new_password: Yup.string()
            .min(7, 'Mật khẩu phải trên 8 ký tự')
            .required('Mật khẩu phải trên 8 ký tự'),
        password_confirmation: Yup.string()
            .min(8, 'Mật khẩu phải trên 8 ký tự')
            .oneOf([Yup.ref('new_password'), null], 'Mật khẩu không trùng khớp')
            .required('Vui lòng nhập mật khẩu'),
    });

    const {
        control,
        handleSubmit,
        formState: { errors },
    } = useForm({ resolver: yupResolver(schema) });

    return (<>


    </>);
}

export default ChangePassswordForm;