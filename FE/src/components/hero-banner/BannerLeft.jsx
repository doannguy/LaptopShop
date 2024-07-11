import Image from "next/image";
import './styles.scss';
import Link from "next/link";
const BannerLeft = () => {
    return (<div>
        <Link href="/shop">
            <Image className="banner_left" src={"/images/banner/banner_left.png"} alt="Banner" width={300} height={200} />
        </Link>
    </div>);
}

export default BannerLeft;