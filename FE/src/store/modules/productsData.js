import axios from "../../plugins/axios";
import qs from "qs"
import router from "@/router";

export default {
  namespaced: true,
  strict: true,
  state: {
    products: [],
  },
  getters: {
  },
  mutations: {
    setProducts(state, newData) {
      state.products = newData
    }
  },
  actions: {
    async fetchDatas(context, searchValue) {
      let currentPage = context.rootState.paging.currentPage;
      const productsQuery = {
        method: "GET",
        url: `search_pr?page=` + currentPage,
        params: {
          q: {
            product_id_in: router.currentRoute.params.id,
            name_cont: searchValue
          }
        },
        paramsSerializer: params => {
          return qs.stringify(params)
        }
      }
      await axios(productsQuery).then((res) => {
        // console.log(res.data.data)
        this.products = res.data.data;
        context.commit('productsData/setProducts', this.products, { root: true })
        context.commit('paging/setPage', res.data.page, { root: true })
      }).catch((err) => {
        console.log(err);
      });
    },
  }
}
