<template>
  <div class="box">
    <article class="media">
      <div class="media-left">
        <figure class="image is-64x64">
          <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
        </figure>
      </div>
      <div class="media-content">
        <div class="content">
          <p>
            <strong>John Smith</strong> <small>@johnsmith</small> <small>31m</small>
            <br>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>
        <nav class="level is-mobile">
          <div class="level-left">
              <strong>John Smith</strong> 
          </div>
        </nav>
      </div>
    </article>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hand comes from here"
    }
  }
}
</script>