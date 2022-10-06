<template>
    <div>
        <Hjhgj :value="valueT" />
    </div>
</template>

<script>
import Hjhgj from './hjhgj.vue';
export default {
    name: "BuildYourRigsTestdsad",
    data() {
        return {
            valueT: [
                {
                    id : '1',
                    name:"dsajhd"
                }
            ]
        };
    },
    mounted() {
    },
    methods: {},
    components: { Hjhgj }
};
</script>

<style lang="scss" scoped>

</style>