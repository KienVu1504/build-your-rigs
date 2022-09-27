<template>
    <div class="header-right">
        <p id="wattageP" class="wattageP"></p>
        <p id="estimateP" class="estimateP"></p>
        <p id="cihP" class="cihP"></p>
    </div>
</template>

<script>
export default {
    // data: function () {
    //     return {
    //         estimate: 1500
    //     }
    // },
    mounted() {
        // this.getLSUserCIH()
        // this.formatEstimate()
        // this.getWattage()
    },
    methods: {
        // getLSUserCIH() {
        //     const cih = localStorage.getItem('cih').replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
        //     const cihP = document.getElementById('cihP')
        //     cihP.innerHTML = "Your CIH: $" + cih
        // },
        // formatEstimate() {
        //     const estimated = localStorage.getItem('estimate').replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
        //     const estimateP = document.getElementById('estimateP')
        //     estimateP.innerHTML = "Estimated: $" + estimated
        // },
        // getWattage() {
        //     const estimated = localStorage.getItem('wattage')
        //     const estimateP = document.getElementById('wattageP')
        //     estimateP.innerHTML = "Estimated Wattage: " + estimated + "W"
        // }
    },
};
</script>