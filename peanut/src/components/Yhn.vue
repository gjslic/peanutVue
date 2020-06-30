<template>
<div>
    <el-row >
        <el-col :lg="24" :xs="24"><div class="grid-content bg-purple">
               <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" text-color="#000" collapse-transition>

                    <el-menu-item index="1" id="title_name" >花生二手车</el-menu-item>

                    <el-submenu index="2">
                      <template slot="title">厦门</template>
                          <div id="choose_city">
                            <el-menu-item index="2-1">选项1</el-menu-item>
                            <el-menu-item index="2-2">选项2</el-menu-item>
                            <el-menu-item index="2-3">选项3</el-menu-item>
                          </div>
                    </el-submenu>

                    <!-- 搜索输入框 -->
                    <div id="ssbox">
                        <el-input
                          placeholder="请搜索您想要的车"
                          prefix-icon="el-icon-search"
                          v-model="input2">
                        </el-input>
                        <el-button plain id="ssbutton">搜索车辆</el-button>
                    </div>

                    <div id="right_box">
                        <el-menu-item index="8"  class="right_text">登录</el-menu-item>
                        <el-menu-item index="7"  class="right_text">APP下载</el-menu-item>
                        <el-menu-item index="4"  class="right_text">卖车</el-menu-item>
                        <el-menu-item index="5"  class="right_text">买车</el-menu-item>
                        <el-menu-item index="6"  class="right_text">尊享车主权益</el-menu-item>
                        <el-menu-item index="3"  class="right_text">首页</el-menu-item>
                    </div>

                </el-menu>
        </div></el-col>

   
    </el-row>

</div>


</template>

<script>


export default {
    name:'Homepage',
 
}
</script>

<style scoped>
/* 媒体查询 */
@media (max-width: 768px) { 
 

}


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



/* 网站标题 */
#title_name{
  font-weight: 600;
  font-size: 26px;
  margin-left: 120px;
}


/* 选择城市盒子 */
#choose_city{
  width: 600px;
  height: 300px;
}

/* 导航栏右侧信息 */
#right_box{
    position: absolute;
    right: 55px;
}

/* 导航栏右侧信息 字体*/
.right_text{
  float: right;
  padding-right: 20px;
  font-size: 15px;
}

/* 导航栏搜索 */
#ssbox{
    /* border: 1px solid; */
    position: absolute;
    width: 350px;
    height: 50px;
    left: 380px;
    top: 5px;
    padding: 5px;
}

#ssbutton{
position: absolute;
left: 355px;
    top: 5px;
}
/* 手机端导航栏 */
#nav_phone{
  height: 120px;
  background-color: cornflowerblue;
  /* transform: none;
  opacity: 0.5; */
}

/* 手机端导航栏信息 */
#peanut_phone{
  padding: 10px;
  position: absolute;
  top: 10px;
  color: white;
  font-size: 5rem;
  padding-left: 60px;
  font-weight: 500;
}

#search_box{
    position: absolute;
    top: 20px;
    left: 222px;
    width: 550px;
    height: 80px;
    border-radius: 20px;
    /* border: 1px solid; */
}

#search_car{
  width: 100%;
  height: 100%;
  font-size: 4rem;
  border-radius: 20px;
  outline: none;
  padding-left: 4rem;
  float: left;
}

#ss_button{
  position: absolute;
  left: 570px;
  top: 4px;
  height: 7rem;
  width: 15rem;
  font-size: 4rem;
}

#choose_city_phone{
  position: absolute;
  top: 30px;
  right: 50px;
  font-size: 4rem;
  color: white;
}
</style>