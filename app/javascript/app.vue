<template>
  <div>
    <div class="columns">
      <div class="column  is-4 is-offset-4">
        {{deal}}
        <hand hand="west"></hand>
      </div>
    </div>
    <div class="columns">
      <div class="column is-4">
        {{west}}
        <hand></hand>
      </div>
      <div class="column  is-4 is-offset-4">
        <hand></hand>
      </div>
    </div>    
    <div class="columns">
      <div class="column  is-4 is-offset-4">
        <hand></hand>
      </div>
    </div>
  </div>
  
</template>

<script>
const axios = require('axios');
export default {
  data: function () {
    return {
      message: "This is where a table will be",
      deal: {},
    }
  },
  // computed: {
  //   west: function() {
  //     console.log(this.deal.length);
  //     if (this.deal.length <= 0)
  //       return [];
  //     else{
  //       console.log(this.deal);
  //       let data = this.deal.relationships.hands.data;
  //       for (var i = data.length - 1; i >= 0; i--) {
  //         if (data[i].attributes.seat === 'west') return data[i].attributes; // returns the object & ends the loop
  //       };
  //     }
  //   }
  // },
  mounted(){
    axios
      .get('/api/v1/deals/1')
      .then(response=>(this.deal = response.data.data))
  }
}
</script>
