<template>
  <div class="view-container">
    <article>
      <header>
        <div class="view-progress">
          <div class="progress-step" :class="{'active':index === activeStep}" v-for="(step, index) in formSteps"
            :key="'step'+index">
            {{ index + 1 }}
          </div>
        </div>

        <div class="header-action">
          <router-link :to="{name: 'gettingStarted'}" tag="a">Back</router-link>
        </div>
      </header>
      <section :class="animation">
        <div class="section-header">
          <p class="section-title">{{ formSteps[activeStep].name }}</p>
        </div>
        <SectionHeader></SectionHeader>
        <div class="separator"></div>
        <div class="input-fields">
          <input type="radio" name="userChoice" id="checkClone" @click="checkValid(index)" style="display:none" checked>

          <div class="tile" v-for="(field, index) in formSteps[activeStep].fields" :key="'field'+index">
            <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice" class="tile-input">
            <label for="userChoice" class="tile-label">
              <div class="tile-wrapper">
                <div class="item-img-wrapper">
                  <img :src="field.url" alt="" class="item-img">
                </div>
                <h5 class="tile-name">{{ field.label }}</h5>
                <h6 class="tile-price" id="tile-priceH">${{ field.price }}</h6>
              </div>
            </label>
          </div>
        </div>
        <div class="actions">
          <router-link :to="{name: 'build-guide'}" tag="button" @mouseleave.native="rotateBackGuide"
            @mouseenter.native="resetBgGuide" id="action-guide">Build Guides</router-link>
          <router-link :to="{name: 'pre-build'}" tag="button" @mouseleave.native="rotateBackRouter"
            @mouseenter.native="resetBgRouter" id="action-router">Pre-build</router-link>
          <button v-if="activeStep +1 < formSteps.length -1" @click="checkFields" @mouseleave="rotateBack"
            @mouseenter="resetBg" id="action-btn">next</button>
          <button v-if="activeStep +1 == formSteps.length -1" @click="checkFields" @mouseleave="rotateBack"
            @mouseenter="resetBg" id="action-btn">done</button>
        </div>
      </section>
    </article>
  </div>
</template>

<script>
import SectionHeader from '@/components/SectionHeader.vue'
import axios from "axios";

export default {
  components: {
    SectionHeader
  },
  data: () => {
    return {
      dataFormSteps: null,
      activeStep: 0,
      animation: 'animate-in',
      valid: false,
    }
  },
  async mounted() {
    const config = {
      method: "GET",
      url: "http://localhost:3000/api/v1/products",
    };

    try {
      let res = await axios(config);
      this.dataFormSteps = res.data;
      this.$store.commit("getData", this.dataFormSteps);
    } catch (err) {
      console.log(err);
    }
  },
  // mounted() {
  //   // this.checkLocalStorage()
  // },
  computed: {
    formSteps() {
      return this.$store.state.formSteps
    },
  },
  methods: {
    nextStep() {
      this.clearForm()
      this.animation = 'animate-out';
      setTimeout(() => {
        this.animation = 'animate-in';
        this.activeStep += 1;
      }, 550);
    },
    clearForm() {
      const radio = document.getElementById("checkClone")
      radio.checked = true;
      this.valid = false
    },
    redirect() {
      this.$router.push({ path: '/' })
    },
    checkFields() {
      if (this.valid) {
        this.nextStep();
        // this.updateEstimate()
        // this.formatEstimate()
      }
      else {
        this.animation = 'animate-wrong';
        setTimeout(() => {
          this.animation = '';
        }, 400);
      }
    },
    // formatEstimate() {
    //   const estimated = localStorage.getItem('estimate').replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
    //   const estimateP = document.getElementById('estimateP')
    //   estimateP.innerHTML = "Estimated: $" + estimated
    // },
    checkValid(index) {
      this.valid = true;
      // this.id = index;
    },
    // updateEstimate() {
    //   let oldEstimate = parseInt(localStorage.getItem("estimate"))
    //   let intNewInput = parseInt(this.formSteps[this.activeStep].fields[this.id].price)
    //   let newEstimate = oldEstimate += intNewInput
    //   localStorage.setItem('estimate', newEstimate)
    // },
    rotateBack() {
      const btn = document.getElementById("action-btn")
      btn.classList.add("bg-back");
    },
    resetBg() {
      const btn = document.getElementById("action-btn")
      btn.classList.remove("bg-back");
    },
    rotateBackRouter() {
      const btn = document.getElementById("action-router")
      btn.classList.add("bg-back");
    },
    resetBgRouter() {
      const btn = document.getElementById("action-router")
      btn.classList.remove("bg-back");
    },
    rotateBackGuide() {
      const btn = document.getElementById("action-guide")
      btn.classList.add("bg-back");
    },
    resetBgGuide() {
      const btn = document.getElementById("action-guide")
      btn.classList.remove("bg-back");
    },
    // checkLocalStorage() {
    //   let oldData = localStorage.getItem('name')
    //   if (!oldData) {
    //     this.$router.push({ path: '/' })
    //   }
    // }
  }
}
</script>

<style scoped>
@import url('https://use.fontawesome.com/releases/v5.8.2/css/all.css');
</style>