'use client';
import { Controller, useForm } from 'react-hook-form';
import * as Yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";
import UserService from '@/services/user_service';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import useGetDetailedUser from '@/app/hook/use-get-details-user';

const AccountDetails = () => {
    const { refetch } = useGetDetailedUser();

    const schema = Yup.object().shape({
        phone: Yup.string()
            .min(10, 'Vui lòng nhập đúng số điện thoại')
            .required('Vui lòng nhập số điện thoại'),
        name: Yup.string()
            .min(3, 'Vui lòng nhập tên người dùng')
            .required('Vui lòng nhập tên người dùng'),
        gender: Yup.string()
            .required('Vui lòng chọn giới tính')
            .oneOf(["0", "1"], 'Giới tính không hợp lệ'),
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


    const updateUserInfomation = async (data) => {
        console.log(data);
        const res = await UserService.updateUserInfomation(data);
        if (res.data.code == 0) {
            refetch();
            toast.success(res.data.data[0]);
        } else {
            toast.error(res.data.data.email[0]);
        }
        console.log(res);
    }

    const changePassword = async (data) => {
        console.log(data);
        const res = await UserService.changeUserPassword(data);
        if (res.data.code == 0) {

            toast.success(res.data.data[0, 1]);
        } else {
            toast.error(res.data.data.email[0]);
        }
        console.log(res);
    }


    return (
        <div className="axil-dashboard-account">
            <ToastContainer />
            <form className="account-details-form" onSubmit={handleSubmit(updateUserInfomation)}>
                <div className="row">
                    <div className="col-lg-">


                        <div className="form-group">
                            <label>Tên người dùng</label>
                            <Controller name="name" control={control} render={({ field }) => <input type="text" className="form-control" {...field} defaultValue="Annie" />} />
                            {errors.name && <p className="error">{errors.name.message}</p>}
                        </div>


                        <div className="form-group">
                            <label>Số điện thoại</label>
                            <Controller name="phone" control={control} render={({ field }) => <input type="number" className="form-control" {...field} defaultValue="0123123123" />} />
                            {errors.phone && <p className="error">{errors.phone.message}</p>}
                        </div>


                        <div class="form-group">
                            <label>Giới tính</label>

                            <Controller defaultValue='1' name="gender" control={control} render={({ field }) => <select className='form-select' style={{ paddingLeft: "3rem", fontSize: "14px" }} {...field}>
                                <option value="1">Nam</option>
                                <option value="0">Nữ</option>
                            </select>} />
                            {errors.gender && <small className="error text-danger">{errors.gender.message}.</small>}

                        </div>


                        <div className="form-group my--10">
                            <input type="submit" className="axil-btn" defaultValue="Lưu thay đổi" />
                        </div>

                    </div>

                </div>
            </form>


            <form className="account-details-form-change-password" onSubmit={handleSubmit(changePassword)}>

                <div className="col-12">


                    <h5 className="title">Đổi mật khẩu</h5>
                    <div className="form-group">
                        <label>Mật khẩu hiện tại</label>
                        <Controller name="current_password" control={control} render={({ field }) => <input type="password" className="form-control" {...field} />} />
                        {errors.password && <small className="error text-danger">{errors.password.message}.</small>}

                    </div>

                    <div className="form-group">
                        <label>Mật khẩu mới</label>
                        <Controller name="password" control={control} render={({ field }) => <input type="password" className="form-control" {...field} />} />
                        {errors.new_password && <small className="error text-danger">{errors.new_password.message}.</small>}
                    </div>


                    <div className="form-group">
                        <label>Xác nhận mật khẩu</label>
                        <Controller name="password_confirmation" control={control} render={({ field }) => <input type="password" className="form-control" {...field} />} />
                        {errors.password_confirmation && <small className="error text-danger">{errors.password_confirmation.message}.</small>}
                    </div>



                    <div className="form-group mb--0">
                        <input type="submit" className="axil-btn" defaultValue="Save Changes" />
                    </div>


                </div>
            </form>
        </div >

    );
}

export default AccountDetails;