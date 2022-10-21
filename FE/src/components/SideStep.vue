<template>
    <header>
        <div class="header-greeting">
            <p>Hello:<br>{{username}}</p>
        </div>
        
        <div class="view-progress">
            <div class="progress-step" :class="{'active':index === activeStep}" v-for="(step, index) in formSteps"
                :key="'step'+index" @mouseover="fetchSelectedPr(step.id-1)">
                {{ step.id }}
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12">
                    <div class="tile">
                        <input type="radio" id="inputCheckbox" name="userChoice" class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper" v-if="selectedPr[step.id-1]">
                                <div class="item-img-wrapper">
                                    <img :src="selectedPr[step.id-1].img || selectedPr[step.id-1].image_url" alt=""
                                        class="item-img" />
                                </div>
                                <h4 class="tile-name">{{selectedPr[step.id-1].name}}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{selectedPr[step.id-1].price}}</h5>
                            </div>
                            <div class="tile-wrapper" v-else>
                                <center>
                                    <p>No product selected!</p>
                                </center>
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-action">
            <router-link :to="{name: 'gettingStarted'}" tag="a">Back</router-link>
        </div>
    </header>
</template>

<script>
import axios from "@/plugins/axios";
export default {
    data() {
        return {
            selectedPr: []
        };
    },
    computed: {
        activeStep() {
            return this.$store.state.formStepsData.activeStep
        },
        username() {
            return this.$store.state.userInfo.name
        },
        formSteps() {
            return this.$store.state.formStepsData.formSteps
        },
    },
    methods: {
        async fetchSelectedPr(id) {
            if (id != undefined) {
                const productsQuery = {
                    method: "GET",
                    url: `pr_attributes/` + this.$store.state.search.selectedData[id]
                }
                if (this.$store.state.search.selectedData[id] !== undefined) {
                    await axios(productsQuery).then(res => {
                        this.selectedPr[id] = res.data
                    }).catch(err => {
                        console.log(err)
                    })
                }
            }
        },
    }
};
</script>