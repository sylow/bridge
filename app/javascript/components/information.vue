<template>
  <div class="box" style='padding:0.5em'>
    <article class="media">
      <div class="media-content">
        <div class="content">
          <p>
            <span class="tag is-light">4<i class="mdi mdi-cards-heart has-text-danger"></i></span>
            <span class="tag is-light">{{game.deal.dealer}}{{game.counter}}</span>
            <span class="tag is-light">{{game.deal.zone}}</span>            
          </p>
        </div>
      </div>
    </article>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  computed: mapGetters([
    'game'
  ]),
}

</script>
<style scoped>
  .label{
    width:70px;
  }
</style>