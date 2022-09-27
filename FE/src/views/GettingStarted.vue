<template>
  <div class="input-container" @mousemove="mousemove" @mouseenter="mouseenter" @mouseleave="mouseleave">
    <div class="inputBg"></div>

    <div class="input-box">
      <div class="path" id="path"></div>

      <form class="input-form" id="form" @submit="checkForm">
        <h1 class="input-title">Getting Started</h1>
        <br>
        <label class="input-label">Name: </label>
        <br>
        <input class="input-text" type="text" id="username" placeholder="Enter Your First Name..." required
          maxlength="9" pattern="[A-Za-z]+" @keyup="checkValue" v-model="username">
        <br>
        <br>
        <label class="input-label">Cash in hand (CIH): </label>
        <br>
        <input max="999999999" class="input-text" type="number" id="cih" @keyup="checkCIH"
          placeholder="Enter Your CIH in $..." required min="0" maxlength="9" v-model="cih">
        <br>
        <button class="input-btn" type="submit" id="button">GO!</button>
        <br>
        <p v-if="error" class="errorShow" id="errorShow">{{error}}</p>
      </form>

      <img src="@/assets/images/gsImage.png" id="gsImage">
      <img src="@/assets/images/logo.png" id="logo">

      <h2 class="input-header" id="input-header">BUILD YOUR RIGS</h2>
    </div>
  </div>
</template>

<script>

export default {
  name: 'GettingStarted',
  data() {
    return {
      username: '',
      cih: '',
      error: ''
    }
  },
  mounted() {
  },
  methods: {
    mousemove(event) {
      const box = document.querySelector('.input-box')
      let horizontal = (window.innerWidth / 2 - event.pageX) / 25
      let vertical = (window.innerHeight / 2 - event.pageY) / 25
      box.style.transform = `rotateX(${vertical}deg) rotateY(${horizontal}deg)`
    },
    mouseenter(event) {
      const box = document.querySelector('.input-box')
      const header = document.querySelector('#input-header')
      const gsImage = document.querySelector('#gsImage')
      const logo = document.querySelector('#logo')
      const form = document.querySelector('#form')
      box.style.transition = ".1s"
      header.style.transform = "translateZ(120px)"
      gsImage.style.transform = "translateZ(150px)"
      logo.style.transform = "translateZ(130px)"
      form.style.transform = "translateZ(100px)"
    },
    mouseleave(event) {
      const box = document.querySelector('.input-box')
      box.style.transition = ".1s"
      box.style.transform = `rotateX(0deg) rotateY(0deg)`
    },
    redirect() {
      this.saveToLS()
      this.$router.push({ path: '/home' })
    },
    saveToLS() {
      const name = document.getElementById('username').value;
      const cih = document.getElementById('cih').value;
      this.$store.commit("getName", name);
      this.$store.commit("getCih", parseInt(cih));
    },
    checkForm: function (e) {
      const name = document.getElementById('username').value;
      const cih = document.getElementById('cih').value;

      if (name == null || cih == null) {
        e.preventDefault();
      } else {
        if (name.length < 10 && cih > 0) {
          this.redirect()
        }
        e.preventDefault();
      }
    },
    checkValue() {
      if (/[^a-zA-Z]/.test(this.username)) {
        this.error = 'Please enter a valid name.';
      } else {
        this.error = '';
      }
    },
    checkCIH() {
      if (cih.value.length > 9) cih.value = cih.value.slice(0, 9);
      if (/[0-9]/.test(this.cih) && this.cih > 0) {
        this.error = '';
      } else {
        this.error = 'Please enter a valid number.';
      }
    },
    limitedNumber() {
      if (this.value.length > 9) this.value = this.value.slice(0, 9);
    }
  }
}
</script>
