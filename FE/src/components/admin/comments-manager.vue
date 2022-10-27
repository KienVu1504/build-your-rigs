<template>
    <section :class="animation">
        <div class="section-header">
            <p class="section-title">Comments</p>
            <div class="router-wrapper">
                <router-link :to="{ path: '/admin/comments-manager' }" class="nav-buttons" tag="div">All comments
                </router-link>
                <router-link :to="{ path: '/admin/comments-manager/reported-comments' }" class="nav-buttons" tag="div">
                    Reported comments
                </router-link>
            </div>
        </div>
        <div class="separator"></div>
        <div class="input-fields">
            <div class="input-fields-wrapper">
                <router-view></router-view>
            </div>
        </div>
    </section>
</template>

<script>
import { mapState } from 'vuex'
export default {
    computed: {
        ...mapState([
            'animation'
        ])
    },
};
</script>

<style scoped>
@import url(@/assets/styles/admin.css);

.section-header {
    width: 98%;
}
</style>