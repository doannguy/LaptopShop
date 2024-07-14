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
                        <div className="axil-google-map-wrap axil-section-gap pb--0">
                            <div className="mapouter">
                                <div className="gmap_canvas">
                                    <iframe width={1080} height={500} id="gmap_canvas" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4853986111193!2d106.76933817570385!3d10.85063765781912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1720971614046!5m2!1svi!2s" />
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