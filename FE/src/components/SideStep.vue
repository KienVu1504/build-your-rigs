<template>
    <header>
        <div class="header-greeting">
            <p>Hello:<br>{{username}}</p>
        </div>

        <div class="view-progress">
            <div class="progress-step" :class="{'active':index === activeStep}" v-for="(step, index) in formSteps"
                :key="'step'+index">
                {{ index + 1 }}
                <div class="tile-wrapper-outer col-lg-3 col-md-4 col-sm-6 col-12" @mouseenter="fetchSelectedPr(step.id)">
                    <div class="tile">
                        <input type="radio" id="inputCheckbox" name="userChoice" class="tile-input">
                        <label for="userChoice" class="tile-label">
                            <div class="tile-wrapper">
                                <div class="item-img-wrapper">
                                    <img src="https://bn02pap001files.storage.live.com/y4mEGv0m7JW7HOvUlg2HcZS1sH6kxj2XaBEb65VAEf7LqswuoF0DaQK1Lcj82p6J74Y4tUBdHc3LU5XsINy9y4KAr1WEnfGyi-vZPWFCgnvf3rVKDxwm-mBN7EVfDPdeVZC6iPsCiKZLvXm1jJvfRrqMhFbS9XbRuoNyOtIiEjp3oh2zBrhDG-qoyPvXaQnqr5v?width=672&height=668&cropmode=none"
                                        alt="" class="item-img" />
                                </div>
                                <h4 class="tile-name">{{fetchSelectedPr.name}}</h4>
                                <h5 class="tile-price" id="tile-priceH">${{fetchSelectedPr.price}}</h5>
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
            const productsQuery = {
                method: "GET",
                url:`pr_attributes/` + id
            }
            await axios(productsQuery).then(res => {
                console.log(res.data.data[0]);
                // return res.data.data[0];
            }).catch(err => {
                console.log(err)
            })
        },
    }
};
</script>