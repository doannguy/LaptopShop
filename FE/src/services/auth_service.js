import { login_api, register_api, reset_password, send_reset_link } from "./api";

const { base_service } = require("./base_service")


class AuthService {
  static register = async (data) => {
    return await base_service.post(register_api, data);
  }
  static login = async (data) => {
    return await base_service.post(login_api, data);
  }
  static sendResetLink = async ({ email }) => {
    let res = await base_service.post(send_reset_link, { email: email });
    return res.data;
  }
  static resetPassword = async (data) => {
    let res = await base_service.post(reset_password, data);
    return res.data;
  }
}
export default AuthService;