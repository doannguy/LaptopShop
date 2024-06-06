import axios from "axios";
import { use } from "react";

export const base_service = axios.create({
  baseURL: "https://api-shop.codetify.tech/api/",
  headers: {
    "Content-Type": "application/json",
  }
})
base_service.interceptors.request.use(
  function (config) {
    return config;
  },
  function (error) {
    return Promise.reject(error);
  }
);