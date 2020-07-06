// 欢迎页
<template>
  <div>
    <div class="demo-fit">
      <div class="block">
        <el-avatar shape="square" :size="100"  :src="url"></el-avatar>
      </div>
    </div>
  </div>
</template>
<style>
</style>
<script>
// 引入网络请求模块
import { getData, sendParam } from "../../network/home";
export default {
  name: "AdminInfo",
  data() {
    return {
      url:
        "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg"
    };
  },
  created() {
    
  },
};
</script>