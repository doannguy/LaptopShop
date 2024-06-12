import { get_category } from "./api"
import { base_service } from "./base_service"

export default class CategoryService {
    static getCategory = async () => {
        return await base_service.get(get_category);
    }
}