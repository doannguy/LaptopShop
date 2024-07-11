import Image from "next/image";
import './styles.scss';
import Link from "next/link";
const BannerRight = () => {
    return (<div>
        <Link href="/shop">
            <Image className="banner_right" src={"/images/banner/banner_right.png"} alt="Banner" width={300} height={200} />
        </Link>
    </div>);
}

export default BannerRight;