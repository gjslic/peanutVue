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
import Menu from '../web/Menu';
// import AuctionVehicle from './components/AuctionVehicle';
import Banner from '../web/Banner';
import Carbrand from '../web/Carbrand';
import Carrecommend from '../web/Carrecommend';
import Bottom from '../web/Bottom';
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