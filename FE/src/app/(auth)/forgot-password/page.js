'use client';
import Loading from '@/components/widget/Loading';
import SkeletonCustom from '@/components/widget/Skeleton';
import AuthService from '@/services/auth_service';
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import Swal from 'sweetalert2';

const ForgotPassword = () => {
    const [isLoading, setIsLoading] = useState(false);
    const {
        register,
        handleSubmit,
        reset,
        formState: { errors },
    } = useForm();

    const onSubmit = async (data) => {
        const { email } = data;
        setIsLoading(true);
        const res = await AuthService.sendResetLink({ email });
        setIsLoading(false);
        if (res.code == 0) {
            Swal.fire({
                icon: 'success',
                title: 'Gửi yêu cầu thành công',
                text: "Kiểm tra email để đặt lại mật khẩu"
            })
            reset();
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: res.message
            })
        }
    }
    return isLoading ? <Loading /> : (
        <div className="axil-signin-form">
            <h3 className="title">Đặt lại mật khẩu?</h3>
            <p className="b2 mb--55">Nhập địa chỉ email tài khoản của bạn để đặt lại mật khẩu.</p>
            <form className="singin-form" onSubmit={handleSubmit(onSubmit)}>
                <div className="form-group">
                    <label>Email</label>
                    <input type="email" className="form-control" {...register('email', { required: true, pattern: /^\S+@\S+$/i })} placeholder="annie@example.com" />
                    {errors.email && <p className="error">Email không được để trống.</p>}
                </div>
                <div className="form-group">
                    <button type="submit" className="axil-btn btn-bg-primary submit-btn">Gửi yêu cầu </button>
                </div>
            </form>
        </div>
    );
}

export default ForgotPassword;