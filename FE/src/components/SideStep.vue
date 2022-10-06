<template>
    <header>
        <div class="header-greeting">
            <p>Hello:<br>{{username}}</p>
        </div>

        <div class="view-progress">
            <div class="progress-step" :class="{'active':index === activeStep}" v-for="(step, index) in formSteps"
                :key="'step'+index">
                {{ index + 1 }}
            </div>
        </div>

        <div class="header-action">
            <router-link :to="{name: 'gettingStarted'}" tag="a">Back</router-link>
        </div>
    </header>
</template>

<script>
export default {
    computed: {
        activeStep() {
            return this.$store.state.activeStep
        },
        username() {
            return this.$store.state.name
        },
        formSteps() {
            return this.$store.state.formSteps
        },
    },
};
</script>