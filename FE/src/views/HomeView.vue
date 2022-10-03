<template>
  <div class="view-container">
    <article>
      <SideStep></SideStep>
      <MainSection></MainSection>
    </article>
  </div>
</template>

<script>
import SideStep from '@/components/SideStep.vue'
import MainSection from '@/components/MainSection.vue'

export default {
  components: {
    SideStep,
    MainSection,
  },
}
</script>

<style scoped>
@import url('https://use.fontawesome.com/releases/v5.8.2/css/all.css');
@import "@/assets/styles/rs.css";
</style>