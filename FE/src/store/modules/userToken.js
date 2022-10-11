// import createPersistedState from "vuex-persistedstate";
// const dataState = createPersistedState({
//     paths: ['token']
// })
export default {
    namespaced: true,
    strict: true,
    state: {
        token: "",
    },
    getters: {
    },
    mutations: {
        setToken(state, newToken) {
            state.token = newToken
        },
        clearToken(state) {
            state.token = ''
        }
    },
    actions: {

    },
    // plugins: [dataState]
}
