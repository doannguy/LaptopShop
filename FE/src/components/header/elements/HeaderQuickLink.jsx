import Link from "next/link";

const HeaderQuickLink = () => {
  return (
    <div className="header-top-link">
      <ul className="quick-link">
        <li>
          <Link href="/sign-up">Đăng ký ngay</Link>
        </li>
      </ul>
    </div>
  );
};

export default HeaderQuickLink;
