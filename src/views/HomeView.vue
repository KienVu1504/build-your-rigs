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
          <router-link :to="{name: 'gettingStarted'}" type="a">Back</router-link>
        </div>
      </header>
      <section :class="animation">
        <div class="section-header">
          <p class="section-title">{{ formSteps[activeStep].title }}</p>
        </div>
        <SectionHeader></SectionHeader>
        <div class="separator"></div>
        <div class="input-fields">
          <input type="radio" name="userChoice" id="checkClone" style="display:none" checked>
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

export default {
  components: {
    SectionHeader
  },
  data: () => {
    return {
      id: 0,
      activeStep: 0,
      animation: 'animate-in',
      valid: false,
      formSteps: [
        {
          title: "PICK YOUR CPU",
          fields: [
            { id: 1, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
            { id: 2, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
            { id: 3, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
            { id: 4, label: "i5 7800K", price: "500", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
            { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
          ]
        },
        {
          title: "PICK YOUR MAIN ",
          fields: [
            { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
            { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
            { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
            { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
            { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
          ]
        },
        {
          title: "PICK YOUR COOLER",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "PICK YOUR RAM",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "PICK YOUR SSD",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "PICK YOUR HDD",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "PICK YOUR GPU",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "PICK YOUR PSU",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "PICK YOUR CASE",
          fields: [
            { label: "can it run?" },
          ]
        },
        {
          title: "This is your completed rig!!!",
        }
      ],
    }
  },
  mounted() {
    this.checkLocalStorage()
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
        this.updateEstimate()
        this.formatEstimate()
      }
      else {
        this.animation = 'animate-wrong';
        setTimeout(() => {
          this.animation = '';
        }, 400);
      }
    },
    formatEstimate() {
      const estimated = localStorage.getItem('estimate').replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
      const estimateP = document.getElementById('estimateP')
      estimateP.innerHTML = "Estimated: $" + estimated
    },
    checkValid(index) {
      this.valid = true;
      console.log(index)
      this.id = index;
    },
    updateEstimate() {
      let oldEstimate = localStorage.getItem("estimate")
      let intEstimate = parseInt(oldEstimate)
      console.log(this.id)
      console.log(this.formSteps[this.activeStep].fields[this.id].price)
      let intNewInput = parseInt(this.formSteps[this.activeStep].fields[this.id].price)
      let newEstimate = intEstimate += intNewInput
      localStorage.setItem('estimate', newEstimate)
    },
    rotateBack() {
      const btn = document.getElementById("action-btn")
      btn.classList.add("bg-back");
    },
    resetBg() {
      const btn = document.getElementById("action-btn")
      btn.classList.remove("bg-back");
    },
    checkLocalStorage() {
      let oldData = localStorage.getItem('name')
      if (!oldData) {
        this.$router.push({ path: '/' })
      }
    }
  }
}
</script>

<style scoped>
@import url('https://use.fontawesome.com/releases/v5.8.2/css/all.css');
</style>