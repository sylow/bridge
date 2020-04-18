<template>
  <div  v-bind:class="[this.seat == 'south' ? 'has-background-light' : '', 'box']">
    <article class="media">
      <div class="media-content">
        <div class="content">
          <p>
            <div v-for="(card_type,index) in card_types" :key="index">
              <span class='card-type'><i :class="['mdi', card_type.class]"></i></span> 
              <span v-for="item in by_type(card_type.type)" @click="play(item)" v-bind:key="item">
                {{item.value}}
              </span><br/>
            </div>
          </p>
        </div>
        <nav class="level is-mobile player-information">
          <div class="level-left">
          </div>
          <div class="level-right">
              <span>{{player.name}} ({{this.seat[0]}})</span>
          </div>          
        </nav>
      </div>
    </article>
  </div>
</template>

<script>
const _ = require('lodash');
import { mapGetters, mapActions } from 'vuex'
export default {
  props: ['seat'],
  data(){
    return{
      card_types: [
                    {type: 'spade',class: 'mdi-cards-spade'},
                    {type: 'heart',class: 'mdi-cards-heart has-text-danger'},
                    {type: 'diamond',class: 'mdi-cards-diamond has-text-danger'},
                    {type: 'club',class: 'mdi-cards-club'},
                  ]
    }
  },
  methods: {
    by_type: function(type){
      return _.filter(this.hand.cards, {type})
    },
    play: function(card){
      console.log(card.value);
    },
  },
  computed: {
    ...mapGetters(['game']),
    player: function() {
      if (_.isEmpty(this.game)) return {};

      return this.game[this.seat];
    },
    hand: function () {
      if (_.isEmpty(this.game.deal)) return {};

      return _.find(this.game.deal.hands, {seat: this.seat})
    }
  }  
}
</script>

<style scoped>
  .card-type {
    display: inline-block;
    width:20px;
  }
  .card-type i{
    font-size: 106%
  }
  .player-information{
    color: #888;
    font-size: 90%;
  }
</style>