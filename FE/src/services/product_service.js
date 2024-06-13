import { get_detail_product, get_product_list } from "./api";
import { base_service } from "./base_service";

export default class ProductService {
    static getListProduct = async ({ brand = '', search = '', category='', product_seri = '', page = 1, pageSize = 10, orderBy = 'name', oderDir = 'desc' }) => {
       
        return await base_service.get(get_product_list + `?brand=${brand ?? ''}&search=${search ?? ''}&product_seri=${product_seri}&category=${category}&page=${page}&pageSize=${pageSize}&orderBy=${orderBy}&oderDir=${oderDir}`);
    }
    static getDetailProduct = async (id) => {
        return await base_service.get(get_detail_product + `/${id}`);
    }
}