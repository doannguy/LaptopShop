const { store_order, get_list_order, get_order_detail, update_order, delete_order } = require("./api");
const { base_service } = require("./base_service");

const store = async (data) => {
    const response = await base_service.post(store_order, data);
    return response.data;
}
const getlist = async () => {
    const response = await base_service.get(get_list_order);
    return response.data;
}
const get = async (id) => {
    const response = await base_service.get(get_order_detail + "/" + id);
    return response.data;
}
const update = async (id, data) => {
    const response = await base_service.post(update_order + "/" + id, data);
    return response.data;
}
const deleteOrder = async (id) => {
    const response = await base_service.get(delete_order + "/" + id);
    return response.data;
}   


export const OrderService = {
    store ,
    getlist ,
    get,
    update,
    delete: deleteOrder
}