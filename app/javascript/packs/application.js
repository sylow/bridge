require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import Vue from 'vue/dist/vue.esm'

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import App from '../app.vue'
Vue.component('app', App)

import Hand from '../components/hand.vue'
Vue.component('hand', Hand)


document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#main',
  })
})
