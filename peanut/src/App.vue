<template>
  <div id="app">
<<<<<<< HEAD
    <router-view></router-view>
=======
    <Home/>
    <!-- <Detail/> -->
    <!-- <AdminLogin/> -->
>>>>>>> dfd19563cf830a90e5752582917e16b01ba524c8
  </div>


</template>

<script>
<<<<<<< HEAD
export default {
  name: 'App',
  components: {
=======
import Home from './components/Home'
import Detail from './components/Detail'
import AdminLogin from './components/AdminLogin'
export default {
  name: 'App',
  components: {
    Home,
    Detail
>>>>>>> dfd19563cf830a90e5752582917e16b01ba524c8
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
