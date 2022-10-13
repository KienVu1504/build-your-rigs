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
            brandName: ''
        };
    },
    computed: {
        animation() {
            return this.$store.state.animation
        },
        // product() {
        //     return this.products[0] || {}
        // }
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
                // console.log(this.products);
                setTimeout(function () {
                    self.fetchBrand();
                }, 300);
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
                // console.log(this.brandName)
            }).catch(err => {
                console.log("fetchBrand: " + err)
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