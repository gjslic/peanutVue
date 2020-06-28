<template>
  <el-container>
    <el-header style="color: #fff">
      <span style="float: left; font-size: 24px;">Peanut后台管理系统</span>
      <div style="float: right">
        <el-dropdown>
          <i class="el-icon-setting" style="margin-right: 15px; color: #fff"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>查看</el-dropdown-item>
            <el-dropdown-item>新增</el-dropdown-item>
            <el-dropdown-item>删除</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <span style="text-align: right; font-size: 12px; ">王小虎</span>
      </div>
    </el-header>
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu :default-openeds="['1', '3']">
          <el-menu-item index="1">
            <i class="el-icon-s-home"></i>
            <span slot="title">主页</span>
          </el-menu-item>
          <el-menu-item index="2">
            <i class="el-icon-s-help"></i>
            <span slot="title">角色管理</span>
          </el-menu-item>
          <el-menu-item index="3">
            <i class="el-icon-menu"></i>
            <span slot="title">系统管理</span>
          </el-menu-item>
          <el-menu-item index="4">
            <i class="el-icon-s-custom"></i>
            <span slot="title">员工管理</span>
          </el-menu-item>
          <el-menu-item index="5">
            <i class="el-icon-user-solid"></i>
            <span slot="title">用户管理</span>
          </el-menu-item>
          <el-menu-item index="6">
            <i class="el-icon-s-shop"></i>
            <router-link slot="title" to="/goods">商品管理</router-link>
          </el-menu-item>
          <el-menu-item index="7">
            <i class="el-icon-s-goods"></i>
            <span slot="title">订单管理</span>
          </el-menu-item>
          <el-menu-item index="8">
            <i class="el-icon-s-data"></i>
            <span slot="title">报表管理</span>
          </el-menu-item>
          <el-menu-item index="3">
            <i class="el-icon-message-solid"></i>
            <span slot="title">公告管理</span>
          </el-menu-item>
          <el-menu-item index="3">
            <i class="el-icon-phone"></i>
            <span slot="title">客服聊天</span>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-container>
        <el-main>
          <router-view/>
        </el-main>
      </el-container>
    </el-container>
    <el-footer class="foot-style">© Peanut - 所有权归花生</el-footer>
  </el-container>
</template>


<style>
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
.foot-style {
  color: #b3c0d1;
  text-align: center;
  line-height: 60px;
}
</style>

<script>
import Goods from '../components/Goods'
export default {
  name: "Home",
  components: {
    Goods
  },
  data() {
    const item = {
      date: "2016-05-02",
      name: "王小虎",
      address: "上海市普陀区金沙江路 1518 弄"
    };
    return {
      tableData: Array(7).fill(item)
    };
  }
};
</script>