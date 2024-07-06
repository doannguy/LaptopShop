'use client';
import Section from "../elements/Section";
import SectionTitle from "../elements/SectionTitle";
import Image from "next/image";
import { TestimonialData } from "@/data/Testimonial";
import SlickSlider from "../elements/SlickSlider";
import RatingService from "@/services/rating_service";
import SkeletonCustom from "../widget/Skeleton";
import { useQuery } from "@tanstack/react-query";

const TestimonialOne = () => {
  const { data: TestimonialData, isFetched } = useQuery({ queryKey: ["get-testimonial"], queryFn: () => RatingService.getReviews({ length: 6 }) });
  return isFetched ? (
    <Section pClass="bg-vista-white">
      <SectionTitle
        title="Đánh giá từ khách hàng"
        subtitle="Đánh giá"
        subtitleIcon="fal fa-quote-left"
        subColor="highlighter-secondary"
      />
      <SlickSlider
        class="testimonial-style-one-wrapper slick-layout-wrapper--20 axil-slick-arrow arrow-top-slide"
        responsive={[
          {
            breakpoint: 992,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1,
            }
          }
        ]}
      >
        {TestimonialData.data.map((data, index) => (
          <div className="testimonial-style-one" key={index}>
            <div>
              <div className="review-speech">
                <p>{data.comment}</p>
              </div>
              <div className="media">
                <div className="thumbnail">
                  {/* <Image
                    src={data.authorThumb}
                    width="60"
                    height="60"
                    alt={data.authorName}
                  /> */}
                </div>
                <div className="media-body">
                  <span className="designation">{data.product?.name}</span>
                  <h6 className="title">{data.user.name}</h6>
                </div>
              </div>
            </div>   
          </div>
        ))}
      </SlickSlider>
    </Section>
  ) : (
    <SkeletonCustom lines={6} />
  );
};

export default TestimonialOne;
