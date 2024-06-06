import { login_api, register_api } from "./api";

const { base_service } = require("./base_service")


class AuthService {
  static register = async (data) => {
    return await base_service.post(register_api, data);
  }
  static login = async (data) => {
    return await base_service.post(login_api, data);
  }
}
export default AuthService;