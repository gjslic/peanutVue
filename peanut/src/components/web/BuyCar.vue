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
import QueryCar from "../components/QueryCar";
//引入面包屑组件
import Breadcrumb from "../components/Breadcrumb";
//引入排序组件
import SortCar from "../components/SortCar";
//引入车辆信息显示
import VehicleInfo from "../components/VehicleInfo";
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