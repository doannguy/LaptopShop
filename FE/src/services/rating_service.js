import { get_review_by_product_id, get_reviews, rating } from "./api";
import { base_service } from "./base_service";

class RatingService {
    static userRating = async (data) => {
        return await base_service.post(rating, data);
    }
    static getReviewByProductId = async (id) => {
        let res = await base_service.get(get_review_by_product_id + id);
        return res.data;
    }
    static getReviews = async ({length = 6}) => {
        let res = await base_service.get(get_reviews + `?length=${length}`);
        return res.data;
    }
}

export default RatingService;