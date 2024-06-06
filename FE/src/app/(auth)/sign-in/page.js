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

const SignIn = () => {
    const router = useRouter();


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
        const res = await AuthService.login(data);
        console.log(res);
        if (res.data.code == 1) {
            router.push('/');
        }
        else {
            toast.error(res.data.message);
        }

    }

    return (    
        <AuthLayout bgImage="bg_auth_image">
            <div className="axil-signin-form">
                <h3 className="title">Sign in to eTrade.</h3>
                <p className="b2 mb--55">Enter your detail below</p>
                <form className="singin-form" onSubmit={handleSubmit(onSubmit)}>

                    <div className="form-group">
                        <label>Email</label>
                        <Controller name="email" control={control} render={({ field }) => <input type="email" className="form-control" {...field} defaultValue="admin@email.com" />} />
                        {errors.email && <p className="error">{errors.email.message}</p>}
                    </div>

                    <div className="form-group">
                        <label>Password</label>
                        <Controller name="password" control={control} render={({ field }) => <input type="password" className="form-control" {...field} defaultValue={1234} />} />
                        {errors.password && <p className="error">{errors.password.message}</p>}
                    </div>


                    <div className="form-group d-flex align-items-center justify-content-between">
                        <button type="submit" className="axil-btn btn-bg-primary submit-btn">Sign In</button>
                        <Link href="/forgot-password" className="forgot-btn">Forget password?</Link>
                    </div>


                </form>
                <ToastContainer />
            </div>
        </AuthLayout>
    );
}

export default SignIn;