'use client';
import Link from "next/link";
import { Controller, useForm } from 'react-hook-form';
import AuthLayout from "../layout";
import * as Yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { useRouter } from 'next/navigation';
import AuthService from "@/services/auth_service";
import { updateCart } from "@/store/slices/productSlice";
import { useDispatch } from "react-redux";
import Loading from "@/components/widget/Loading";
import { useState } from "react";
import CartService from "@/services/cart_service";

const SignIn = () => {
    const router = useRouter();

    const dispatch = useDispatch();
    const [isLoading, setIsLoading] = useState(false);

    const schema = Yup.object().shape({
        email: Yup.string()
            .email('Vui lòng nhập đúng định dạng')
            .required('Vui lòng nhập địa chỉ Email'),
        password: Yup.string()
            .min(8, 'Mật khẩu phải trên 8 ký tự')
            .required('Vui lòng nhập mật khẩu'),
    });

    const {
        register,
        handleSubmit,
        control,
        formState: { errors },
    } = useForm({ resolver: yupResolver(schema) });



    const onSubmit = async (data) => {
        setIsLoading(true);
        const res = await AuthService.login(data);
        setIsLoading(false);
        if (res.data.code == 0) {
            window.localStorage.setItem('token', res.data.data.token);
            console.log(window.localStorage.getItem('token'));
            getCart();
        }
        else {
            toast.error(res.data.message);
        }

    }
    const getCart = async () => {
        const res = await CartService.get();
        if (res.code == 0) {
            dispatch(updateCart({ cartItems: res.data }));
            router.push('/');
        }else {
            toast.error("Lỗi, thử lại sau");
            window.localStorage.setItem('token', null);
            router.push('/sign-in');
        }
    }

    return  isLoading ? <Loading/> :
    (
        <AuthLayout bgImage="bg_auth_image">
            <div className="axil-signin-form">
                <h3 className="title">Đăng nhập</h3>
                <p className="b2 mb--55">Hãy nhập thông tin tài khoản của bạn </p>
                <form className="singin-form" onSubmit={handleSubmit(onSubmit)}>

                    <div className="form-group">
                        <label>Email</label>
                        <Controller name="email" control={control} render={({ field }) => <input type="email" className="form-control" {...field}  />} />
                        {errors.email && <p className="error">{errors.email.message}</p>}
                    </div>

                    <div className="form-group">
                        <label>Mật khẩu</label>
                        <Controller name="password" control={control} render={({ field }) => <input type="password" className="form-control" {...field}  />} />
                        {errors.password && <p className="error">{errors.password.message}</p>}
                    </div>


                    <div className="form-group d-flex align-items-center justify-content-between">
                        <button type="submit" className="axil-btn btn-bg-primary submit-btn">Đăng nhập ngay</button>
                        <Link href="/forgot-password" className="forgot-btn">Quên mật khẩu?</Link>
                    </div>


                </form>
                
            </div>
        </AuthLayout>
    );
}

export default SignIn;