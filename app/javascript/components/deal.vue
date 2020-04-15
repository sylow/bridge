<template>
  <div>
    <nav class="navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" style="font-size:150%" href="http://sylow.net">
          <strong>Bridge</strong>
        </a>

        <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <a class="button is-primary" @click='newDeal'>
                <strong>Deal</strong>
              </a>
              <a class="button is-light">
                Log in
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>    

    <div class="columns">
      <div class="column  is-4 is-offset-4">
        <hand seat="n" v-bind:deal="this.deal"></hand>
      </div>
      <div class="column  is-2 is-offset-2">
        <information v-bind:deal="this.deal"></information>
      </div>      
    </div>
    <div class="columns">
      <div class="column is-4">
        <hand seat="w" v-bind:deal="this.deal"></hand>
      </div>
      <div class="column  is-4 is-offset-4">
        <hand seat='e' v-bind:deal="this.deal"></hand>
      </div>
    </div>    
    <div class="columns">
      <div class="column  is-4 is-offset-4">
        <hand seat='s' v-bind:deal="this.deal"></hand>
      </div>
    </div>
  </div>
  
</template>

<script>
const axios = require('axios');
const _ = require('lodash');

export default {
  data() {
    return {
      deal: {},
    }
  },
  methods: {
    newDeal: function(){
      axios
        .post('/api/v1/deals')
        .then(response=>(this.deal = response.data.data))

    }
  },
  mounted(){
    this.newDeal();
  }
}
</script>
