import axios from "../../plugins/axios";
import qs from "qs"
import router from "@/router";

export default {
    namespaced: true,
    strict: true,
    state: {
        comments: []
    },
    getters: {

    },
    mutations: {
        setComments(state, newData) {
            state.comments = newData
        }
    },
    actions: {
        async fetchCommentData(context) {
            let currentPage = context.rootState.paging.currentPage;
            const brandsQuery = {
                method: "POST",
                url: `show_comments/` + router.currentRoute.params.pr_id + `?page=` + currentPage,
                paramsSerializer: (params) => {
                    return qs.stringify(params);
                },
            };
            await axios(brandsQuery).then((res) => {
                this.comments = res.data.comments;
                context.commit('comments/setComments', this.comments, { root: true })
                context.commit('paging/setPage', res.data.meta, { root: true })
            }).catch((err) => {
                console.log(err);
            });
        },
    }
}
