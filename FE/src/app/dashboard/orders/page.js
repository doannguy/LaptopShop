'use client'
import Currency from "@/components/widget/displayCurrency";
import Loading from "@/components/widget/Loading";
import { OrderService } from "@/services/order_service";
import { useQuery } from "@tanstack/react-query";
import Link from "next/link";
import { useEffect } from "react";

const UserOrders = () => {
    const {data, isFetching, isFetched} = useQuery({
        queryFn: () =>  OrderService.getlist(),
        queryKey: ["orders"],
        refetchOnWindowFocus: false
    })
    useEffect(() => {
        if (isFetched) {
            console.log(data)
        }
    })
    return isFetching ? <Loading/> : ( 
        <div className="axil-dashboard-order">
            <div className="table-responsive">
                <table className="table">
                    <thead>
                        <tr>
                            <th scope="col">Mã vận đơn</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Trạng Thái</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        {data.data.map((item, index) => (
                            <tr key={index}>
                                <td><Link href={`/dashboard/orders/${item.id}`} className="text-uppercase">{item.code}</Link></td>
                                <td>{item.created_at}</td>
                                <td>{item.status}</td>
                                <td>
                                    <Currency currency={item.total_price} />
                                </td>
                                <td>
                                    <Link href={`/dashboard/orders/${item.id}`} className="axil-btn view-btn">Xem</Link>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
     );
}
 
export default UserOrders;