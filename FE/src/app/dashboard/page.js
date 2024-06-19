    'use client';
import useGetDetailedUser from "../hook/use-get-details-user";





const Dashboard = () => {
    const { data, isLoading } = useGetDetailedUser();
    return (
        isLoading == true ? <div>Loading...</div> :
            <div className="axil-dashboard-overview">
                <div className="welcome-text">Xin chào <strong>{data.user.name}</strong>  👋 <br/> <a href="/sign-in">Đăng xuất</a></div>
                <p>Từ bảng điều khiển tài khoản của mình, bạn có thể xem các đơn đặt hàng gần đây và thanh toán cũng như chỉnh sửa mật khẩu và chi tiết tài khoản của mình.</p>
            </div>
    );
}

export default Dashboard;