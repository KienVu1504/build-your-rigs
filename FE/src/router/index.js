import Vue from 'vue'
import VueRouter from 'vue-router'
import GettingStarted from '@/views/GettingStarted'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'gettingStarted',
    component: GettingStarted
  },
  {
    path: '/home',
    name: 'home',
    component: () => import('../views/HomeView.vue')
  },
  {
    path: '/pre-build',
    name: 'pre-build',
    component: () => import('../views/PreBuild.vue')
  },
  {
    path: '/guide',
    name: 'build-guide',
    component: () => import('../views/BuildGuide.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router