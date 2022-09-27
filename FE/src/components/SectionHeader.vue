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
        getLSUserCIH() {
            const cih = this.$store.state.cih.replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            const cihP = document.getElementById('cihP')
            cihP.innerHTML = "Your CIH: $" + cih
        },
        formatEstimate() {
            const estimated = this.$store.state.estimated.replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
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