<!-- 拍卖页  -->
<template>
  <div>
    <Breadcrumb />
    <QueryCar />
    <AuctionVehicle />
    <BackTop />
  </div>
</template>

<script>
//引入查询车辆组件
import QueryCar from "../components/QueryCar";
//引入面包屑组件
import Breadcrumb from "../components/Breadcrumb";
//引入车辆信息显示
import AuctionVehicle from "../components/AuctionVehicle";
//引入回归顶部显示
import BackTop from "../components/BackTop";
export default {
  name: "auction",
  data() {
    return {};
  },
  components: {
    QueryCar,
    Breadcrumb,
    AuctionVehicle,
    BackTop
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>