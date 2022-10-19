import axios from "../../plugins/axios";
import qs from "qs"

export default {
    namespaced: true,
    strict: true,
    state: {
        relatedProducts: [],
    },
    getters: {
    },
    mutations: {
        setProducts(state, newData) {
            state.relatedProducts = newData
        }
    },
    actions: {
        async fetchRelateData({ commit }, socket, dimm, ssd, hdd, form, capacity, brand) {
            const productsQuery = {
                method: "POST",
                url: "show_items",
                params: {
                    socket: socket,
                    dimm: dimm,
                    ssd: ssd,
                    hdd: hdd,
                    form: form,
                    capacity: capacity,
                    brand_id: brand
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(productsQuery).then(res => {
                this.products = res.data
                commit("setProducts", this.products);
            }).catch(err => {
                console.log(err)
            })
        }
    }
}
