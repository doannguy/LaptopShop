import Link from "next/link";
import { useEffect, useState } from "react";
import useGetAllCategory from "@/app/hook/use-get-all-category";

const HeaderAsideMenu = () => {
	const [asideMenuToggler, setAsideMenuToggler] = useState(false);
	const [windowWidth, setWindowWidth] = useState();
	const { data, isLoading } = useGetAllCategory();

	const asideMenuHandler = () => {
		setAsideMenuToggler(!asideMenuToggler);
	};

	const asideMobileMenuHandler = () => {
		let windowWidthCheck = window.innerWidth;
		setWindowWidth(windowWidthCheck);
		window.addEventListener("resize", (e) => {
			let windowWidth = window.innerWidth;
			setWindowWidth(windowWidth);
		});
		let subMenuToggler = document.getElementsByClassName("has-megamenu");
		if (windowWidth < 1200) {
			for (let i = 0; i < subMenuToggler.length; i++) {
				let element = subMenuToggler[i];
				element.addEventListener("click", function (e) {
					e.preventDefault();
					if (element.offsetParent.classList.contains("open")) {
						for (let j = 0; j < subMenuToggler.length; j++) {
							const subElem = subMenuToggler[j];
							subElem.offsetParent.classList.remove("open");
							subElem.nextSibling.style.display = "none";
						}
					} else {
						for (let j = 0; j < subMenuToggler.length; j++) {
							const subElem = subMenuToggler[j];
							subElem.offsetParent.classList.remove("open");
							subElem.nextSibling.style.display = "none";
						}
						element.offsetParent.classList.add("open");
						element.nextSibling.style.display = "block";
					}
				});
			}
		}
	};

	useEffect(() => {
		asideMobileMenuHandler();
	}, [windowWidth]);

	return isLoading == true ? (
		<div>Loading...</div>
	) : (
		<div className="header-nav-department">
			<aside className="header-department">
				<button
					className="header-department-text department-title"
					onClick={asideMenuHandler}
				>
					<span className="icon">
						<i className="fal fa-bars" />
					</span>
					<span className="text">Danh mục</span>
				</button>
				<nav
					className={`department-nav-menu ${asideMenuToggler ? "open" : ""
						}`}
				>
					<button
						className="sidebar-close"
						onClick={asideMenuHandler}
					>
						<i className="fas fa-times" />
					</button>
					<ul className="nav-menu-list">
						{data.map((menuItem, index) => (
							<li key={index}>
								<Link
									href={'/shop?category=' + menuItem.id}
									className={`nav-link ${menuItem.hasChildren
										? "has-megamenu"
										: ""
										}`}
								>
									<span className="menu-text">
										{menuItem.name}
									</span>
								</Link>


								{menuItem.hasChildren && (
									<div className="col-sm-6">
										<div className="department-megamenu">
											<div className="department-megamenu-wrap">
												<div className="department-submenu-wrap">
													{menuItem.product_series
														.slice(0, 3)
														.map((submenu, index) => (
															<Link
																href={`/shop?seri=${submenu.id}`}
																className="department-submenu"
																key={index}
															>
																<p className="submenu-heading">
																	{submenu.name}
																</p>
															</Link>
														))}
												</div>
											</div>
										</div>

									</div>

									
								)}
							</li>
						))}
					</ul>
				</nav>
				{asideMenuToggler && windowWidth < 1200 && (
					<div className="closeMask" onClick={asideMenuHandler}></div>
				)}
			</aside>
		</div>
	);
};

export default HeaderAsideMenu;
