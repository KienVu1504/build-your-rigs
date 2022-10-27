<template>
  <div class="actions">
    <router-link :to="{ name: 'build-guide' }" tag="button" @mouseleave.native="rotateBackGuide"
      @mouseenter.native="resetBgGuide" id="action-guide">Build Guides</router-link>
    <router-link :to="{ name: 'pre-build' }" tag="button" @mouseleave.native="rotateBackRouter"
      @mouseenter.native="resetBgRouter" id="action-router">Pre-build</router-link>
    <button v-if="activeStep + 1 < formSteps.length - 1" @click="checkFields" @mouseleave="rotateBack"
      @mouseenter="resetBg" id="action-btn">next</button>
    <button v-if="activeStep + 1 == formSteps.length - 1" @click="checkFields" @mouseleave="rotateBack"
      @mouseenter="resetBg" id="action-btn">done</button>
  </div>
</template>

<script>
import { createNamespacedHelpers, mapMutations, mapState } from 'vuex'
const searchStore = createNamespacedHelpers('search')
const formStepsStore = createNamespacedHelpers('formStepsData')

export default {
  computed: {
    ...formStepsStore.mapState([
      'activeStep',
      'formSteps',
      'valid'
    ]),
    ...mapState([
      'animation'
    ])
  },
  methods: {
    ...searchStore.mapActions([
      'fetchCoolers',
      'fetchMains',
      'fetchRams',
      'fetchSsds',
      'fetchHdds',
      'fetchGpus',
      'fetchCases',
      'fetchPsus',
      'fetchSelectedData'
    ]),
    ...mapMutations([
      'setAnimate'
    ]),
    ...formStepsStore.mapMutations([
      'setStep',
      'setValid'
    ]),
    nextStep() {
      this.clearForm()
      this.setAnimate("animate-out")
      if (this.activeStep == 0) {
        this.fetchCoolers();
      } else if (this.activeStep == 1) {
        this.fetchMains();
      } else if (this.activeStep == 2) {
        this.fetchRams();
      } else if (this.activeStep == 3) {
        this.fetchSsds();
      } else if (this.activeStep == 4) {
        this.fetchHdds();
      } else if (this.activeStep == 5) {
        this.fetchGpus();
      } else if (this.activeStep == 6) {
        this.fetchCases();
      } else if (this.activeStep == 7) {
        this.fetchPsus();
      } else if (this.activeStep == 8) {
        this.fetchSelectedData();
      }
      setTimeout(() => {
        this.setAnimate("animate-in")
        this.setStep()
      }, 550);
    },
    checkFields() {
      if (this.valid) {
        this.nextStep()
      }
      else {
        this.setAnimate("animate-wrong")
        setTimeout(() => {
          this.setAnimate("")
        }, 400);
      }
    },
    clearForm() {
      const radio = document.getElementById("checkClone")
      radio.checked = true;
      this.setValid()
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
  },
};
</script>