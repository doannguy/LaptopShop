'use client';
import { useState } from 'react';
import { useForm } from 'react-hook-form';
import emailjs from '@emailjs/browser';
import Breadcrumb from "@/components/breadcrumb/Breadcrumb";
import FooterTwo from "@/components/footer/FooterTwo";
import HeaderFive from "@/components/header/HeaderFive";
import ServiceTwo from "@/components/services/ServiceTwo";
import { StoreInfo } from "@/data/Common";

const ContactUs = () => {

    const [result, showresult] = useState(false);
    const {
        register,
        handleSubmit,
        reset,
        formState: { errors },
    } = useForm();

    const sendEmail = (formData) => {
        emailjs.send('service_g3aufzu', 'template_sk4dqiz', formData, '9L_sRsO66U253zcxC')
            .then((result) => {
                console.log(result.text);
            }, (error) => {
                console.log(error.text);
            });
        reset();
        showresult(true);
    };

    setTimeout(() => {
        showresult(false);
    }, 2000);


    return (
        <>
            <HeaderFive headerSlider />
            <main className="main-wrapper">
                <Breadcrumb
                    activeItem="Contact"
                    title="Liên hệ với chúng tôi"
                />
                <div className="axil-contact-page-area axil-section-gap">
                    <div className="container">
                        <div className="axil-contact-page">
                            {/* <div className="row row--30">
                                <div className="col-lg-8">
                                    <div className="contact-form">
                                        <div>
                                            <h3 className="title mb--10">Chúng tôi rất mong nhận được những phản hồi từ bạn</h3>
                                            <p>Nếu bạn có những sản phẩm tuyệt vời mà bạn đang tạo ra hoặc muốn hợp tác với chúng tôi thì hãy liên hệ với chúng tôi.</p>
                                            <form onSubmit={handleSubmit(sendEmail)}>
                                                <div className="row row--10">
                                                    <div className="col-lg-4">
                                                        <div className="form-group">
                                                            <label>Name <span>*</span></label>
                                                            <input type="text" {...register('name', { required: true })} />
                                                            {errors.name && <p className="error">Name is required.</p>}
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4">
                                                        <div className="form-group">
                                                            <label>Phone <span>*</span></label>
                                                            <input type="text" {...register('phone', { required: true })} />
                                                            {errors.phone && <p className="error">Phone is required.</p>}
                                                        </div>
                                                    </div>
                                                    <div className="col-lg-4">
                                                        <div className="form-group">
                                                            <label>E-mail <span>*</span></label>
                                                            <input type="email" {...register('email', { required: true })} />
                                                            {errors.email && <p className="error">Email is required.</p>}
                                                        </div>
                                                    </div>
                                                    <div className="col-12">
                                                        <div className="form-group">
                                                            <label>Your Message</label>
                                                            <textarea {...register('message')} cols={1} rows={2} />
                                                        </div>
                                                    </div>
                                                    <div className="col-12">
                                                        <div className="form-group mb--0">
                                                            <button name="submit" type="submit" className="axil-btn btn-bg-primary">Gửi phản hồi</button>
                                                            {result && <p className="success">Message has been sent successfully</p>}
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div> */}
                        </div>
                        <div className="axil-google-map-wrap axil-section-gap pb--0">
                            <div className="mapouter">
                                <div className="gmap_canvas">
                                    <iframe width={1080} height={500} id="gmap_canvas" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.485467534978!2d106.77191309999999!3d10.8506324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1719591844558!5m2!1svi!2s" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ServiceTwo />
            </main>
            <FooterTwo />
        </>
    );
}

export default ContactUs;