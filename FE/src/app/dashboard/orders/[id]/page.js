
'use client';

import Currency from "@/components/widget/displayCurrency";
import Loading from "@/components/widget/Loading";
import SkeletonCustom from "@/components/widget/Skeleton";
import { OrderService } from "@/services/order_service";
import { useQuery } from "@tanstack/react-query";
import { useRouter } from "next/navigation";
import { useState } from "react";
import { useForm } from "react-hook-form";
import Swal from "sweetalert2";

const OrderDetail = ({ params }) => {
    const id = params.id;
    const router = useRouter();
    const [isLoading, setIsLoading] = useState(false);
    const { data: response, isFetching, isFetched, refetch } = useQuery({
        queryFn: () => OrderService.get(id),
        queryKey: ["orders"],
        refetchOnWindowFocus: false
    })
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm();

    const onSubmit = async (data) => {
        setIsLoading(true);
        const res = await OrderService.update(response.data.id, data);
        setIsLoading(false);
        if (res.code == 0) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: res.message
            })
            router.push("/dashboard/orders");
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: res.message ? res.message : "Cập nhật thất bại"
            })
        }

    }

    const handelDelete = async () => {
        Swal.fire({
            title: 'Bạn có muốn xóa sản phẩm này?',
            showCancelButton: true,
            confirmButtonText: '<p style="color: white">Xóa</p>',
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            cancelButtonText: '<p style="color: white">Hủy</p>',
            showCloseButton: true,
            icon: 'warning',
        }).then(async (result) => {
            if (result.isConfirmed) {
                setIsLoading(true);
                const res = await OrderService.delete(response.data.id);
                setIsLoading(false);
                if (res.code == 0) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: res.message
                    })
                    router.push("/dashboard/orders");
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: res.message ? res.message : "Xóa thất bại"
                    })
                }
            }
        })
    }
    return isLoading ? <Loading /> : (isFetching) ? <SkeletonCustom lines={10} /> : (<div className="axil-dashboard-order-view">
        <p>Đơn hàng <strong>{response.data.code}</strong> đã đặt vào <strong>{response.data.created_at}</strong> có trạng thái <strong>{response.data.status_label}</strong>.</p>
        <div className="order-details">
            <h2 className="block-title">Thông tin đơn hàng</h2>
            <table className="table">
                <thead>
                    <tr>
                        <td>Mã vận đơn</td>
                        <td>{response.data.code}</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tên người nhận</td>
                        <td>
                            {response.data.name}
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td>
                            {response.data.phone}
                        </td>
                    </tr>
                    <tr>
                        <td>Tổng tiền</td>
                        <td>
                            <Currency currency={response.data.total_price} />
                        </td>
                    </tr>
                    <tr>
                        <td>Vận chuyển</td>
                        <td>{response.data.shipping_type}</td>
                    </tr>
                    <tr>
                        <td>Phí vận chuyển</td>
                        <td>
                            <Currency currency={response.data.shipping_fee} />
                        </td>
                    </tr>
                    <tr>
                        <td>Địa chỉ giao hàng</td>
                        <td>{response.data.address}</td>
                    </tr>
                    <tr>
                        <td>Phương thức thanh toán</td>
                        <td>{response.data.payment_method}</td>
                    </tr>
                    <tr>
                        <td>Ghi chú</td>
                        <td>{response.data.note}</td>
                    </tr>
                    <tr>
                        <td>Trạng thái</td>
                        <td>{response.data.status_label}</td>
                    </tr>
                    <tr>
                        <td>Ngày tạo</td>
                        <td>{response.data.created_at}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div className="order-details">
            <h2 className="block-title">Chi tiết sản phẩm</h2>
            <table className="table">
                <thead >
                    <tr>
                        <td style={{ fontWeight: 'bold' }}>Sản phẩm</td>
                        <td style={{ fontWeight: 'bold' }}>Số lượng</td>
                        <td style={{ fontWeight: 'bold' }}>Giá bán</td>
                        <td style={{ fontWeight: 'bold' }}>Tổng tiền</td>
                    </tr>
                </thead>
                <tbody>
                    {response.data.order_details.map((item, index) => (
                        <tr key={index}>
                            <td>{item.product_name}</td>
                            <td>{item.quantity}</td>
                            <td>
                                <Currency currency={item.price} />
                            </td>
                            <td>
                                <Currency currency={item.price * item.quantity} />
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
        { 
            response.data.status == 0 ? (
                
                    <>
                    <div className="order-address">
                        <h2 className="block-title">Sửa đơn hàng</h2>
                        <form className="account-details-form" onSubmit={handleSubmit(onSubmit)}>
                            <div className="row">
                                <div className="col-lg-">
                                    <div className="form-group">
                                        <label>Ghi chú</label>
                                        <textarea type="text" name="note" {...register('note')} className="form-control" >{response.data.note}</textarea>
                                    </div>

                                    <div className="form-group">
                                        <label>Địa chỉ <span>*</span></label>
                                        <input type="text" disabled={response.data.status !== 0} name="address" {...register('address', { required: true })} defaultValue={response.data.address} />
                                        {errors.address && <p className="error">Địa chỉ không được bỏ trống.</p>}
                                    </div>
                                    <div className="form-group">
                                        <label>Tên người nhận <span>*</span></label>
                                        <input type="text" {...register('name', { required: true })} defaultValue={response.data.name} />
                                        {errors.name && <p className="error">Tên người nhận không được bỏ trống.</p>}
                                    </div>
                                    <div className="form-group">
                                        <label>Số điện thoại <span>*</span></label>
                                        <input type="number" {...register('phone', { required: true, maxLength: 11 })} defaultValue={response.data.phone} />
                                        {errors.phone && <p className="error">Số điện thoại tối đa 11 số và không được bỏ trống.</p>}
                                    </div>
                                    <div className="form-group my--10">
                                        <input type="submit" className="axil-btn me-1" value="Cập nhật" />
                                    </div>

                                </div>

                            </div>
                        </form>
                        <button className="btn axil-btn btn-danger" disabled={response.data.status !== 0} onClick={() => handelDelete()}>Hủy đơn hàng</button>

                    </div>
                    </>
                
            ): ""
        }
        
    </div>);
}

export default OrderDetail;