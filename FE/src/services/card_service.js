import { get_card, update_card } from "./api"
import { base_service } from "./base_service"

class CardService {
    static update = async ({ quantity, product_option_id }) => {
        const res = await base_service.post(update_card, {
            quantity,
            product_option_id
        })
        return res.data
    }
    static getCard = async () => {
        const res = await base_service.get(get_card)
        return res.data
    }
}
export default CardService