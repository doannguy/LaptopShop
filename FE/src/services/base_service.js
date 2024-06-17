import axios from "axios";


export const getToken = () => window.localStorage.getItem('token');


export const base_service = axios.create({
  baseURL: process.env.NEXT_PUBLIC_APP_URL+ "/api",
  headers: {
    "Content-Type": "application/json",
  }
});

base_service.interceptors.request.use(
  function (config) {
    const userToken = getToken();
    if (userToken != null) {
      config.headers.Authorization = `Bearer ${userToken}`
    }
    return config;
  },
  function (error) {
    return Promise.reject(error);
  }
);
base_service.interceptors.response.use(
  function (response) {

    return response;
  },
  function (error) {
    if (error.response.status === 401) {
      console.log("bạn cần đăng nhập");
    }
    return Promise.reject(error);
  },
);