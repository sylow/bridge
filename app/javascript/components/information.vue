<template>
  <div class="box" style='padding:0.5em'>
    <article class="media">
      <div class="media-content">
        <div class="content">
          <p>
            <table class='table is-narrow'>
              <thead>
                <tr style='font-size:90%'>
                  <th>cont</th>
                  <th>deal</th>
                  <th>zone</th>
                </tr>
              </thead>
              <tr>
                <td><span class="tag is-dark">4H</span></td>
                <td><span class="tag is-light">{{deal.attributes.dealer}}</span></td>
                <td><span class="tag is-light">{{deal.attributes.zone}}</span></td>
              </tr>
            </table>              
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
      zone: this.deal.attributes.zone
    }
  }

}
</script>
<style scoped>
  .label{
    width:70px;
  }
</style>