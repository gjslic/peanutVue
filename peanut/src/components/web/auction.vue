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
const QueryCar = () => import('@/components/web/QueryCar')

//引入面包屑组件
const Breadcrumb = () => import('@/components/web/Breadcrumb')

//引入车辆信息显示
const AuctionVehicle = () => import('@/components/web/AuctionVehicle')
//引入回归顶部显示
const BackTop = () => import('@/components/web/BackTop')
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