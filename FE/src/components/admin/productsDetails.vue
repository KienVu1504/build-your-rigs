<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Products Details</p>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <div class="details-wrapper">
                    <h2>{{this.products[0].name}}</h2>
                    <div class="section-left">
                        <div class="product-img-outer">
                            <img :src="products[0].img" v-if="products[0].image_url == null" alt="" class="product-img">
                            <img :src="products[0].image_url" v-if="products[0].img == null" alt="" class="product-img">
                        </div>
                    </div>

                    <div class="section-right">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
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
            // search: ''
        };
    },
    computed: {
        animation() {
            return this.$store.state.animation
        },
        // filteredList() {
        //     return this.products.filter(post => {
        //         return post.name.toLowerCase().includes(this.search.toLowerCase())
        //     })
        // }
    },
    mounted() {
        this.fetchDatas();
    },
    methods: {
        async fetchDatas() {
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
                this.products = res.data;
                // console.log(this.products[0].name)
            }).catch(err => {
                console.log(err)
            })
        },
    }
}
</script>

<style scoped>
.tile-input:after {
    display: none;
}
</style>