<template>
  <div id='app'>
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
              <a class="button is-light" @click="newGame">
                Deal
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
      <div class="column  is-2">
        <information></information>
      </div> 
      <div class="column  is-4 is-offset-2">
        <hand seat="north"></hand>
      </div>     
    </div>
    <div class="columns">
      <div class="column is-4">
        <hand seat="east"></hand>
      </div>
      <div class="column  is-4 is-offset-4">
        <hand seat='west'></hand>
      </div>
    </div>    
    <div class="columns">
      <div class="column  is-4 is-offset-4">
        <hand seat='south'></hand>
      </div>
    </div>
  </div>
  
</template>
<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  computed: mapGetters([
  ]),
  methods: mapActions([
    'newGame',
  ])
}
</script>
