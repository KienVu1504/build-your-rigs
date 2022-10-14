<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Products</p>
        </div>
        <div class="search-wrapper">
            <input type="text" v-model="search" @keyup="fetchDatas" placeholder="Search by name.." />
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <router-link tag="div" :to="{path: `/admin/brands/` + pr_attribute.id}"
                    class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12"
                    v-for="(pr_attribute, index) in filteredList" :key="'pr_attribute'+index">
                    <div class="tile">
                        <input type="radio" id="inputCheckbox" name="userChoice" class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img :src="pr_attribute.img || pr_attribute.image_url" alt="" class="product-img">
                                </div>
                                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                                <h5 class="tile-price" id="tile-priceH">{{ pr_attribute.count }} products</h5>
                            </div>
                        </label>
                    </div>
                </router-link>

                <div class="no-data" v-if="filteredList.length == 0">
                    <p>Can't find your item :(</p>
                </div>

                <div class="container-pagination middle-pagination">
                    <div class="pagination-wrapper">
                        <ul>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li class="active"><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                        </ul>
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
            brands: [],
            search: '',
            pages: {},
            currentPage: 1
        };
    },
    computed: {
        animation() {
            return this.$store.state.animation
        },
        filteredList() {
            return this.brands.filter(post => {
                return post.name.toLowerCase().includes(this.search.toLowerCase())
            })
        }
    },
    mounted() {
        this.fetchDatas();
    },
    methods: {
        async fetchDatas() {
            const brandsQuery = {
                method: "GET",
                url: `search_brands?page=` + this.currentPage,
                params: {
                    q: {
                        name_cont: this.search
                    }
                },
                paramsSerializer: params => {
                    return qs.stringify(params)
                }
            }
            await axios(brandsQuery).then(res => {
                this.brands = res.data.brand;
                this.pages = res.data.page;
                console.log(this.pages)
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

*, *::after, *::before {
    box-sizing: border-box;
  }
  body {
    color: #fff;
    background: #949c4e;
    background: linear-gradient(115deg, #56d8e4 10%, #9f01ea 90%);
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
  html, body {
    min-height: 100vh;
  }
  .center {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .container-pagination {
    background: #fdfdfd;
    padding: 1rem;
    margin: 3rem auto;
    border-radius: 0.2rem;
    box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.3);
    counter-reset: pagination;
    text-align: center;
  }
  .container-pagination:after {
    clear: both;
    content: "";
    display: table;
  }
  .container-pagination ul {
    width: 100%;
  }
  .xlarge {
    width: 65rem;
  }
  .large {
    width: 45rem;
  }
  .middle {
    width: 32rem;
  }
  .small {
    width: 22rem;
  }
  .xsmall {
    width: 14rem;
  }
  ul, li {
    list-style: none;
    display: inline;
    padding-left: 0px;
  }
  li {
    counter-increment: pagination;
  }
  li:hover a {
    color: #fdfdfd;
    background-color: #1d1f20;
    border: solid 1px #1d1f20;
  }
  li.active a {
    color: #fdfdfd;
    background-color: #1d1f20;
    border: solid 1px #1d1f20;
  }
  li:first-child {
    float: left;
  }
  li:first-child a:after {
    content: "Previous";
  }
  li:nth-child(2) {
    counter-reset: pagination-wrapper;
  }
  li:last-child {
    float: right;
  }
  li:last-child a:after {
    content: "Next";
  }
  li a {
    border: solid 1px #d7d7d7;
    border-radius: 0.2rem;
    color: #7d7d7d;
    text-decoration: none;
    text-transform: uppercase;
    display: inline-block;
    text-align: center;
    padding: 0.5rem 0.9rem;
  }
  li a:after {
    content: " " counter(pagination) " ";
  }
  .large li a {
    display: none;
  }
  .large li:first-child a {
    display: inline-block;
  }
  .large li:first-child a:after {
    content: "Previous";
  }
  .large li:nth-child(2) a {
    display: inline-block;
  }
  .large li:nth-child(3) a {
    display: inline-block;
  }
  .large li:nth-child(4) a {
    display: inline-block;
  }
  .large li:nth-child(5) a {
    display: inline-block;
  }
  .large li:nth-child(6) a {
    display: inline-block;
  }
  .large li:nth-child(7) a {
    display: inline-block;
  }
  .large li:nth-child(8) a {
    display: inline-block;
  }
  .large li:last-child a {
    display: inline-block;
  }
  .large li:last-child a:after {
    content: "Next";
  }
  .large li:nth-last-child(2) a {
    display: inline-block;
  }
  .large li:nth-last-child(3) {
    display: inline-block;
  }
  .large li:nth-last-child(3):after {
    padding: 0 1rem;
    content: "...";
  }
  .middle-pagination li a {
    display: none;
  }
  .middle-pagination li:first-child a {
    display: inline-block;
  }
  .middle-pagination li:first-child a:after {
    content: "<";
  }
  .middle-pagination li:last-child a {
    display: inline-block;
  }
  .middle-pagination li:last-child a:after {
    content: ">";
  }
  .middle li:nth-child(2) a {
    display: inline-block;
  }
  .middle-pagination li:nth-child(3) a {
    display: inline-block;
  }
  .middle-pagination li:nth-child(4) a {
    display: inline-block;
  }
  .middle-pagination li:nth-child(5) a {
    display: inline-block;
  }
  .middle-pagination li:nth-last-child(2) a {
    display: inline-block;
  }
  .middle-pagination li:nth-last-child(3) {
    display: inline-block;
  }
  .middle-pagination li:nth-last-child(3):after {
    padding: 0 1rem;
    content: "...";
  }
  .small li {
    display: none;
  }
  .small li:first-child {
    width: 50%;
    display: inline;
  }
  .small li:first-child a:after {
    content: "Previous Page";
  }
  .small li:last-child {
    display: inline;
  }
  .small li:last-child a:after {
    content: "Next Page";
  }
  .xsmall li {
    display: none;
  }
  .xsmall li.active {
    display: inline;
  }
  .xsmall li:first-child {
    display: inline;
  }
  .xsmall li:first-child a:after {
    content: "Prev";
  }
  .xsmall li:last-child {
    display: inline;
  }
  .xsmall li:last-child a:after {
    content: "Next";
  }
  
</style>