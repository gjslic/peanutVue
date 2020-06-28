<template>
  <div id="app">
    <Home/>
    
  </div>
</template>

<script>
import Home from './components/Home'
export default {
  name: 'App',
  components: {
    Home
  }
}
</script>

<style>
  body,ul{
    margin: 0;
    padding: 0;
  }
  a{
    text-decoration: none;
    color: #333;
  }
  li{
    list-style: none;
  }
</style>
