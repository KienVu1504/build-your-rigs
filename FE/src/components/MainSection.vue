<template>
  <section :class="animation">
    <div class="section-header">
      <p class="section-title">{{ formSteps[activeStep]?.name }}</p>
    </div>
    <MainSearch></MainSearch>
    <SectionHeader></SectionHeader>
    <div class="separator"></div>
    <div class="input-fields" v-if="filteredList">
      <input type="radio" name="userChoice" id="checkClone" @click="checkValid(index)" style="display:none" checked>
      <div class="no-data" v-if="filteredList.length == 0 && activeStep != 9">
        <p>Can't find your item :(</p>
      </div>
      <div class="input-fields-wrapper">
        <template v-for="(pr_attribute, index) in filteredList">
          <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" v-bind:key="index" v-if="activeStep != 9">
            <div class="tile">
              <input type="radio" @click="checkValid(pr_attribute.id)" id="inputCheckbox" name="userChoice"
                class="tile-input">
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
          </div>
        </template>
        <div class="all-view-wrapper">
          <div class="row" v-if="activeStep == 9">
            <div class="col-12">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col-1">Image</th>
                    <th scope="col-2">Name</th>
                    <th scope="col-2">Brand</th>
                    <th scope="col-2">Socket</th>
                    <th scope="col-2">DIMM</th>
                    <th scope="col-2">Form</th>
                    <th scope="col-2">SSD</th>
                    <th scope="col-2">HDD</th>
                    <th scope="col-2">TDP</th>
                    <th scope="col-2">Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="product in filteredList" v-bind:key="product.id">
                    <th scope="row"><img :src="product.img || product.image_url" alt="" class="product-img-small"></th>
                    <td>{{ product.name }}</td>
                    <td>{{ product.brand_name }}</td>
                    <td>{{ product.socket }}</td>
                    <td>{{ product.dimm }}</td>
                    <td>{{ product.form }}</td>
                    <td>{{ product.ssd }}</td>
                    <td>{{ product.hdd }}</td>
                    <td>{{ product.wattage }}</td>
                    <td>{{ product.price }}$</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <ActionButton></ActionButton>
  </section>
</template>
<script>
import SectionHeader from '@/components/SectionHeader.vue'
import ActionButton from '@/components/ActionButton.vue'
import MainSearch from './admin/mainSearch.vue';
import { createNamespacedHelpers, mapState } from 'vuex'
const searchStore = createNamespacedHelpers('search')
const formStepsStore = createNamespacedHelpers('formStepsData')
export default {
  components: {
    ActionButton,
    SectionHeader,
    MainSearch
  },
  computed: {
    filteredList() {
      if (this.activeStep == 0) {
        if (this.cpu.data) {
          return this.cpu.data.filter(post => {
            return post.name.toLowerCase().includes(this.search.toLowerCase())
          })
        }
      } else if (this.activeStep == 1) {
        return this.cooler.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 2) {
        return this.main.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 3) {
        return this.ram.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 4) {
        return this.ssd.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 5) {
        return this.hdd.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 6) {
        return this.gpu.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 7) {
        return this.case.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 8) {
        return this.psu.data.filter(post => {
          return post.name.toLowerCase().includes(this.search.toLowerCase())
        })
      } else if (this.activeStep == 9) {
        return this.completedRig
      }
    },
    ...formStepsStore.mapState([
      'activeStep',
      'formSteps'
    ]),
    ...searchStore.mapState([
      'cpu',
      'cooler',
      'main',
      'ram',
      'ssd',
      'hdd',
      'gpu',
      'case',
      'psu',
      'search',
      'completedRig'
    ]),
    ...mapState([
      'valid',
      'animation'
    ])
  },
  async mounted() {
    this.checkLocalStorage()
    await this.fetchSteps();
    if (this.activeStep == 0) {
      this.fetchCpus();
    }
  },
  methods: {
    ...formStepsStore.mapMutations([
      'setValid'
    ]),
    ...searchStore.mapMutations([
      'setCPU',
      'setCOOLER',
      'setMAIN',
      'setRAM',
      'setSSD',
      'setHDD',
      'setGPU',
      'setCASE',
      'setPSU',
    ]),
    ...searchStore.mapActions([
      'fetchCpus',
      'fetchSelectedData',
    ]),
    ...formStepsStore.mapActions([
      'fetchSteps'
    ]),
    redirect() {
      this.$router.push({ path: '/' })
    },
    checkValid(id) {
      this.setValid()
      if (this.activeStep == 0) {
        this.setCPU(id)
      } else if (this.activeStep == 1) {
        this.setCOOLER(id)
      } else if (this.activeStep == 2) {
        this.setMAIN(id)
      } else if (this.activeStep == 3) {
        this.setRAM(id)
      } else if (this.activeStep == 4) {
        this.setSSD(id)
      } else if (this.activeStep == 5) {
        this.setHDD(id)
      } else if (this.activeStep == 6) {
        this.setGPU(id)
      } else if (this.activeStep == 7) {
        this.setCASE(id)
      } else if (this.activeStep == 8) {
        this.setPSU(id)
      }
    },
    checkLocalStorage() {
      let oldData = this.$store.state.userInfo.cih
      if (oldData == 0 || oldData == null) {
        this.$router.push({ path: '/' })
      }
    }
  }
}
</script>
<style>
th,
td {
  text-align: center;
  font-size: 1.4rem;
}
</style>