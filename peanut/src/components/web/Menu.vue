<template>

<el-menu
  :default-active="activeIndex2"
  class="el-menu-demo "
  mode="horizontal"
  @select="handleSelect"
  text-color="#fff"
  active-text-color="#ffd04b" style="height:65px;">
 <el-row>
    <!-- 导航栏标题 -->
      <el-col :xs="8" :md="5" class="hidden-xs-only">
        <div>
           <router-link to="/" class="text_a">
              <div class="nav_tit">花生二手车</div>
            </router-link>
        </div>
      </el-col>
      <!-- 导航栏城市 -->
      <el-col :xs="4" :md="2" style="margin-left: 16px;padding-top: 12px;">
        <!-- 抽屉 选择城市 -->
        <el-button @click="innerDrawer = true " type="primary" class="city_button">
          厦门
        </el-button>



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
            <el-button plain @click="vehiclelFun">搜索车辆</el-button>
             <!-- @click="routerTo" -->
        </div>
      </el-col>

      <!-- 导航栏右侧信息 -->
      <el-col :xs="8" :md="8" class="hidden-xs-only hidden-sm-and-down">
        <div class="right_text">

               <el-col :xs="8" :md="6" >
                  <router-link to="/auction" class="text_a">
                    <div class="text_box">
                        拍卖
                    </div>
                  </router-link>
              </el-col>


              <el-col :xs="8" :md="6" >
                 <router-link to="/BuyCar" class="text_a">
                    <div class="text_box">
                        买车
                    </div>
                  </router-link>
              </el-col>


              <el-col :xs="8" :md="6" >
                 <!-- <router-link to="/SellingCars" class="text_a"> -->
                    <div class="text_box" @click="sellcar()">
                        卖车
                    </div>
                  <!-- </router-link> -->
              </el-col>
             
             <!-- 跳转登录 -->
              <el-col :xs="8" :md="6" class="log_box" v-if="showRentPrise">
                <router-link to="/Login" class="text_a">
                    <div class="text_box">
                        登录
                    </div>
                  </router-link>
              </el-col>
              
              <!-- 显示头像名称 -->
              <el-col :xs="8" :md="6" class="user_box" v-if="showPrise">
                <!-- 头像 -->
                <el-col :md="9">
                  <el-popover
                    placement="bottom-start"
                    width="100"
                    trigger="hover">
                    <div class="user_router">
                      
                        <div class="router_text">
                          <router-link to="/AddPersonalCenter" class="link_a">
                            <i class="el-icon-user-solid"></i>个人中心
                          </router-link>
                        </div>

                        <div class="router_text">
                            <i class="el-icon-phone-outline"></i>联系客服
                        </div>
                        <div class="router_text" @click="outlodin()">
                          <i class="el-icon-switch-button"></i>退出登录
                        </div>
                    </div>
                    
                      <div class="user_head" slot="reference">
                        <router-link to="/AddPersonalCenter" >
                            <img :src="userdata.head_img" alt="" style="width:100% ;border-radius: 50%;">
                          </router-link>
                      </div>
                  
                  </el-popover>

                </el-col>
                <!-- 名称 -->
                <el-col :md="15">
                    <p class="user_name">{{userdata.name}}</p>
                </el-col>
              </el-col>

        </div>
      </el-col>

      <!-- 手机端显示 导航栏右侧 -->
      <el-col :xs="4" style="padding-top: 11px;margin-left: 10px;" class="hidden-sm-and-up"> 
        <el-button type="primary" class="search_btn" @click="vehiclelFun">搜索</el-button>
      </el-col>

      <!-- 用户头像 -->
      <el-col :xs="2" style="padding-top: 11px;" class="hidden-sm-and-up">
        
        <!-- 点击判断token是否存在进入个人中心 -->
        <div class="user_img" @click="gettoken()">
        
            <img :src= "userdata.head_img" alt="" style="width:100% ;border-radius: 50%;">
         
        </div>
      </el-col>
    </el-row>
     <!-- 城市显示 -->
             <!-- title="请选择您的城市" -->
      <el-drawer

        :visible.sync="innerDrawer "
        :direction="direction"
        :with-header="false"
        size="50%" class="drawer_box">
  

        <el-row>
          <!-- 城市数据打印 -->
          <el-col :md="24" :xs="24">
             <el-col :md="24" :xs="24" class="choose_city">
                请选择城市
              </el-col>

              <!-- 热门城市显示 -->
              <el-col :md="24" :xs="24" class="hot_city">
                  热门城市
              </el-col>

              <el-col :md="4" :xs="8"  v-for="(city_item,index) in cityArr" :key="index">
                <div class="hot_city_text" v-if="city_item.hot_id == 1" @click="passCity(city_item.city_id)">
                   <span @click="innerDrawer = false" class="city_span"> {{city_item.city_name}}</span> 
                </div>
              </el-col>
          </el-col>
        </el-row>  

        <el-row>
            <el-col :md="24" :xs="24">
              <!-- 其他城市显示 -->
              <el-col :md="24" :xs="24" class="hot_city">
                  其他城市
              </el-col>

              <el-col :md="4" :xs="8" v-for="(city_item,index) in cityArr" :key="index+1">
                  <div class="hot_city_text" v-if="city_item.hot_id != 1" @click="passCity(city_item.city_id)">
                   <span @click="innerDrawer = false" class="city_span"> {{city_item.city_name}}</span> 
                </div>
              </el-col>
            </el-col>
        </el-row> 
        
      </el-drawer>
  </el-menu>

    
</template>

<script>
//引入连接
import {request} from "../../network/request";
import { getData, sendParam} from "../../network/home";
export default {
    name: 'Menu',
    // 组件js
    data(){
      return{
        userdata:'',
        //显示隐藏
        showPrise:false,
        showRentPrise:true,

        input:'',
        input2:'',
        activeIndex2:'',
        // 城市抽屉
        drawer: false,
        innerDrawer:false,
        direction: 'rtl',
        cityArr:[],
        
      }
    },

mounted(){
  // 获取到城市数据
  this.getCity();

  this.iflogin();
},
    methods:{
      handleSelect(e){
          console.log(e);
          
      },


      //获取到城市数据
      getCity(){
        let url = '/homepage/Homepage/getcity';
        getData(url).then(res => {
          //this获取到数据
          console.log(res);
            this.cityArr = res.data;
        }).catch(err => {
          console.log(err);
        });
      },
      // 传递搜索关键字
      vehiclelFun(){
        this.$router.push({ name: 'BuyCar', query: { vehicleName: this.input2 }});


      },
      //传递城市
      passCity(id){
        this.$router.push({
            name:"BuyCar",
            query:{
              cityid:id,
            }
          });
          location.reload();
      },
      //用户头像名称
      getuserinfo(){
        let url = '/homepage/Homepage/getuserinfo';
        var usertoken = localStorage.getItem('tokenVue');
        let data ={
          usertoken:usertoken
        }
        sendParam(url, data).then(res => {
            this.userdata = res.data;

        }).catch(err => {
            console.log(err);
        });
      },
      //判断登录状态
      iflogin(){
        var usertoken = localStorage.getItem('tokenVue');
        if(usertoken){
          this.showPrise = true;
          this.showRentPrise = false;
          //有token发送到php取出用户id，拿取头像名称
          this.getuserinfo();
        }else{
          this.showPrise = false;
          this.showRentPrise = true;
        }
      },

      //手机端获取到token
      gettoken(){
        var usertoken = localStorage.getItem('tokenVue');
        if(usertoken){
            this.$router.push({name:'AddPersonalCenter'})
        }else{
            this.$message({
              type:'warning',
              message:'请先登录'
            })
            this.$router.push({name:'Login'})
        }
      },

      //退出登录
      outlodin(){
        //移除本地所存储的token
        // var utoken = localStorage.getItem('tokenVue');
        localStorage.removeItem('tokenVue');
        this.$message({
            type: 'success',
            message: '退出成功', 
        })
        this.showPrise = false;
        this.showRentPrise = true;
      },

      //进入卖车页判断是否登录
      sellcar(){
        var usertoken = localStorage.getItem('tokenVue');
        if(usertoken){
          this.$router.push({name:"SellingCars"})
        }else{
           //提示框
            this.$confirm('您好，请先登录账号', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning',
              center: true
          }).then(() => {
          //提交成功信息
          this.$message({
                  type: 'success',
                  message: '请登录您的账号',   
              });
              this.$router.push({name:"Login"})
          }).catch(() => {

          }); 
        }
      },



     
    },
}
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

  /* 下拉框样式  电脑*/
  @media (min-width: 768px){
    .el-dropdown-link {
      cursor: pointer;
      color: #409EFF;
    }
    .el-icon-arrow-down {
      font-size: 12px;
    }
    .dropdown_box{
      padding-top: 20px;
    }
    .dropdown_menu{
      width: 500px;
    }
 


    /* 导航栏标题 */
    .nav_tit{
      font-weight: 600;
      font-size: 3rem;
      padding-left: 92px;
      padding-top: 10px;
      cursor: pointer;
    }

    /* 搜索框 */
    .sreach_box{
      padding: 12px;
    }

    .ss_button{
      padding: 12px;
    }


    .text_box{
      text-align: center;
      font-size: 1.5rem;
      cursor: pointer;
      line-height: 35px;
    }

    .text_box:hover{
      color: cornflowerblue;
    }
    /* 去除下划线 */
    .text_a{
      text-decoration: none;
    }

    .right_text{
      padding-top: 12px;
    }

    /* 用户头像 */
    .user_head{
      /* background-color:crimson; */
      height: 40px;
      border-radius: 50%;
      cursor: pointer;
    }

    .user_name{
      display: block;
      overflow: hidden;
      text-overflow:ellipsis;
      white-space: nowrap;
      padding-top: 10px;
      padding-left: 10px;
      cursor: pointer;
    }
    .user_name:hover{
      color: cornflowerblue;
    }
    /* 热门城市显示 */
    .hot_city{
      font-size: 18px;
      font-weight: 600;
      padding: 15px;
      border-bottom: 1px solid #ccc;
      /* color: #409eff; */
    }

    /* 热门城市名称 */
    .hot_city_text{
      border-radius: 5px;
      line-height: 35px;
      text-align: center;
      cursor: pointer;
      border: 1px solid cornflowerblue;
      margin-left: 10px;
      margin-top: 10px;
    }
    .hot_city_text:hover{
      background-color: #99CCFF;
      color: white;
    }

    .user_router{
      height: 100px;
      width: 120px;
      background-color: white;
    }

    .router_text{
      text-align: center;
      font-size: 1.5rem;
      line-height: 35px;
      cursor: pointer;
    }
    .router_text:hover{
      /* background-color: rgba(233, 233, 233, 0.671); */
      color: #409EFF;
    }

    .link_a{
      text-decoration:none
    }
    .link_a:hover{
      color: #409EFF;
    }

    /* .drawer_box{
    
    } */

    .city_span{
      display: block;
    }

    .choose_city{
      font-size: 20px;
      font-weight: 600;
      color: #409eff;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }
  }

  /* 手机端 */
  @media (max-width: 768px){

    .choose_city{
      font-size: 20px;
      font-weight: 600;
      color: #409eff;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }
    /* .nav_tit{
      font-weight: 600;
      font-size: 2.5rem;
      padding-left: 10px;
      padding-top: 10px;
    } */

    .sreach_box{
      padding-top: 7px;
    }
    /* 手机端搜索按钮 */
    .search_btn{
    color: #FFF;
    background-color: #409EFF;
    border-color: #409EFF;
    height: 3.4rem;
    padding: 8px;
    }

    .city_button{
      color: #FFF;
      background-color: #409EFF;
      border-color: #409EFF;
      height: 3rem;
      padding: 6px;
    }

    .user_img{
      /* background-color: #409EFF; */
      border-radius: 50%;
      border: 1px solid white;
      height: 31px;
      background-image: url('https://ae01.alicdn.com/kf/Hb4ae7e9644cf43cc95b822ecc14ef84dC.jpg');
      background-repeat: no-repeat;
    }
    .el-menu-demo{
      height:65px;
      background-color:whitesmoke;
    }
  }

  /* 手机端搜索按钮 */
  .ss_button {
    padding-left: 10px;
  }

  /* 热门城市名称 */
    .hot_city_text{
      border-radius: 5px;
      line-height: 35px;
      text-align: center;
      cursor: pointer;
      border: 1px solid cornflowerblue;
      margin-left: 10px;
      margin-top: 10px;
    }
    .hot_city_text:hover{
      background-color: #99CCFF;
      color: white;
    }

    .hot_city{
      padding-left: 10px;
      padding-top: 10px;
    }

    .city_span{
      display: block;
    }

    .choose_city{
      font-size: 20px;
      font-weight: 600;
      color: #409eff;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }

</style>