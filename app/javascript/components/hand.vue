<template>
  <div  v-bind:class="[this.seat == 's' ? 'has-background-light' : '', 'box']">
    <article class="media">
      <!-- <div class="media-left">
        <figure class="image is-64x64">
          <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
        </figure>
      </div> -->
      <div class="media-content">
        <div class="content">
          <p>
            <span class='card-type'><i class="mdi mdi-cards-spade"></i></span> 
            <span v-for="(item, index) in by_type('spade')">
              {{item}}
            </span><br/>
            <span class='card-type'><i class="mdi mdi-cards-heart has-text-danger"></i></span> 
            <span v-for="(item, index)  in by_type('heart')">
              {{item}}
            </span><br/>            
            <span class='card-type'><i class="mdi mdi-cards-diamond has-text-danger"></i></span> 
            <span v-for="(item, index)  in by_type('diamond')">
              {{item}}
            </span><br/>              
            <span class='card-type'><i class="mdi mdi-cards-club"></i></span> 
            <span v-for="(item, index)  in by_type('club')">
              {{item}}
            </span><br/>  
          </p>
        </div>
        <nav class="level is-mobile">
          <div class="level-left">
              <strong>{{player.name}}</strong> 
          </div>
          <div class="level-right">
              <span>{{this.seat}}</span>
          </div>          
        </nav>
      </div>
    </article>
  </div>
</template>

<script>
const axios = require('axios');
const _ = require('lodash');

export default {
  props: ['game', 'seat', 'deal'],
  methods: {
    by_type: function(type){
      return _.map(_.filter(this.hand.cards, {type}), 'value')
    }
  },
  computed: {
    player: function() {
      if (_.isEmpty(this.game)) return {};

      return this.game[this.seat];
    },
    hand: function () {
      if (_.isEmpty(this.deal)) return {};

      return _.find(this.deal.hands, {seat: this.seat})
    }
  }  
}
</script>

<style scoped>
  .card-type {
    display: inline-block;
    width:20px;
  }
</style>