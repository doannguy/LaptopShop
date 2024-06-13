import SectionTitle from "../elements/SectionTitle";

const NewsLetter = (props) => {
  return (
    <div className="axil-newsletter-area axil-section-gap pt--0">
      <div className="container">
        <div className={`etrade-newsletter-wrapper bg_image ${props.bgImage ? props.bgImage : "bg_image--5"}`}>
          <div className="newsletter-content" style={{ margin: "10px" }}>

          </div>
        </div>
      </div>
    </div>
  );
}

export default NewsLetter;