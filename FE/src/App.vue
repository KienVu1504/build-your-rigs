<template>
  <div id="app">
    <transition name="component-fade" mode="out-in">
      <router-view />
    </transition>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
@import "assets/styles/styles.css";

@font-face {
  font-family: "Hemi";
  src: local("Hemi"),
    url(assets/fonts/FontsFree-Net-hemi-head-bd-it.ttf) format("truetype");
}

.component-fade-enter-active,
.component-fade-leave-active {
  transition: opacity .3s ease;
}

.component-fade-enter,
.component-fade-leave-to {
  opacity: 0;
}
</style>
