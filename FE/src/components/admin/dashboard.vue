<template>
  <section :class="animation">
    <div class="section-header">
      <p class="section-title">Dashboard</p>
    </div>
    <div class="separator"></div>
    <div class="input-fields">
      <div class="input-fields-wrapper">
        <template v-for="(category, index) in formSteps">
          <router-link tag="div" :to="{ path: `/admin/products/` + category.id }"
            class="counter-wrapper-outer col-lg-4 col-md-6 col-sm-12" :key="category.id" v-if="index <= 8">
            <div class="counter-wrapper">
              <div class="counter-right">
                <img :src="category.img" v-if="category.image_url == null" alt="">
                <img :src="category.img" v-if="category.img == null" alt="">
              </div>
              <div class="counter-left">
                <p class="counter-name">{{ category.name }}</p>
                <p class="counter">{{ category.count }} products</p>
              </div>
            </div>
          </router-link>
        </template>
        <router-link tag="div" :to="{ path: '/admin/pre-builds/' }"
          class="counter-wrapper-outer col-lg-6 col-md-6 col-sm-12">
          <div class="counter-wrapper">
            <div class="counter-right">
              <img src="@/assets/images/gsImage.png" alt="">
            </div>
            <div class="counter-left">
              <p class="counter-name">Pre-build set</p>
              <p class="counter">{{ preBuildCount }} sets</p>
            </div>
          </div>
        </router-link>
        <router-link tag="div" :to="{ path: '/admin/brands' }"
          class="counter-wrapper-outer col-lg-6 col-md-6 col-sm-12">
          <div class="counter-wrapper">
            <div class="counter-right">
              <img src="@/assets/images/logo.png" alt="">
            </div>
            <div class="counter-left">
              <p class="counter-name">Brands</p>
              <p class="counter">{{ brandNumber }} brands</p>
            </div>
          </div>
        </router-link>
      </div>
    </div>
  </section>
</template>

<script>
import { createNamespacedHelpers, mapState } from 'vuex'
import axios from '@/plugins/axios'
const formStepsStore = createNamespacedHelpers('formStepsData')
const preBuildStore = createNamespacedHelpers('preBuild')

export default {
  data() {
    return {
      brandNumber: ''
    };
  },
  async mounted() {
    await this.fetchSteps()
    await this.fetchPreBuildCount()
    await this.brandCount()
  },
  computed: {
    ...mapState([
      'animation'
    ]),
    ...formStepsStore.mapState([
      'formSteps'
    ]),
    ...preBuildStore.mapState([
      'preBuildCount'
    ]),
  },
  methods: {
    ...formStepsStore.mapActions([
      'fetchSteps'
    ]),
    ...preBuildStore.mapActions([
      'fetchPreBuildCount'
    ]),
    async brandCount() {
      const cpusQuery = {
        method: "GET",
        url: "brand_count"
      }
      await axios(cpusQuery).then(res => {
        this.brandNumber = res.data.count;
      }).catch(err => {
        console.log(err)
      })
    },
  },
};
</script>

<style scoped>

</style>