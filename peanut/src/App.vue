<template>
  <div id="app">

    <router-view></router-view>

  </div>


</template>

<script>
import Home from './components/Home'
import Detail from './components/Detail'
import AdminLogin from './components/AdminLogin'
export default {
  name: 'App',
  components: {
    Home,
    Detail
  }
}
</script>

<style>
  body,ul,h1,p{
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
