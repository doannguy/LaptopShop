import { rating } from "./api";
import { base_service } from "./base_service";

class RatingService {
    static userRating = async (data) => {
        return await base_service.post(rating, data);
    }
}

export default RatingService;