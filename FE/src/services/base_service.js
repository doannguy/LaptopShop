import axios from "axios";


export const getToken = () => window.localStorage.getItem('token');


export const base_service = axios.create({
  baseURL: "https://api-shop.codetify.tech/api/",
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