'use client';
import useGetDetailedUser from "../hook/use-get-details-user";





const Dashboard = () => {
    const { data, isLoading } = useGetDetailedUser();
    console.log(data);



    return (
        isLoading == true ? <div>Loading...</div> :
            <div className="axil-dashboard-overview">
                <div className="welcome-text">Hello {data.user.name}  <a href="/sign-in">Log Out</a></div>
                <p>From your account dashboard you can view your recent orders, manage your shipping and billing addresses, and edit your password and account details.</p>
            </div>
    );
}

export default Dashboard;