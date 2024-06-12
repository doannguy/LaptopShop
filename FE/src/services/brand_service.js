import { get_brand } from "./api"
import { base_service } from "./base_service"

export default class BrandSerrvice {
    static getBrand = async () => {
        return await base_service.get(get_brand);
    }
}