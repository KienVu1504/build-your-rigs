import axios from "../../plugins/axios";
import qs from "qs"

export default {
    namespaced: true,
    strict: true,
    state: {
        brands: [],
    },
    getters: {
    },
    mutations: {
        setBrands(state, newData) {
            state.brands = newData
        }
    },
    actions: {
        async fetchDatas(context, searchValue) {
            let currentPage = context.rootState.paging.currentPage;
            const brandsQuery = {
                method: "GET",
                url: `search_brands?page=` + currentPage,
                params: {
                    q: {
                        name_cont: searchValue,
                    },
                },
                paramsSerializer: (params) => {
                    return qs.stringify(params);
                },
            };
            await axios(brandsQuery).then((res) => {
                this.brands = res.data.brands;
                context.commit('brandsData/setBrands', this.brands, { root: true })
                context.commit('paging/setPage', res.data.meta.page, { root: true })
            }).catch((err) => {
                console.log(err);
            });
        },
    }
}
