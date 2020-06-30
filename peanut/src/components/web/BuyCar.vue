<!-- 买车页  -->
<template>
  <div>
    <Breadcrumb />
    <QueryCar />
    <SortCar />
    <VehicleInfo />
  </div>
</template>

<script>
//引入查询车辆组件
const QueryCar = () => import('@/components/web/QueryCar')
//引入面包屑组件
const Breadcrumb = () => import('@/components/web/Breadcrumb')
//引入排序组件
const SortCar = () => import('@/components/web/SortCar')
//引入车辆信息显示
const VehicleInfo = () => import('@/components/web/VehicleInfo')
export default {
  name: "BuyCar",
  data() {
    return {};
  },
  components: {
    QueryCar,
    Breadcrumb,
    SortCar,
    VehicleInfo
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>