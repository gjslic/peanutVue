<template>
  <div id="app">
    <Home/>
    <!-- <AdminLogin/> -->

  </div>
</template>

<script>
import Home from './components/Home'
import AdminLogin from './components/AdminLogin'
export default {
  name: 'App',
  components: {
     Home
    // AdminLogin
  }
}
</script>

<style>
  body{
    margin: 0;
    padding: 0;
  }
  a{
    text-decoration: none;
    color: #333;
  }
</style>
