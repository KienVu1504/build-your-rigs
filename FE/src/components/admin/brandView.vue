<template>
  <section :class="animation">
    <div class="section-header">
      <p class="section-title">Products</p>
    </div>
    <div class="search-wrapper">
      <input type="text" v-model="search" placeholder="Search by name.." />
    </div>
    <div class="separator"></div>
    <div class="input-fields">
      <div class="input-fields-wrapper">
        <router-link tag="div" :to="{ path: `/admin/products/` + $route.params.id + '/' + pr_attribute.id }"
          class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in filteredList"
          :key="'pr_attribute' + index">
          <div class="tile">
            <input type="radio" id="inputCheckbox" name="userChoice" class="tile-input">
            <label for="userChoice" class="tile-label">
              <div class="tile-wrapper">
                <div class="item-img-wrapper">
                  <img :src="pr_attribute.img || pr_attribute.image_url" alt="" class="item-img" />
                </div>
                <h4 class="tile-name">{{ pr_attribute.name }}</h4>
                <h5 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h5>
              </div>
            </label>
          </div>
        </router-link>
        <div class="no-data" v-if="filteredList.length == 0">
          <p>Can't find your item :(</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from "@/plugins/axios"
import qs from "qs"
import { mapState } from 'vuex'
export default {
  data() {
    return {
      products: [],
      search: ''
    };
  },
  mounted() {
    this.fetchDatas();
  },
  computed: {
    ...mapState([
      'animation'
    ]),
    filteredList() {
      return this.products.filter(post => {
        return post.name.toLowerCase().includes(this.search.toLowerCase())
      })
    }
  },
  methods: {
    async fetchDatas() {
      const productsQuery = {
        method: "GET",
        url: "search_pr",
        params: {
          q: {
            brand_id_in: this.$route.params.id
          }
        },
        paramsSerializer: params => {
          return qs.stringify(params)
        }
      }
      await axios(productsQuery).then(res => {
        this.products = res.data.data;
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