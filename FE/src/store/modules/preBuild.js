import axios from "../../plugins/axios";

export default {
    namespaced: true,
    strict: true,
    state: {
        preBuildCount: ""
    },
    getters: {
    },
    mutations: {
        setPreBuildCount(state, newToken) {
            state.preBuildCount = newToken
        },
    },
    actions: {
        async preBuildCount({ commit }) {
            const preBuildQuery = {
                method: "GET",
                url: "pre_builds"
            }
            await axios(preBuildQuery).then(res => {
                this.setCount = res.data;
                commit("setPreBuildCount", this.setCount);
            }).catch(err => {
                console.log(err)
            })
        },
    }
}
