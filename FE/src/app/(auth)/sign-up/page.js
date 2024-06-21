'use client';
import AuthService from '@/services/auth_service';
import { Controller, useForm } from 'react-hook-form';
import * as Yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import Loading from '@/components/widget/Loading';


const SignUp = () => {
    const router = useRouter();

    const schema = Yup.object().shape({
        email: Yup.string()
            .email('Vui lòng nhập đúng định dạng')
            .required('Vui lòng nhập địa chỉ Email'),
        password: Yup.string()
            .min(8, 'Mật khẩu phải trên 8 ký tự')
            .required('Vui lòng nhập mật khẩu'),
        password_confirmation: Yup.string()
            .min(8, 'Mật khẩu phải trên 8 ký tự')
            .oneOf([Yup.ref('password'), null], 'Mật khẩu không trùng khớp')
            .required('Vui lòng nhập mật khẩu'),
        phone: Yup.string()
            .min(10, 'Vui lòng nhập đúng số điện thoại')
            .required('Vui lòng nhập số điện thoại'),
        name: Yup.string()
            .min(3, 'Vui lòng nhập tên người dùng')
            .required('Vui lòng nhập tên người dùng'),
        gender: Yup.string()
            .required('Vui lòng chọn giới tính')
            .oneOf(["0", "1"], 'Giới tính không hợp lệ')
    });
    const [isLoading, setLoading] = useState(false);    

    const {
        register,
        control,
        handleSubmit,
        formState: { errors },
    } = useForm({ resolver: yupResolver(schema) });

    const onSubmit = async (data, e) => {
        setLoading(true);
        const res = await AuthService.register(data);
        if (res.data.code == 0) {
            toast.success(res.data.message);
            setLoading(false);
            setTimeout(() => {
                router.push("/sign-in");
            }, 2000);
        } else {
            toast.error(res.data.data[0]);
            setLoading(false);
        }
      
    }

    return isLoading ? <Loading /> : (
        <div className="axil-signin-form">
            <h3 className="title">Đăng ký tài khoản</h3>
            <p className="b2 mb--55">Nhập thông tin chi tiết bên dưới</p>

            <form className="singin-form" onSubmit={handleSubmit(onSubmit)}>

                <div className="form-group">
                    <label>Tên người dùng</label>
                    <Controller name="name" control={control} render={({ field }) => <input type="text" className="form-control" {...field} placeholder="admin" />} />
                    {errors.name && <small className="error text-danger">{errors.name.message}</small>}
                </div>

                <div className="form-group">
                    <label>Email</label>
                    <Controller name="email" control={control} render={({ field }) => <input type="email" className="form-control" {...field} placeholder="annie@example.com" />} />
                    {errors.email && <small className="error text-danger">{errors.email.message}</small>}
                </div>

                <div className="form-group">
                    <label>Mật khẩu</label>
                    <Controller name="password" control={control} render={({ field }) => <input type="password" className="form-control" {...field} />} />
                    {errors.password && <small className="error text-danger">{errors.password.message}</small>}
                </div>

                <div className="form-group">
                    <label>Nhập lại mật khẩu</label>
                    <Controller name="password_confirmation" control={control} render={({ field }) => <input type="password" className="form-control" {...field} />} />
                    {errors.password_confirmation && <small className="password_confirmation text-danger">{errors.password_confirmation.message}</small>}
                </div>

                <div className="form-group">
                    <label>Số điện thoại</label>
                    <Controller name="phone" control={control} render={({ field }) => <input type="number" className="form-control" {...field} />} />
                    {errors.phone && <small className="error text-danger">{errors.phone.message}.</small>}
                </div>

                <div class="form-group">
                    <label>Giới tính</label>

                    <Controller defaultValue='1' name="gender" control={control} render={({ field }) => <select className='form-select' style={{ paddingLeft: "3rem !important", fontSize: "14px" }} {...field}>
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select>} />
                    {errors.gender && <small className="error text-danger">{errors.gender.message}.</small>}

                </div>

                <div className="form-group">
                    <button type="submit" className="axil-btn btn-bg-primary submit-btn">Đăng ký</button>
                </div>

            </form>
            <ToastContainer />
        </div>
    );
}

export default SignUp;