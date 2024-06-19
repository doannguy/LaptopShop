'use client';
import SlickSlider from "@/components/elements/SlickSlider";
import Loading from "@/components/widget/Loading";
import Currency from "@/components/widget/displayCurrency";
import { ProductReview } from "@/data/Comments";
import CardService from "@/services/cart_service";
import ProductService from "@/services/product_service";
import RatingService from "@/services/rating_service";
import { updateCart, addToWishlist } from "@/store/slices/productSlice";
import { reviewAverage, slugify } from "@/utils";
import { useQuery } from "@tanstack/react-query";
import FsLightbox from "fslightbox-react";
import Image from "next/image";
import { useEffect, useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { FaRegStar, FaStar } from "react-icons/fa6";
import Rating from "react-rating";
import { useDispatch, useSelector } from "react-redux";
import { toast, ToastContainer } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';

const SingleLayouThree = ({ singleData, productId }) => {
	const findReview = ProductReview.filter((data) => slugify(data.productId) === slugify(singleData.id));

	const [nav1, setNav1] = useState();
	const [nav2, setNav2] = useState();
	const [rating, setRating] = useState(0);
	const [quantity, setquantity] = useState(0);
	const [colorImage, setColorImage] = useState("");
	const [fsToggler, setFsToggler] = useState(false);
	const { data: productData, isLoading, isFetched } = useQuery({ queryKey: ["get-product"], queryFn: () => ProductService.getDetailProduct(productId) });
	const [productOptionSelected, setProductOptionSelected] = useState(null);
	const [isProductExist, setIsProductExist] = useState(true);


	useEffect(() => {
		if (isFetched) {

			if (productData && productData.data != false) {
				console.log(productData.data);
			} else {
				setIsProductExist(false);
			}
		}
	}, [isFetched])
	const dispatch = useDispatch();

	const handleUpdateCart = async () => {
		try {
			if (quantity > 0) {
				const res = await CardService.update({ quantity, product_option_id: productOptionSelected.id });
				console.log(res);
				if (res.code == 0) {
					dispatch(updateCart({ cartItems: res.data }));
					toast.success("Đã thêm vào giỏ hàng");
					setquantity(0);

				} else {
					toast.error(res.message);
				}
			} else {
				toast.warning("Số lượng tối thiểu là 1");
			}
		} catch (error) {
			console.log(error);
			toast.error("Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng");
		}
	};

	const handleAddToWishlist = (product) => {
		dispatch(addToWishlist(product));
	};

	const decrementQuantity = () => {
		if (quantity > 0) {
			setquantity(quantity - 1);
		}
	}

	const incrementQuantity = () => {
		if (quantity < 5 && quantity < productOptionSelected?.amount) {
			setquantity(quantity + 1);
		}
		else {
			console.log("out of stock");
			toast.warning(quantity == 0 ? "Bạn chưa chọn phiên bản" : "Đã đạt đến số lượng tối đa")
		}
	}


	const productProductOptionHandler = (product_options) => {
		setProductOptionSelected(product_options);

	};
	const getFullscreenPreview = () => {
		let galleryPreview = [];
		if (productData?.data.list_Image) {
			productData?.data.list_Image.map((img) => {
				galleryPreview.push("https://api-shop.codetify.tech/storage/" + img);
			})
		} else {
			galleryPreview.push(productData?.thumbnail_media.path);
		}
		return galleryPreview;
	}

	const {
		register,
		control,
		handleSubmit,
		formState: { errors },
	} = useForm();

	const onSubmit = async (data, e) => {
		console.log(data);
		data.rating = rating;
		data.product_id = productId;
		const res = await RatingService.userRating(data);
		if (res.data.code == 1) {
			toast.success(res.data.message);
		} else {
		}
		console.log(res);
	}
	return (
		isLoading ? <Loading /> :
			(isProductExist == false ?
				<div>
					<h1 style={{ textAlign: "center", marginTop: "100px" }}>Sản phẩm không tồn tại</h1>
				</div> :

				<section className="axil-single-product-area axil-section-gap pb--0">

					<div className="single-product-thumb mb--40">
						<div className="container">
							<div className="row">
								<div className="col-lg-7 mb--40">
									<div className="row">
										<div className="col-lg-10 order-lg-2">
											<div className="single-product-thumbnail-wrap">
												<ToastContainer />
												<SlickSlider
													class="single-product-thumbnail product-large-thumbnail-3 axil-product"
													slidesToShow={1}
													infinite={false}
													draggable={false}
													focusOnSelect={true}
													adaptiveHeight={true}
													asNavFor={nav2}
													ref={(slider1 => setNav1(slider1))}
												>
													{productData?.data.list_Image ? productData?.data.list_Image.map((galleryImg, index) => (
														<div className="thumbnail" key={index}>
															<Image
																src={"https://api-shop.codetify.tech/storage/" + galleryImg}
																height={584}
																width={584}
																alt="Gallery Image"
															/>
														</div>
													)) :
														<div className="thumbnail">
															<Image
																src={productData?.data?.thumbnail_media?.path && "#"}
																height={584}
																width={584}
																alt="Gallery Image"
															/>
														</div>
													}
												</SlickSlider>
												{productData?.data.list_Image &&
													<>
														<div className="product-quick-view position-view">
															<button onClick={() => setFsToggler(!fsToggler)} className="popup-zoom">
																<i className="far fa-search-plus" />
															</button>
														</div>
														<FsLightbox
															toggler={fsToggler}
															sources={getFullscreenPreview()}
														/>
													</>
												}
											</div>
										</div>
										<div className="col-lg-2 order-lg-1">
											<SlickSlider
												class="product-small-thumb-3 small-thumb-wrapper"
												slidesToShow={5}
												infinite={false}
												draggable={false}
												focusOnSelect={true}
												vertical={true}
												asNavFor={nav1}
												ref={(slider2 => setNav2(slider2))}
												responsive={[
													{
														breakpoint: 992,
														settings: {
															vertical: false,
														}
													},
												]}
											>
												{productData?.data.list_Image ? productData?.data.list_Image.map((galleryImg, index) => (
													<div className="small-thumb-img" key={index}>
														<Image
															src={"https://api-shop.codetify.tech/storage/" + galleryImg}
															height={207}
															width={213}
															alt="Thumb Image"
														/>
													</div>
												)) :
													<div className="small-thumb-img">
														<Image
															src={productData?.data.thumbnail_media?.path && "#"}
															height={207}
															width={213}
															alt="Thumb Image"
														/>
													</div>}
											</SlickSlider>
										</div>
									</div>
								</div>
								<div className="col-lg-5 mb--40">
									<div className="single-product-content">
										<div className="inner">
											<h2 className="product-title">{productData?.data.name}</h2>
											{productData?.data.short_description &&
												<>
													<p>{productData?.data.short_description}</p>
												</>
											}
											<div className="product-action-wrapper d-flex-center">
												<div className="pro-qty">
													<span className="qtybtn" onClick={decrementQuantity}>-</span>
													<input type="number" className="quantity-input" value={quantity} readOnly />
													<span className="qtybtn" onClick={incrementQuantity}>+</span>
												</div>
												<ul className="product-action d-flex-center mb--0">
													<li className="add-to-cart">
														<button disabled={(!productOptionSelected) ? true : false} onClick={() => handleUpdateCart()} className="axil-btn btn-bg-primary">Thêm vào giỏ hàng</button>
													</li>

												</ul>
											</div>
											<div className="product-variations-wrapper">
												{(productData?.data.product_options && productData?.data.product_options.length > 0) &&
													<div className="product-variation product-size-variation">
														<h6 className="title">Phiên bản:</h6>
														<ul className="range-variant">
															{productData?.data.product_options?.map((data, index) => (
																<li key={index} className={productOptionSelected?.id === data.id ? "active" : ""}
																	onClick={() => productProductOptionHandler(data)}>
																	<div>{data.name}</div>
																</li>
															))}
														</ul>
													</div>
												}
												{
													productOptionSelected &&
													<div className="product-option">
														<div className="price-box">
															<h6 className="title">Giá bán:</h6>
															<div className="price-amount">
																<div className="current-price">
																	<Currency currency={productOptionSelected.current_price} />
																</div>
																<div className="price">
																	<Currency currency={productOptionSelected.price} />
																</div>
															</div>
														</div>
														<div style={{ marginBottom: '10px' }}>
															Còn lại : {productOptionSelected.amount} sản phẩm
														</div>
														<div className="product-attribute">
															<h6 className="title">Cấu hình: </h6>
															<table>
																<tbody>

																	{productOptionSelected.attribute_values.map((data, index) => (
																		<tr key={index}>
																			<td style={{ fontWeight: 'bold' }}>{data.attribute.name}</td>
																			<td >{data.value}</td>
																		</tr>
																	))}
																</tbody>
															</table>
														</div>
													</div>
												}
											</div>


										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div className="woocommerce-tabs wc-tabs-wrapper bg-vista-white">
						<div className="container">
							<ul className="nav tabs" role="tablist">
								<li className="nav-item" role="presentation">
									<a className="active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Thông tin sản phẩm</a>
								</li>

								<li className="nav-item" role="presentation">
									<a id="reviews-tab" data-bs-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Đánh giá</a>
								</li>
							</ul>
							<div className="tab-content">
								<div className="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
									<div className="product-desc-wrapper">
										<div dangerouslySetInnerHTML={{ __html: productData?.data.description }} />

									</div>
								</div>

								<div className="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
									<div className="reviews-wrapper">
										<div className="row">
											<div className="col-lg-6 mb--40">
												<div className="axil-comment-area pro-desc-commnet-area">
													<h5 className="title">{findReview.length} Review for this product</h5>
													<ul className="comment-list">
														{findReview.map((data, index) => (
															<li className="comment" key={index}>
																<div className="comment-body">
																	<div className="single-comment">
																		<div className="comment-img">
																			<Image
																				src={data.user_thumbnail}
																				height={60}
																				width={60}
																				alt={data.user_name}
																			/>
																		</div>
																		<div className="comment-inner">
																			<h6 className="commenter">
																				<span className="hover-flip-item-wrapper">{data.user_name}</span>
																				<span className="commenter-rating">
																					{
																						[...Array(5)].map((item, index) => (
																							<i
																								className={`${index <= data.rating - 1 ? '' : 'empty-rating'} fas fa-star`}
																								key={index}
																							/>
																						))
																					}
																				</span>
																			</h6>
																			<div className="comment-text">
																				<p>{data.comment}</p>
																			</div>
																		</div>
																	</div>
																</div>
															</li>
														))}
													</ul>
												</div>
											</div>
											<div className="col-lg-6 mb--40">
												<div className="comment-respond pro-des-commend-respond mt--0">
													<h5 className="title mb--30">Thêm đánh giá</h5>
													<p>Địa chỉ email của bạn sẽ không được công khai. Trường bắt buộc được đánh dấu *</p>
													<form className="singin-form" onSubmit={handleSubmit(onSubmit)}>

														<div className="rating-wrapper d-flex-center mb--40">
															Đánh giá của bạn <span className="require">*</span>
															<div className="reating-inner ml--20">

																<Controller name="rating" control={control} render={({ field }) =>
																	<Rating
																		{...field}
																		emptySymbol={<FaRegStar width={50} height={50} />}
																		fullSymbol={<FaStar color="#FEED2F" />}
																		onChange={
																			(e) => {
																				setRating(e);
																				console.log(e);
																			}
																		} />

																} />


															</div>
														</div>

														<div className="row">
															<div className="col-12">
																<div className="form-group">
																	<label>Nội dung đánh giá</label>
																	<Controller name="comment" control={control} render={({ field }) => <textarea name="message"  {...field} className="form-control" placeholder="Your Comment" defaultValue={""} />} />

																</div>
															</div>
															<div className="col-lg-12">
																<div className="form-submit">
																	<button type="submit" id="submit" className="axil-btn btn-bg-primary w-auto">Xác nhận</button>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			)
	);
}

export default SingleLayouThree;