// 后台主页
<template>
  <el-container style="height: 100vh;">
    <el-header style="color: #fff">
      <span style="float: left; font-size: 24px;">Peanut后台管理系统</span>
      <div style="float: right">
        <!-- <el-dropdown>
          <i class="el-icon-switch-button" style="margin-right: 15px; color: #fff" :click="loginOut"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>查看</el-dropdown-item>
            <el-dropdown-item>新增</el-dropdown-item>
            <el-dropdown-item>删除</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown> -->
        <i class="el-icon-switch-button" style="margin-right: 15px; color: #fff" @click="loginOut"></i>
        <span style="text-align: right; font-size: 16px;">{{staffAcc}}</span>
      </div>
    </el-header>
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu :default-openeds="['1', '11']">
          <router-link to="/welcome">
            <el-menu-item index="1">
              <i class="el-icon-s-home"></i>
              <span slot="title">主页</span>
            </el-menu-item>
          </router-link>

          <router-link to="/AdminRole">
            <el-menu-item index="2">
              <i class="el-icon-s-help"></i>
              <span slot="title">角色管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/Jurisdiction">
            <el-menu-item index="3">
              <i class="el-icon-s-shop"></i>
              <span slot="title">权限管理</span>
            </el-menu-item>
          </router-link>

          <router-link to="/staffManage">
            <el-menu-item index="4">
              <i class="el-icon-s-custom"></i>
              <span slot="title">员工管理</span>
            </el-menu-item>
          </router-link>

          <router-link to="/users">
            <el-menu-item index="5">
              <i class="el-icon-user-solid"></i>
              <span slot="title">用户管理</span>
            </el-menu-item>
          </router-link>
           <el-submenu index="6">
            <template slot="title">
              <i class="el-icon-s-shop"></i>
              <span>商品管理</span>
            </template>
            <el-menu-item-group>
              <router-link to="/goods">
                <el-menu-item index="6-1">拍卖商品</el-menu-item>
              </router-link>
              <router-link to="/OldGoods">
                <el-menu-item index="6-2">二手商品</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          

          <router-link to="/order">
            <el-menu-item index="7">
              <i class="el-icon-s-goods"></i>
              <span slot="title">订单管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/AdminEcharts">
            <el-menu-item index="8">
              <i class="el-icon-s-data"></i>
              <span slot="title">报表管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/AdminComplain">
            <el-menu-item index="9">
              <i class="el-icon-message-solid"></i>
              <span slot="title">举报管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/AdminNotice">
            <el-menu-item index="10">
              <i class="el-icon-message-solid"></i>
              <span slot="title">公告管理</span>
            </el-menu-item>
          </router-link>
          <router-link to="/chat">
            <el-menu-item index="11">
              <i class="el-icon-phone"></i>
              <span slot="title">客服聊天</span>
            </el-menu-item>
          </router-link>
        </el-menu>
      </el-aside>
      <el-container>
        <el-main>
          <router-view />
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
export default {
  name: "Home",
  components: {},
  data() {
    return {
      staffAcc:''
    };
  },
  created() {
    //主页登录状态判断
    if (JSON.parse(sessionStorage.getItem("staffAcc"))!=null) {
      this.staffAcc = JSON.parse(sessionStorage.getItem("staffAcc"))
    }else{
        this.$message({message: "请先登录"});
        this.$router.push("/AdminLogin");
    }
  },
  methods:{
    // 后台登出
    loginOut(){
        this.$confirm("此操作将退出后台登录, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
        })
        .then(() => {
            this.$message.success('退出成功');
            sessionStorage.removeItem('staffAcc');
            this.$router.replace('/AdminLogin');
        })
        .catch(() => {
            this.$message({
            type: "info",
            message: "已取消"
            });
        })   
    },
    
  }

};
</script>