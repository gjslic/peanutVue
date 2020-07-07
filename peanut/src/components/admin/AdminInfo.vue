// 欢迎页
<template>
  <div>
    <div class="demo-fit">
      <div class="block">
        <el-avatar shape="square" :size="100" :src="url"></el-avatar>
      </div>
    </div>
    <div>
      <el-divider></el-divider>
      <span>角色 ：客服</span>
      <el-divider></el-divider>
      <span>账号：111</span>
      <el-divider></el-divider>
      <span>手机号：15581567057</span>
      <el-divider></el-divider>
      <span>性别 ：女</span>
    </div>
  </div>
</template>
<style  scoped>
</style>
<script>
// 引入网络请求模块
import { getData, sendParam } from "../../network/home";
export default {
  name: "AdminInfo",
  data() {
    return {
      adminInfo: {},
      url:
        "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg"
    };
  },
  created() {
    this.getInfoData();
  },
  methods: {
    // ----------网络请求----------
    // 获取员工信息
    getInfoData() {
      let url = "/adminCenter/Center/get";
      let data = {
        token: JSON.parse(localStorage.getItem("token"))
      }
      sendParam(url, data)
        .then(res => {
          console.log(res);
          if (res.data.code == 1) {
          } else {
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>