import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    // formSteps: [
    //   {
    //     title: "PICK YOUR CPU",
    //     fields: [
    //       { id: 1, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 2, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 3, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 4, label: "i5 7800K", price: "500", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 6, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 7, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 8, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "700", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //       { id: 5, label: "i5 7800K", price: "255", url: "https://brademar.com/wp-content/uploads/2022/05/Intel-Logo-PNG-2006-%E2%80%93-2020.png" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR MAIN ",
    //     fields: [
    //       { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
    //       { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
    //       { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
    //       { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
    //       { label: "Z490", price: "500", url: "https://storage-asset.msi.com/event/2020/mb/z490/images/chipset-Z490-10thgen-rgb-3000.png" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR COOLER",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR RAM",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR SSD",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR HDD",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR GPU",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR PSU",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "PICK YOUR CASE",
    //     fields: [
    //       { label: "can it run?" },
    //     ]
    //   },
    //   {
    //     title: "This is your completed rig!!!",
    //   }
    // ],
    // data: {}
    formSteps: []
  },
  getters: {
  },
  mutations: {
    getData(state, newData) {
      state.formSteps = newData
      console.log(state.formSteps)
    }
  },
  actions: {
  },
  modules: {
  }
})
