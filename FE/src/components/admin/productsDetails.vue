<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Products Details</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <div class="details-wrapper">
                    <div class="wrapper-inner">
                        <div class="section-left">
                            <div class="product-img-outer">
                                <img :src="products.img || products.image_url" alt="" class="product-img">
                            </div>
                        </div>

                        <div class="section-right">
                            <h2 v-if="this.products">{{ this.products.name }}</h2>
                            <h2 v-else>Please reload the page to see all missing data!</h2>
                            <p>{{ this.products.price | toCurrency }}</p>
                            <hr>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="this.brandName.name">
                                        <th scope="row">Brand</th>
                                        <td>{{ this.brandName.name }}</td>
                                    </tr>
                                    <tr v-if="this.products.socket">
                                        <th scope="row">Socket</th>
                                        <td>{{ this.products.socket }}</td>
                                    </tr>
                                    <tr v-if="this.products.dimm">
                                        <th scope="row">DIMM type</th>
                                        <td>{{ this.products.dimm }}</td>
                                    </tr>
                                    <tr v-if="this.products.ssd">
                                        <th scope="row">SSD type</th>
                                        <td>{{ this.products.ssd }}</td>
                                    </tr>
                                    <tr v-if="this.products.hdd">
                                        <th scope="row">HDD type</th>
                                        <td>{{ this.products.hdd }}</td>
                                    </tr>
                                    <tr v-if="this.products.form">
                                        <th scope="row">Form factor</th>
                                        <td>{{ this.products.form }}</td>
                                    </tr>
                                    <tr v-if="this.products.size">
                                        <th scope="row">AIO size</th>
                                        <td>{{ this.products.size }}</td>
                                    </tr>
                                    <tr v-if="this.products.capacity">
                                        <th scope="row">Capacity</th>
                                        <td>{{ this.products.capacity }}</td>
                                    </tr>
                                    <tr v-if="this.products.wattage">
                                        <th scope="row">TDP</th>
                                        <td>{{ this.products.wattage }}</td>
                                    </tr>
                                </tbody>
                            </table>

                            <p>Related Product</p>
                            <div class="relatePr-wrapper" @click="newData">
                                <template v-for="(pr_attribute, index) in relatedProducts">
                                    <router-link tag="div"
                                        :to="{ path: `/admin/products/` + pr_attribute.product_id + '/' + pr_attribute.id }"
                                        class="tile-wrapper-outer col-lg-4" :key="'pr_attribute' + index"
                                        v-if="pr_attribute.id != $route.params.pr_id">
                                        <div class="tile">
                                            <input type="radio" id="inputCheckbox" name="userChoice" class="tile-input">
                                            <label for="userChoice" class="tile-label">
                                                <div class="tile-wrapper">
                                                    <div class="item-img-wrapper">
                                                        <img :src="pr_attribute.img || pr_attribute.image_url" alt=""
                                                            class="item-img" />
                                                    </div>
                                                    <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                                    <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}
                                                    </h5>
                                                </div>
                                            </label>
                                        </div>
                                    </router-link>
                                </template>
                            </div>
                        </div>
                    </div>
                    <form class="post-wrapper" @submit.prevent="addNewComment(commentBody)">
                        <label for="content">Comment:</label>
                        <textarea id="content" v-model="commentBody" name="content" rows="5"
                            placeholder="Enter your comment..." required></textarea>
                        <button type="submit">Post</button>
                    </form>
                    <div class="comments-wrapper">
                        <template v-for="comment in comments">
                            <div class="comment" :key="comment.id" v-if="comment.status == 1">
                                <div class="comment-left">
                                    <div class="left-wrapper">
                                        <div class="comment-avt">
                                            <p>{{ comment.name.substring(0, 2).toUpperCase() }}</p>
                                        </div>
                                        <p class="annm-name">{{ comment.name }}</p>
                                    </div>
                                </div>
                                <div class="comment-right">
                                    <div class="comment-header">
                                        <form v-show="currentCommentId == comment.id" class="reply-form"
                                            @submit.prevent="addNewReply(comment.id, replyBody)">
                                            <input type="text" v-model="replyBody" placeholder="Enter reply here..."
                                                class="reply-section">
                                            <button type="submit">Reply</button>
                                        </form>
                                        <form v-show="currentRPCommentId == comment.id" class="reply-form"
                                            @submit.prevent="reportComment(comment.id, reason)">
                                            <input type="text" v-model="reason" placeholder="Enter reason here..."
                                                class="reply-section">
                                            <button type="submit">Report</button>
                                        </form>
                                        <p v-show="currentCommentId != comment.id" class="comment-action"
                                            @click="toggleReply(comment.id)">Reply</p>
                                        <p v-show="currentRPCommentId != comment.id" class="comment-action"
                                            @click="toggleReport(comment.id)">Report</p>
                                        <p>{{ comment.date_time }}</p>
                                    </div>
                                    <div class="comment-body">
                                        <p>{{ comment.body }}</p>
                                    </div>
                                    <div class="overflow-wrapper">
                                        <div class="reply-wrapper" v-for="reply in comment.comments"
                                            v-bind:key="reply.id">
                                            <p class="reply-name">{{ reply.name }} said on {{ reply.date_time }} |
                                                <span v-show="currentRPReplyId != reply.id" class="comment-action"
                                                    @click="toggleReportCmt(reply.id)">Report</span>
                                            </p>
                                            <span class="reply-rp-wrapper">
                                                <form v-show="currentRPReplyId == reply.id" class="reply-form"
                                                    @submit.prevent="reportComment(reply.id, reason)">
                                                    <button type="submit">Report</button>
                                                    <input type="text" v-model="reason"
                                                        placeholder="Enter reason here..." class="reply-section">
                                                </form>
                                            </span>
                                            <div class="reply-body">
                                                <p>{{ reply.body }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </template>
                    </div>
                    <Pagination @fetchNewDatas="fetchCommentData"></Pagination>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import axios from "@/plugins/axios"
import Pagination from './pagination.vue';
import qs from "qs"
import { createNamespacedHelpers, mapState } from 'vuex'
const relatePrStore = createNamespacedHelpers('relatePr')
const commentsStore = createNamespacedHelpers('comments')

export default {
    data() {
        return {
            products: [],
            brandName: '',
            commentBody: '',
            replyBody: '',
            currentCommentId: null,
            currentRPCommentId: null,
            currentRPReplyId: null,
            reason: '',
            currentReplyId: ''
        };
    },
    components: {
        Pagination
    },
    computed: {
        ...mapState([
            'animation'
        ]),
        ...commentsStore.mapState([
            'comments'
        ]),
        ...relatePrStore.mapState([
            'relatedProducts'
        ])
    },
    mounted() {
        this.fetchDatas();
    },
    methods: {
        newData() {
            this.fetchDatas();
        },
        async fetchDatas() {
            const self = this;
            const productsQuery = {
                method: "GET",
                url: "search_pr",
                params: {
                    q: {
                        id_in: this.$route.params.pr_id
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(productsQuery).then(res => {
                this.products = res.data.data[0];
                setTimeout(function () {
                    self.fetchRelateData(
                        self.products.socket,
                        self.products.dimm,
                        self.products.ssd,
                        self.products.hdd,
                        self.products.form,
                        self.products.capacity,
                        self.products.brand_id
                    )
                    self.fetchBrand();
                    self.fetchCommentData();
                }, 300);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchBrand() {
            const brandQuery = {
                method: "GET",
                url: "brands/" + this.products.brand_id,
            }
            await axios(brandQuery).then(res => {
                this.brandName = res.data;
            }).catch(err => {
                console.log("fetchBrand: " + err)
            })
        },
        reportComment(id, reason) {
            this.setReason(reason)
            this.setRPId(id)
            this.commentRP()
            this.reason = null
        },
        ...commentsStore.mapActions([
            'fetchCommentData',
            'addComment',
            'addReply',
            'commentRP'
        ]),
        ...commentsStore.mapMutations([
            'setCommentBody',
            'setReplyBody',
            'setReplyId',
            'setReason',
            'setRPId'
        ]),
        addNewComment(commentBody) {
            this.setCommentBody(commentBody)
            this.addComment()
            this.commentBody = null
        },
        addNewReply(id, replyBody) {
            this.setReplyBody(replyBody)
            this.setReplyId(id)
            this.addReply()
            this.replyBody = null
        },
        toggleReply(commentId) {
            this.currentCommentId = this.currentCommentId == commentId ? null : commentId;
            this.currentRPCommentId = null;
        },
        toggleReport(commentId) {
            this.currentRPCommentId = this.currentCommentId == commentId ? null : commentId;
            this.currentCommentId = null;
        },
        toggleReportCmt(commentId) {
            this.currentRPReplyId = this.currentReplyId == commentId ? null : commentId;
            this.currentReplyId = null;
        },
        ...relatePrStore.mapActions([
            'fetchRelateData'
        ])
    }
}
</script>

<style scoped>
.tile-input:after {
    display: none;
}

.input-fields-wrapper {
    display: unset;
    flex-wrap: unset;
    padding: unset;
}
</style>