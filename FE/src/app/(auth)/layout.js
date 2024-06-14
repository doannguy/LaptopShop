'use client';
import Image from "next/image";
import Link from "next/link";
import { usePathname } from 'next/navigation';
import { Logo } from "@/data/Common";
import { ToastContainer } from "react-toastify";

const AuthLayout = ({ children, bgImage }) => {
    const pathname = usePathname();
    const slug = pathname.replace("/", "");

    return (
        <div className="axil-signin-area">
            <ToastContainer />
            <div className="signin-header">
                <div className="row align-items-center">
                    <div className="col-md-6">
                        <Link href="/" className="site-logo">
                            <Image
                                src={Logo.dark}
                                height={40}
                                width={157}
                                alt="Logo"
                            />
                        </Link>
                    </div>
                    <div className="col-md-6">
                        <div className="singin-header-btn">
                            <p>{slug === "sign-in" ? "Bạn chưa có tài khoản?" : "Đã có tài khoản?"}</p>
                            <Link href={slug === "sign-in" ? "/sign-up" : "/sign-in"} className="axil-btn btn-bg-secondary sign-up-btn">{slug === "sign-in" ? "Đăng ký ngay" : "Đăng nhập"}</Link>
                        </div>
                    </div>
                </div>
            </div>
            <div className="row">
                <div className="col-xl-4 col-lg-6">
                    <div className={`axil-signin-banner bg_image ${bgImage ? bgImage : "bg_auth_image"} mx-5`}>
                        <h3 className="title">Chúng tôi cung cấp những sản phẩm tốt nhất    </h3>
                    </div>
                </div>
                <div className="col-lg-6 offset-xl-2">
                    <div className="axil-signin-form-wrap">
                        {children}
                    </div>
                </div>
            </div>
        </div>
    );
}

export default AuthLayout;