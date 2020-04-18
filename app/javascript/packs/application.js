// // require("@rails/ujs").start()
// // require("turbolinks").start()
// // require("@rails/activestorage").start()
// // require("channels")

// import Vue from 'vue/dist/vue.esm'

// import Vuex from 'vuex'
// Vue.use(Vuex)
// // import 'es6-promise/auto'


// import Table from '../bridge/table.vue'
// Vue.component('app', Table)

import Hand from '../components/hand.vue'
Vue.component('hand', Hand)

// // import game from '../components/game.vue'
// // Vue.component('game', game)

import Information from '../components/information.vue'
Vue.component('information', Information)

// import store from '../bridge/store'

// document.addEventListener('DOMContentLoaded', () => {
//   new Vue({
//     el: '#main',
//     store,
//   })
// })


import 'babel-polyfill'
import Vue from 'vue'
import Table from '../components/table.vue'
import store from '../store/store'
document.addEventListener('DOMContentLoaded', () => {
new Vue({
  el: '#main',
  store,
  render: h => h(Table)
})
})