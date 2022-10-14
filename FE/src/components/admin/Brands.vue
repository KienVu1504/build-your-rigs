<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Products</p>
        </div>
        <div class="search-wrapper">
            <input type="text" v-model="search" @keyup="searchReset" placeholder="Search by name.." />
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <router-link tag="div" :to="{ path: `/admin/brands/` + pr_attribute.id }"
                    class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute' + index">
                    <div class="tile">
                        <input type="radio" id="inputCheckbox" name="userChoice" class="tile-input" />
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img || pr_attribute.image_url" alt="" class="product-img" />
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">
                                    {{ pr_attribute.count }} products
                                </h5>
                            </div>
                        </label>
                    </div>
                </router-link>

                <div class="no-data" v-if="filteredList.length == 0">
                    <p>Can't find your item :(</p>
                </div>
            </div>

            <center class="pagi-center">
                <div class="pagination-wrapper" v-if="pages.pages > 1">
                    <div>&laquo;</div>
                    <div :key="page" v-if="pages.page > 3" :class="{ active: pages.page === page }"
                        @click="changePage(pages.page)">
                        <p>1</p>
                    </div>
                    <div v-if="pages.page >= 4">
                        <p>...</p>
                    </div>
                    <template v-for="page in pages.pages">
                        <div :key="page" v-if="page <= pages.page + 2 && page >= pages.page - 2"
                            :class="{ active: pages.page === page }">
                            <p>{{ page }}</p>
                        </div>
                    </template>
                    <div v-if="pages.page <= pages.pages - 4">
                        <p>...</p>
                    </div>
                    <div :key="page" v-if="pages.page <= pages.pages - 3" :class="{ active: pages.page === page }">
                        <p>{{pages.pages}}</p>
                    </div>
                    <div>&raquo;</div>
                </div>
            </center>
        </div>
    </section>
</template>

<script>
import axios from "@/plugins/axios";
import qs from "qs";

export default {
    data() {
        return {
            brands: [],
            search: "",
            pages: {},
            currentPage: 5,
        };
    },
    computed: {
        animation() {
            return this.$store.state.animation;
        },
        filteredList() {
            return this.brands.filter((post) => {
                return post.name.toLowerCase().includes(this.search.toLowerCase());
            });
        },
    },
    mounted() {
        this.fetchDatas();
    },
    methods: {
        searchReset() {
            this.fetchDatas()
            this.currentPage = 1;
        },
        changePage(page) {
            this.currentPage = page;
        },
        async fetchDatas() {
            const brandsQuery = {
                method: "GET",
                url: `search_brands?page=` + this.currentPage,
                params: {
                    q: {
                        name_cont: this.search,
                    },
                },
                paramsSerializer: (params) => {
                    return qs.stringify(params);
                },
            };
            await axios(brandsQuery)
                .then((res) => {
                    this.brands = res.data.brand;
                    this.pages = res.data.page;
                })
                .catch((err) => {
                    console.log(err);
                });
        },
    },
};
</script>

<style scoped>
.tile-input:after {
    display: none;
}

.pagination-wrapper {
    display: inline-block;
}

.pagination-wrapper div {
    color: black;
    float: left;
    width: 50px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
    border: 1px solid #ff008b;
    color: #ff008b;
    cursor: pointer;
}

.active {
    background-color: #ff008b;
    color: white;
    border: 1px solid #ff008b;
}

.active p {
    color: white;
}

.pagination-wrapper div:hover:not(.active) {
    background-color: #ddd;
}

.pagination-wrapper div:first-child {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.pagination-wrapper div:last-child {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
</style>