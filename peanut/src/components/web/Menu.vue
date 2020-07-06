<template>
  <el-menu
    :default-active="activeIndex2"
    class="el-menu-demo"
    mode="horizontal"
    @select="handleSelect"
    text-color="#fff"
    active-text-color="#ffd04b"
  >
    <el-row>
      <!-- 导航栏标题 -->
      <el-col :xs="8" :md="5">
        <div>
          <div class="nav_tit">花生二手车</div>
        </div>
      </el-col>
      <!-- 导航栏城市 -->
      <el-col :xs="4" :md="2">
        <div class="dropdown_box">
          <el-dropdown :hide-on-click="false">
            <span class="el-dropdown-link">
              厦门
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>黄金糕</el-dropdown-item>
              <el-dropdown-item>狮子头</el-dropdown-item>
              <el-dropdown-item>螺蛳粉</el-dropdown-item>
              <el-dropdown-item disabled>双皮奶</el-dropdown-item>
              <el-dropdown-item divided>蚵仔煎</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-col>
      <!-- 导航栏搜索框 -->
      <el-col :xs="12" :md="6">
        <div class="sreach_box">
          <el-input placeholder="请输入想要的车辆" prefix-icon="el-icon-search" v-model="input2"></el-input>
        </div>
      </el-col>

      <!-- 搜索按钮 -->
      <el-col :xs="8" :md="2" class="hidden-xs-only">
        <div class="ss_button">
            <el-button plain @click="routerTo">搜索车辆</el-button>
        </div>
      </el-col>

      <!-- 导航栏右侧信息 -->
      <el-col :xs="8" :md="8" class="hidden-xs-only hidden-sm-and-down">
        <div class="right_text">
          <el-col :xs="8" :md="6">
            <router-link to="/">
              <div class="text_box">首页</div>
            </router-link>
          </el-col>
          <el-col :xs="8" :md="6">
            <router-link to="/BuyCar">
              <div class="text_box">买车</div>
            </router-link>
          </el-col>
          <el-col :xs="8" :md="6">
            <router-link to="/AddSellingCars">
              <div class="text_box">卖车</div>
            </router-link>
          </el-col>

          <el-col :xs="8" :md="6">
            <router-link to="/Login">
              <div class="text_box">登录</div>
            </router-link>
          </el-col>
        </div>
      </el-col>
    </el-row>
  </el-menu>

  <!-- 手机端导航栏 -->
</template>

<script>
export default {
  name: "Menu",
  data() {
    return {
      input2: "",
      activeIndex2: ""
    };
  },
  methods: {
    handleSelect(e) {
      console.log(e);
    },
    routerTo(){
      this.$router.push({ name: 'BuyCar', query: { id: this.input2 }});
    }
  }
};
</script>

<style scoped>
.el-col {
  border-radius: 4px;
}
.bg-purple-dark {
  background: #99a9bf;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

/* 下拉框样式  电脑*/
@media (min-width: 768px) {
  .el-dropdown-link {
    cursor: pointer;
    color: #409eff;
  }
  .el-icon-arrow-down {
    font-size: 12px;
  }
  .dropdown_box {
    padding-top: 20px;
  }

  /* 导航栏标题 */
  .nav_tit {
    font-weight: 600;
    font-size: 3rem;
    padding-left: 92px;
    padding-top: 10px;
  }

  /* 搜索框 */
  .sreach_box {
    padding: 5px;
  }

  .ss_button {
    padding: 5px;
  }

  /* 导航栏右侧信息 */
  .right_text {
    padding: 15px;
  }

  .text_box {
    text-align: center;
    font-size: 1.5rem;
    cursor: pointer;
  }

  .text_box:hover {
    color: cornflowerblue;
  }
}

/* 手机端 */
@media (max-width: 768px) {
  .nav_tit {
    font-weight: 600;
    font-size: 1.5rem;
    padding-left: 20px;
    padding-top: 10px;
  }
  /* 城市下拉 */
  .dropdown_box {
    padding-top: 10px;
  }

  /* 手机端搜索按钮 */
  .ss_button {
    padding-left: 10px;
  }
}
</style>