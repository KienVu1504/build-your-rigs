<template>
    <div>
        <h1 @click="test">dsa</h1>
        fdsfkdj
    </div>
</template>

<script>
    import {ref} from 'vue'
export default {
    props: {
        value : {
          type: Array ,
          default : () => []
        }
    },
    setup(props) {
        const test = () => {
            console.log(props.value.name)
        }
        return {
            test
        }
        
    }
  
};
</script>

<style lang="scss" scoped>

</style>