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
            <span class='card-type'>S:</span> {{cards.spades}}<br/>
            <span class='card-type'>H:</span> {{cards.hearts}}<br/>
            <span class='card-type'>D:</span> {{cards.diamonds}}<br/>
            <span class='card-type'>C:</span> {{cards.clubs}}<br/>
          </p>
        </div>
        <nav class="level is-mobile">
          <div class="level-left">
              <strong>John Smith</strong> 
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
  props: ['seat', 'deal'],
  computed: {
    cards: function () {
      if (_.isEmpty(this.deal)) return {};

      return _.find(this.deal.attributes.hands, {seat: this.seat})
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