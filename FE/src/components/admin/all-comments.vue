<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="cmt-header-wrapper">
                    <h2>All Comments</h2>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col-1">Id</th>
                            <th scope="col-2">Name</th>
                            <th scope="col-2">Content</th>
                            <th scope="col-1">Type</th>
                            <th scope="col-1">Reply/Post Id</th>
                            <th scope="col-1">Comment date</th>
                            <th scope="col-1">Status</th>
                            <th scope="col-2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="comment in comments" v-bind:key="comment.id">
                            <th scope="row">{{ comment.id }}</th>
                            <td>{{ comment.name }}</td>
                            <td>{{ comment.body }}</td>
                            <td>{{ (comment.commentable_type == "Comment") ? "C-C" : "C-P" }}</td>
                            <td>{{ comment.commentable_id }}</td>
                            <td>{{ comment.date_time }}</td>
                            <td>{{ (comment.status == 1) ? "Active" : "Hidden" }}</td>
                            <td>
                                <button type="button" @click="updateCmtStatus(comment.id, comment.status)"
                                    class="action-btn btn btn-success"><i class="fas fa-edit"></i></button>
                                <button type="button" @click="deteteComment(comment.id)"
                                    class="action-btn btn btn-danger"><i class="far fa-trash-alt"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <Pagination @fetchNewDatas="fetchAllCommentData"></Pagination>
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
        this.fetchAllCommentData()
    },
    computed: {
        ...commentsStore.mapState([
            'comments'
        ])
    },
    methods: {
        ...commentsStore.mapActions([
            'fetchAllCommentData',
            'deleteCMT',
            'updateStatus'
        ]),
        deteteComment(id, status) {
            let self = this
            this.$store.commit('comments/setDeleteId', id)
            this.$store.commit('comments/setRpStatus', !status)
            if (confirm("Do you want to delete this comment?")) {
                this.deleteCMT()
                setTimeout(function () {
                    self.fetchAllCommentData()
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
                    self.fetchAllCommentData()
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