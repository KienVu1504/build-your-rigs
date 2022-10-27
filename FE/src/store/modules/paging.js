export default {
    namespaced: true,
    strict: true,
    state: {
        pages: {},
        currentPage: 1,
    },
    getters: {
    },
    mutations: {
        resetCurrentPage(state) {
            state.currentPage = 1
        },
        setPage(state, newPage) {
            state.pages = newPage
        },
        changePage(state, newPage) {
            state.currentPage = newPage
        },
        resetPage(state) {
            state.currentPage = 1
        },
        nextPage(state) {
            state.currentPage++
        },
        prePage(state) {
            state.currentPage--
        }
    }
}
