import { change_user_password, get_user_info_api, update_user_info } from "./api";
import { base_service } from "./base_service";


class UserService {
    static getUserInfomation = async () => {
        return await base_service.get(get_user_info_api);
    }
    static updateUserInfomation = async (data) => {
        return await base_service.post(update_user_info, data);
    }
    static changeUserPassword = async (data) => {
        return await base_service.post(change_user_password, data);
    }
}

export default UserService;