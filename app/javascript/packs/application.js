require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import Vue from 'vue/dist/vue.esm'

import axios from 'axios'
import VueAxios from 'vue-axios' 
Vue.use(VueAxios, axios)

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import App from '../app.vue'
Vue.component('app', App)

import Hand from '../components/hand.vue'
Vue.component('hand', Hand)

import Game from '../components/game.vue'
Vue.component('game', Game)

import Information from '../components/information.vue'
Vue.component('information', Information)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#main',
  })
})
