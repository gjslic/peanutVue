<template>
<div>
      <Menu />
      <Banner />
      <Carbrand />
      <Carrecommend />
</div>


</template>

<script>
import Menu from './components/Menu';
import Banner from './components/Banner';
import Carbrand from './components/Carbrand';
import Carrecommend from './components/Carrecommend';
export default {
    name:'Homepage',
    components:{
        Menu,
        Banner,
        Carbrand,
        Carrecommend,
    }

}
</script>

<style scoped>
body{
    min-width: 1300px;
}
@media (min-width:700px),handheld and (orentation:landscape) {
  #nav_el{
    display: block;
  }
} 

</style>