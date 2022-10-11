import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'
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
  },
  {
    path: '/admin/',
    name: 'admin-panel',
    component: () => import('../views/Admin.vue'),
    children: [
      {
        path: 'login',
        name: 'login',
        component: () => import('../components/admin/login.vue')
      },
      {
        path: '',
        name: 'control-panel',
        component: () => import('../components/admin/controlPanel.vue'),
        children: [
          {
            path: '',
            name: 'dashboard',
            component: () => import('../components/admin/dashboard.vue')
          },
          {
            path: 'products/:id',
            component: () => import('../components/admin/ProductsView.vue')
          },
          {
            path: 'products/:id/:pr_id',
            component: () => import('../components/admin/productsDetails.vue')
          },
          {
            path: 'add-brand',
            component: () => import('../components/admin/addBrand.vue')
          },
          {
            path: 'profile',
            name: 'profile',
            component: () => import('../components/admin/profile.vue')
          },
          {
            path: 'add-product',
            name: 'add-product',
            component: () => import('../components/admin/addProduct.vue'),
            children: [
              {
                path: '',
                name: 'choose-category',
                component: () => import('../components/admin/categories.vue')
              },
              {
                path: 'add-CPU',
                name: 'add-cpu',
                component: () => import('../components/admin/addCpu.vue')
              },
              {
                path: 'add-COOLER',
                name: 'add-cooler',
                component: () => import('../components/admin/addCooler.vue')
              },
              {
                path: 'add-MAIN',
                name: 'add-main',
                component: () => import('../components/admin/addMain.vue')
              },
              {
                path: 'add-RAM',
                name: 'add-ram',
                component: () => import('../components/admin/addRAM.vue')
              },
              {
                path: 'add-SSD',
                name: 'add-ssd',
                component: () => import('../components/admin/addSSD.vue')
              },
              {
                path: 'add-HDD',
                name: 'add-hdd',
                component: () => import('../components/admin/addHDD.vue')
              },
              {
                path: 'add-GPU',
                name: 'add-gpu',
                component: () => import('../components/admin/addGPU.vue')
              },
              {
                path: 'add-CASE',
                name: 'add-case',
                component: () => import('../components/admin/addCASE.vue')
              },
              {
                path: 'add-PSU',
                name: 'add-psu',
                component: () => import('../components/admin/addPSU.vue')
              },
            ]
          }
        ]
      }
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  const isAuthenticated = store.state.userToken.token
  if (to.path.includes('/admin') && isAuthenticated.length == 0 && to.path !== "/admin/login") {
    next({ path: "/admin/login" })
  } else next()
})

export default router