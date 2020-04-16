<template>
  <div class="box" style='padding:0.5em'>
    <article class="media">
      <div class="media-content">
        <div class="content">
          <p>
            <span class="tag is-light">4<i class="mdi mdi-cards-heart has-text-danger"></i></span>
            <span class="tag is-light">{{deal.dealer}}</span>
            <span class="tag is-light">{{deal.zone}}</span>            
          </p>
        </div>
      </div>
    </article>
  </div>
</template>

<script>
const axios = require('axios');
const _ = require('lodash');

export default {
  props: ['deal'],
  data(){
    return {
      zone: this.deal.zone
    }
  }

}
</script>
<style scoped>
  .label{
    width:70px;
  }
</style>