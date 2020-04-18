import Vue from 'vue';
const axios = require('axios');
const _ = require('lodash');

const state = {
    data: 0
};

const getters = {
    'game/data': state => {
       // if (_.isEmpty(state)) return {}
        return state.data + 1;
    }
};

const mutations = {
    'game/dealIt':(state, payload) => {

        state.data +=1;
    },
};

const actions = {
    'game/newGame': ({ commit }) => {
        console.log('newGame')
        axios
            .post('/api/v1/games')
            .then(response=>( commit('game/dealIt', response.data)))
    },                
};

export default {
    state,
    mutations,
    actions,
    getters
}