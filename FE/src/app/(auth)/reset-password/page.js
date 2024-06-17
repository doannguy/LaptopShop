'use client';
import Loading from '@/components/widget/Loading';
import AuthService from '@/services/auth_service';
import { useRouter, useSearchParams } from 'next/navigation';
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import Swal from 'sweetalert2';

const ResetPassword = () => {
    const params = useSearchParams();
    const router = useRouter();
    const [resetPassword, setResetPassword] = useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const {
        register,
        handleSubmit,
        formState: { errors },
        reset
    } = useForm();

    const onSubmit = async (data) => {
        const { password, cpassword, email } = data;
        const token = params.get('token');
        if (token == null) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Yêu cầu đã hết hạn, vui lòng thử lại'
            })
            return;
        }
        if (password != cpassword) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Mật khẩu nhập lại không trùng khớp'
            })
        } else {
            setIsLoading(true);
            const res = await AuthService.resetPassword({ email, password, password_confirmation: cpassword, token });
            setIsLoading(false);
            console.log(res);
            if (res.code == 0) {
                Swal.fire({
                    icon: 'success',
                    title: 'Đổi mật khẩu thành công',
                    text: res.message
                })
                router.push('/login');
            } else {
                if (res.data == "passwords.token") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Lỗi',
                        text: 'Yêu cầu đã hết hạn, vui lòng thử lại'
                    })
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Lỗi',
                        text: 'Lỗi, kiểm tra lại email của bạn hoặc gửi lại yêu cầu'
                    })
                }


            }
        }
        reset();
    }

    return (
        <div className="axil-signin-form">
            <h3 className="title">Đặt lại mật khẩu?</h3>
            <form className="singin-form" onSubmit={handleSubmit(onSubmit)}>
                <div className="form-group">
                    <label>Email</label>
                    <input type="email" className="form-control" {...register('email', { required: true })} />
                    {errors.email && <p className="error">Email không được bỏ trống.</p>}
                </div>
                <div className="form-group">
                    <label>Mật khẩu mới</label>
                    <input type="password" className="form-control" {...register('password', { required: true, minLength: 8 })} />
                    {errors.password && <p className="error">Mật khẩu mới tối thiểu 8 ký tự.</p>}
                </div>
                <div className="form-group">
                    <label>Nhập lại mật khẩu</label>
                    <input type="password" className="form-control" {...register('cpassword', { required: true, minLength: 8 })} />
                    {errors.cpassword && <p className="error"> Mật khẩu nhập lại tối thiểu 8 ký tự.</p>}
                </div>
                {isLoading ? <Loading /> : (
                    <div className="form-group">
                        <button type="submit" className="axil-btn btn-bg-primary submit-btn">Đặt lại mật khẩu</button>
                        {resetPassword && <p className="success">Mật khẩu đã được đặt lại</p>}
                    </div>
                )}
            </form>
        </div>
    );
}
export default ResetPassword;