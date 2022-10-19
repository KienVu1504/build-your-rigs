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
                            <h2 v-if="this.products">{{this.products.name}}</h2>
                            <h2 v-else>Please reload the page to see all missing data!</h2>
                            <p>{{this.products.price | toCurrency}}</p>
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
                                        <td>{{this.brandName.name}}</td>
                                    </tr>
                                    <tr v-if="this.products.socket">
                                        <th scope="row">Socket</th>
                                        <td>{{this.products.socket}}</td>
                                    </tr>
                                    <tr v-if="this.products.dimm">
                                        <th scope="row">DIMM type</th>
                                        <td>{{this.products.dimm}}</td>
                                    </tr>
                                    <tr v-if="this.products.ssd">
                                        <th scope="row">SSD type</th>
                                        <td>{{this.products.ssd}}</td>
                                    </tr>
                                    <tr v-if="this.products.hdd">
                                        <th scope="row">HDD type</th>
                                        <td>{{this.products.hdd}}</td>
                                    </tr>
                                    <tr v-if="this.products.form">
                                        <th scope="row">Form factor</th>
                                        <td>{{this.products.form}}</td>
                                    </tr>
                                    <tr v-if="this.products.size">
                                        <th scope="row">AIO size</th>
                                        <td>{{this.products.size}}</td>
                                    </tr>
                                    <tr v-if="this.products.capacity">
                                        <th scope="row">Capacity</th>
                                        <td>{{this.products.capacity}}</td>
                                    </tr>
                                    <tr v-if="this.products.wattage">
                                        <th scope="row">TDP</th>
                                        <td>{{this.products.wattage}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="comments-wrapper">
                        <div class="comment" v-for="comment in comments" :key="comment.id">
                            <div class="comment-left">
                                <div class="left-wrapper">
                                    <div class="comment-avt">
                                        <p>{{comment.name.substring(0, 1).toUpperCase()}}</p>
                                    </div>
                                    <p>{{comment.name}}</p>
                                </div>
                            </div>
                            <div class="comment-right">
                                <div class="comment-header">
                                    <p class="comment-action">Reply</p>
                                    <p class="comment-action">Report</p>
                                    <p>{{comment.created_at}}</p>
                                </div>
                                <div class="reply-wrapper">
                                    <p>supermaninvoz said:</p>
                                    <div class="reply-body">
                                        <p>forum ko có công cụ lọc nick phản cảm nhỉ? có mấy game đặt tên như admin,
                                            gamemaster, f-uck, suc-k co-ck này nọ ko được ngay cả lách cũng ko được.</p>
                                    </div>
                                </div>
                                <div class="comment-body">
                                    <p>{{comment.body}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import axios from "@/plugins/axios"
import qs from "qs"

export default {
    data() {
        return {
            products: [],
            brandName: '',
            comments: []
        };
    },
    computed: {
        animation() {
            return this.$store.state.animation
        }
    },
    mounted() {
        this.fetchDatas();
    },
    methods: {
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
                    self.fetchBrand();
                }, 300);
                setTimeout(function () {
                    self.fetchComment();
                }, 500);
            }).catch(err => {
                console.log(err)
            })
        },
        async fetchBrand() {
            const brandQuery = {
                method: "GET",
                url: "brands/" + this.products.brand_id
            }
            await axios(brandQuery).then(res => {
                this.brandName = res.data;
            }).catch(err => {
                console.log("fetchBrand: " + err)
            })
        },
        async fetchComment() {
            const brandQuery = {
                method: "POST",
                url: "show_comments/" + this.$route.params.id
            }
            await axios(brandQuery).then(res => {
                this.comments = res.data.comment;
                console.log(this.comments)
            }).catch(err => {
                console.log(err)
            })
        }
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