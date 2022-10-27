<template>
  <div class="header-right">
    <p id="wattageP" class="wattageP"></p>
    <p id="estimateP" class="estimateP"></p>
    <p id="cihP" class="cihP"></p>
  </div>
</template>

<script>
export default {
  mounted() {
    this.getLSUserCIH()
    this.formatEstimate()
    this.getWattage()
  },
  methods: {
    currency(data) {
      return data.toString().replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
    },
    getLSUserCIH() {
      const cihInt = this.$store.state.userInfo.cih
      const cih = this.currency(cihInt)
      const cihP = document.getElementById('cihP')
      cihP.innerHTML = "Your CIH: $" + cih
    },
    formatEstimate() {
      const estimated = this.currency(this.$store.state.estimated)
      const estimateP = document.getElementById('estimateP')
      estimateP.innerHTML = "Estimated: $" + estimated
    },
    getWattage() {
      const estimated = this.$store.state.wattage
      const estimateP = document.getElementById('wattageP')
      estimateP.innerHTML = "Estimated Wattage: " + estimated + "W"
    }
  }
}
</script>