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
          <p class="section-title">{{ formSteps[activeStep]?.name }}</p>
        </div>
        <SectionHeader></SectionHeader>
        <div class="separator"></div>
        <div class="input-fields">
          <input type="radio" name="userChoice" id="checkClone" @click="checkValid(index)" style="display:none" checked>

          <div class="input-fields-wrapper" v-if="activeStep == 0">
            <div class="tile" v-for="(pr_attribute, index) in cpu" :key="'pr_attribute'+index">
              <input type="radio" @click="checkValid(index)" id="inputCheckbox" name="userChoice" class="tile-input">
              <label for="userChoice" class="tile-label">
                <div class="tile-wrapper">
                  <div class="item-img-wrapper">
                    <img :src="`/assets/images/products/` + pr_attribute.img" alt="" class="item-img">
                  </div>
                  <h5 class="tile-name">{{ pr_attribute.name }}</h5>
                  <h6 class="tile-price" id="tile-priceH">${{ pr_attribute.price }}</h6>
                </div>
              </label>
            </div>
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
import { mapActions } from 'vuex'

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
  computed: {
    formSteps() {
      return this.$store.state.formSteps
    },
    cpu() {
      return this.$store.state.cpu
    },
    main() {
      return this.$store.state.main
    }
  },
  async mounted() {
    await this.fetchSteps();
    if (this.activeStep == 0) {
      this.fetchCpus();
    }
  },

  methods: {
    ...mapActions([
      'fetchSteps',
      'fetchCpus'
    ]),
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
      }
      else {
        this.animation = 'animate-wrong';
        setTimeout(() => {
          this.animation = '';
        }, 400);
      }
    },
    checkValid(index) {
      this.valid = true;
    },
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
    checkLocalStorage() {
      let oldData = this.$store.state.cih
      if (oldData == 0 || oldData == null || oldData.length == 0) {
        this.$router.push({ path: '/' })
      }
    }
  }
}
</script>

<style scoped>
@import url('https://use.fontawesome.com/releases/v5.8.2/css/all.css');
</style>