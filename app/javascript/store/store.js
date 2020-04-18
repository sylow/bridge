import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
const axios = require('axios');

const state = {
  game: {}
}

const mutations = {
  newGame (state, payload){
    state.game = payload
  }
}

const actions = {
  newGame ({ commit }) {
    axios
    .post('/api/v1/games')
    .then(response => (commit('newGame', response.data)))   
  }
}

// getters are functions.
const getters = {
  game: state => state.game
}

// A Vuex instance is created by combining the state, mutations, actions,
// and getters.
export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})
