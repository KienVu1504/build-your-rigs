<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="cmt-header-wrapper">
                    <h2>Reported Comments</h2>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col-1">Id</th>
                            <th scope="col-2">Comment Id</th>
                            <th scope="col-2">Comment</th>
                            <th scope="col-2">Reason</th>
                            <th scope="col-1">Report date</th>
                            <th scope="col-1">Status</th>
                            <th scope="col-2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-for="comment in reportedComments">
                            <tr v-if="comment.status == false" v-bind:key="comment.id">
                                <th scope="row">{{ comment.id }}</th>
                                <td>{{ comment.comment_id }}</td>
                                <template v-for="(cmt, index) in comment.content_comment">
                                    <td v-if="index == 'body'" v-bind:key="index">{{ cmt }}</td>
                                </template>
                                <td>{{ comment.reason }}</td>
                                <td>{{ comment.date_time }}</td>
                                <template v-for="(cmt, index) in comment.content_comment">
                                    <td v-if="index == 'status'" v-bind:key="index">{{ (cmt == true) ? "Active" :
                                            "Hidden"
                                    }}</td>
                                </template>
                                <td>
                                    <template v-for="(cmt, index) in comment.content_comment">
                                        <button v-if="index == 'status'" v-bind:key="index" type="button"
                                            @click="updateCmtStatus(comment.comment_id, cmt)"
                                            class="action-btn btn btn-success"><i class="fas fa-edit"></i></button>
                                    </template>
                                    <button type="button"
                                        @click="deteteComment(comment.comment_id, comment.status, comment.id)"
                                        class="action-btn btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                </td>
                            </tr>
                        </template>
                    </tbody>
                </table>
            </div>
        </div>
        <Pagination @fetchNewDatas="fetchReportedCommentData"></Pagination>
    </div>
</template>

<script>
import Pagination from './pagination.vue';
import { createNamespacedHelpers } from 'vuex'
const commentsStore = createNamespacedHelpers('comments')
export default {
    data() {
        return {

        };
    },
    components: {
        Pagination
    },
    mounted() {
        this.fetchReportedCommentData()
    },
    computed: {
        ...commentsStore.mapState([
            'reportedComments'
        ])
    },
    methods: {
        ...commentsStore.mapActions([
            'fetchReportedCommentData',
            'deleteCMT',
            'updateStatus',
            'updateRPStatus'
        ]),
        deteteComment(id, status, rpId) {
            let self = this
            this.$store.commit('comments/setDeleteId', id)
            this.$store.commit('comments/setRpId', rpId)
            this.$store.commit('comments/setRpStatus', !status)
            if (confirm("Do you want to delete this comment?")) {
                this.deleteCMT()
                this.updateRPStatus()
                setTimeout(function () {
                    self.fetchReportedCommentData()
                }, 100);
            }
        },
        updateCmtStatus(id, status) {
            let self = this
            this.$store.commit('comments/setCmtId', id)
            this.$store.commit('comments/setCmtStatus', !status)
            if (confirm("Do you want to update this comment?")) {
                this.updateStatus()
                setTimeout(function () {
                    self.fetchReportedCommentData()
                }, 100);
            }
        }
    },
};
</script>

<style scoped>
td {
    word-break: break-all;
    text-align: center;
}

th {
    text-align: center;
}

.container {
    padding: 2rem 0rem;
}

h4 {
    margin: 2rem 0rem 1rem;
}

.table-image td,
.table-image th {
    vertical-align: middle;
}
</style>