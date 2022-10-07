<template>
    <div class="actions">
        <router-link :to="{name: 'build-guide'}" tag="button" @mouseleave.native="rotateBackGuide"
            @mouseenter.native="resetBgGuide" id="action-guide">Build Guides</router-link>
        <router-link :to="{name: 'pre-build'}" tag="button" @mouseleave.native="rotateBackRouter"
            @mouseenter.native="resetBgRouter" id="action-router">Pre-build</router-link>
        <button v-if="activeStep +1 < formSteps.length -1" @click="checkFields" @mouseleave="rotateBack"
            @mouseenter="resetBg" id="action-btn">next</button>
        <button v-if="activeStep +1 == formSteps.length -1" @click="checkFields" @mouseleave="rotateBack"
            @mouseenter="resetBg" id="action-btn">done</button>
    </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
    computed: {
        activeStep() {
            return this.$store.state.activeStep
        },
        formSteps() {
            return this.$store.state.formSteps
        },
        valid() {
            return this.$store.state.valid
        },
        animation() {
            return this.$store.state.animation
        }
    },
    data() {
        return {
        };
    },
    methods: {
        ...mapActions([
            'fetchCoolers',
            'fetchMains',
            'fetchRams',
            'fetchSsds',
            'fetchHdds',
            'fetchGpus',
            'fetchCases',
            'fetchPsus'
        ]),
        nextStep() {
            this.clearForm()
            this.$store.commit("setAnimate", "animate-out")
            console.log(this.activeStep)
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
            }
            setTimeout(() => {
                this.$store.commit("setAnimate", "animate-in")
                this.$store.commit("setStep")
            }, 550);
        },
        checkFields() {
            if (this.valid) {
                this.nextStep()
            }
            else {
                this.$store.commit("setAnimate", "animate-wrong")
                setTimeout(() => {
                    this.$store.commit("setAnimate", "")
                }, 400);
            }
        },
        clearForm() {
            const radio = document.getElementById("checkClone")
            radio.checked = true;
            this.$store.commit("setValid")
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