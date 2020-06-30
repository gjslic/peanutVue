<template>
<div>
      <Menu />
      <Banner />
      <Carbrand />
      <Carrecommend />
      <Bottom />
      <!-- <AuctionVehicle /> -->
</div>


</template>

<script>
import Menu from './components/Menu';
// import AuctionVehicle from './components/AuctionVehicle';
import Banner from './components/Banner';
import Carbrand from './components/Carbrand';
import Carrecommend from './components/Carrecommend';
import Bottom from './components/Bottom';
export default {
    name:'Homepage',
    components:{
        Menu,
        Banner,
        // AuctionVehicle,
        Carbrand,
        Carrecommend,
        Bottom
    }

}
</script>

<style scoped>


</style>