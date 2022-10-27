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
        <router-link tag="div" :to="{ path: `/admin/products/` + $route.params.id + '/' + pr_attribute.id }"
          class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-for="(pr_attribute, index) in products"
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
        <div class="no-data" v-if="products.length == 0">
          <p>Can't find your item :(</p>
        </div>
      </div>

      <Pagination @fetchNewDatas="fetchDatas(search)"></Pagination>

    </div>
  </section>
</template>

<script>
import Pagination from './pagination.vue';
import { createNamespacedHelpers, mapState } from 'vuex'
const productStore = createNamespacedHelpers('productsData')

export default {
  data() {
    return {
      search: ''
    };
  },
  mounted() {
    this.fetchDatas();
  },
  components: {
    Pagination
  },
  computed: {
    ...mapState([
      'animation'
    ]),
    ...productStore.mapState([
      'products'
    ])
  },
  methods: {
    searchReset() {
      this.$store.commit('paging/resetPage')
      this.fetchDatas(this.search)
    },
    ...productStore.mapActions([
      'fetchDatas'
    ])
  }
}
</script>

<style scoped>
.tile-input:after {
  display: none;
}
</style>