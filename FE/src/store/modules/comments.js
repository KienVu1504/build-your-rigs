import axios from "../../plugins/axios";
import qs from "qs"
import router from "@/router";

export default {
    namespaced: true,
    strict: true,
    state: {
        comments: [],
        reportedComments: [],
        commentBody: '',
        name: '',
        replyBody: '',
        replyId: '',
        reportId: '',
        reasonBody: '',
        deleteId: '',
        cmtId: '',
        cmtStatus: ''
    },
    getters: {

    },
    mutations: {
        setComments(state, newData) {
            state.comments = newData
        },
        setReportedComments(state, newData) {
            state.reportedComments = newData
        },
        setReason(state, newData) {
            state.reasonBody = newData
        },
        setCommentBody(state, newData) {
            state.commentBody = newData
        },
        setReplyBody(state, newData) {
            state.replyBody = newData
        },
        setRandomName(state, newData) {
            state.name = newData
        },
        setReplyId(state, newData) {
            state.replyId = newData
        },
        setRPId(state, newData) {
            state.reportId = newData
        },
        setDeleteId(state, newData) {
            state.deleteId = newData
        },
        setCmtId(state, newData) {
            state.cmtId = newData
        },
        setCmtStatus(state, newData) {
            state.cmtStatus = newData
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
        async fetchAllCommentData(context) {
            let currentPage = context.rootState.paging.currentPage;
            const brandsQuery = {
                method: "GET",
                url: `comments/?page=` + currentPage,
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
        async fetchReportedCommentData(context) {
            let currentPage = context.rootState.paging.currentPage;
            const brandsQuery = {
                method: "GET",
                url: `reports?page=` + currentPage,
                paramsSerializer: (params) => {
                    return qs.stringify(params);
                },
            };
            await axios(brandsQuery).then((res) => {
                this.comments = res.data.reports;
                context.commit('comments/setReportedComments', this.comments, { root: true })
                context.commit('paging/setPage', res.data.meta, { root: true })
            }).catch((err) => {
                console.log(err);
            });
        },
        async addComment({ state, dispatch }) {
            dispatch('fetchRandomUsername')
            const comment = {
                method: "POST",
                url: `pr_attributes/` + router.currentRoute.params.pr_id + `/comments`,
                params: {
                    name: state.name,
                    body: state.commentBody
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(comment).then(res => {
                if (res.request.status >= 200 && res.request.status < 300) {
                    dispatch('fetchCommentData')
                } else {
                    console.log(err)
                }
            }).catch(err => {
                console.log(err)
            })
        },
        async commentRP({ state }) {
            const commentQuery = {
                method: "POST",
                url: `comments/` + state.reportId + `/reports`,
                params: {
                    reason: state.reasonBody
                },
            }
            await axios(commentQuery).then(res => {
                alert("Report successful!")
            }).catch(err => {
                console.log(err)
            })
        },
        async deleteCMT({ state, dispatch }) {
            const commentQuery = {
                method: "DELETE",
                url: `comments/` + state.deleteId,
            }
            await axios(commentQuery).then(res => {
                // dispatch('fetchAllCommentData')
                // dispatch('fetchReportedCommentData')
            }).catch(err => {
                console.log(err)
            })
        },
        fetchRandomUsername(context) {
            var result = '';
            var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var charactersLength = characters.length;
            for (var i = 0; i < 10; i++) {
                result += characters.charAt(Math.floor(Math.random() * charactersLength));
            }
            context.commit('comments/setRandomName', result, { root: true })
        },
        async addReply({ state, dispatch }) {
            dispatch('fetchRandomUsername')
            const comment = {
                method: "POST",
                url: `comments/` + state.replyId + `/comments`,
                params: {
                    name: state.name,
                    body: state.replyBody
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(comment).then(res => {
                if (res.request.status >= 200 && res.request.status < 300) {
                    dispatch('fetchCommentData')
                } else {
                    console.log(res.response.data.body)
                }
            }).catch(err => {
                console.log(err)
            })
        },
        async updateStatus({ state, dispatch }) {
            const comment = {
                method: "PUT",
                url: `comments/` + state.cmtId,
                params: {
                    status: state.cmtStatus,
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(comment).then(res => {
                if (res.request.status >= 200 && res.request.status < 300) {
                    // dispatch('fetchAllCommentData')
                    // dispatch('fetchReportedCommentData')
                } else {
                    console.log(res.response.data.body)
                }
            }).catch(err => {
                console.log(err)
            })
        },
    }
}
