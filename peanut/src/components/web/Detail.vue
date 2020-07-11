<template>
  <div>
    <!-- 导航栏 -->
    <Menu />
    <!-- 购买 -->
    <el-row>
      <el-col :md="12" :sm="24">
        <!-- 图片轮播 -->
        <div class="img_detail">
          <img :src="allInfo.img" alt />
        </div>
      </el-col>
      <el-col :md="12" :sm="24">
        <div class="text_detail">
          <h1 class="car_title">{{allInfo.vehicle_name}}</h1>
          <p class="car_price">
            <span class="now_price">
              <b>￥{{allInfo.price}}万</b>
            </span>
            <span class="new_car_price">
              新车含税价：{{(allInfo.price * 1.5).toFixed(2)}}万
              <i class="el-icon-info"></i>
            </span>
          </p>
          <p class="car_address">
            <span class="postage">包物流</span>
            <span class="car_from">由{{allInfo.city_name}}运往本市</span>
          </p>
          <div class="down_payment">
            <span>首付低至{{(allInfo.price * 0.1).toFixed(2)}}万</span>
            <span>月供可跟卖家商量</span>
          </div>
          <div class="detail_txt hidden-xs-only">{{allInfo.introduce}} 上架时间 {{allInfo.vehicle_time}}</div>
          <div class="btn_box">
            <el-button type="warning">
              <i class="el-icon-chat-dot-round"></i> 在线客服
            </el-button>
            <el-button type="danger" @click="handelbBuy" :disabled="isClick">
              <i class="el-icon-shopping-bag-1"></i> 立即购买
            </el-button>
          </div>
          <div class="collect">
            <i class="el-icon-star-off" @click="handelCollect" v-if="isCollect"></i>
            <i class="el-icon-star-on" @click="handelCollect" v-else></i>
            <span>点击收藏</span>
          </div>
        </div>
      </el-col>
    </el-row>
    <div class="buy_server">
      <CarNavTitle />
      <!-- 购车服务 -->
      <BuyCarServer />
      <CarNavTitle>车辆信息</CarNavTitle>
      <!-- 车辆信息 -->
      <CarInfoImg />
      <!-- 卖家信息 -->
      <CarNavTitle>卖家信息</CarNavTitle>
      <div class="sell_info_box">
        <el-row>
          <el-col :md="24">
            <p class="sell_title hidden-xs-only">卖家个人信息</p>
          </el-col>
        </el-row>
        <el-row>
          <div class="top_us">
            <el-col :md="10">
              <el-row>
                <el-col :md="10" :xs="10" :sm="14">
                  <div class="sell_user_img">
                    <img :src="allInfo.head_img" alt />
                  </div>
                </el-col>
                <el-col :md="14" :xs="14" :sm="14">
                  <p class="sell_user_name">
                    <span>{{allInfo.name}}</span>
                    <span>车辆检测员</span>
                  </p>
                  <p>
                    <el-button type="warning">在线咨询</el-button>
                  </p>
                </el-col>
              </el-row>
            </el-col>
            <el-col :md="14" class="hidden-xs-only hidden-sm-only">
              <el-row :gutter="10">
                <el-col :md="8">
                  <div class="right_item">
                    <span class="credit">信用值：{{allInfo.credit}} 分</span>
                  </div>
                </el-col>
                <el-col :md="8">
                  <div class="right_item">
                    <span>联系方式：</span>
                    <span>{{allInfo.phone}}</span>
                  </div>
                </el-col>
                <el-col :md="8">
                  <div class="right_item">
                    <span>举报</span>
                    <p class="star_five">
                      <i class="el-icon-s-flag"></i>
                    </p>
                  </div>
                </el-col>
              </el-row>
            </el-col>
          </div>
        </el-row>
        <el-row>
          <el-col :md="24">
            <div class="remark_top">
              <span class="remark">用户评价</span>
            </div>
            <ul>
              <li
                class="remark_item"
                v-for="(item, index) in remarkData.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                :key="index"
              >
                <p class="remark_item_hd">
                  <span class="remark_user_box">
                    <span>
                      <img :src="item.head_img" alt />
                    </span>
                    <span class="u_name">{{item.name}}</span>
                    <span>
                      <i class="el-icon-star-on" v-for="(num,i) in item.comment_num" :key="i"></i>
                    </span>
                  </span>
                  <span class="remark_date">{{item.comment_time}}</span>
                </p>
                <p class="remark_content">{{item.content}}</p>
              </li>
            </ul>
            <!-- 没有评价时显示 -->
            <div v-if="remarkData.length == 0">
              <i class="el-icon-document noData nodataImg"></i>
              <p class="noData">暂无数据</p>
            </div>
            <div class="block">
              <span class="demonstration"></span>
              <el-pagination
                background
                layout="prev, pager, next"
                :page-size="pagesize"
                :total="remarkData.length"
                @current-change="handleCurrentChange"
                hide-on-single-page
              ></el-pagination>
            </div>
          </el-col>
        </el-row>
      </div>
      <!-- 车图描述 -->
      <CarNavTitle>车图描述</CarNavTitle>
      <div class="car_img_box">
        <el-row :gutter="20" v-for="(item,index) in 2" :key="index">
          <el-col :xs="24" :sm="24" :md="12" v-for="(i,ins) in 2" :key="ins">
            <div class="car_de_img">
              <img :src="allInfo.img" alt />
            </div>
          </el-col>
        </el-row>
      </div>
      <!-- 服务保障 -->
      <CarNavTitle>服务保障</CarNavTitle>
      <el-row>
        <el-col :md="24">
          <div class="server_bg">
            <img src="../../assets/images/fwbz_1f13928.png" alt />
          </div>
        </el-col>
      </el-row>
      <!-- 猜你喜欢 -->
      <CarNavTitle>猜你喜欢</CarNavTitle>
      <div class="like_box">
        <el-row :gutter="25">
          <el-col :xs="12" :md="6" v-for="(o, index) in likeData" :key="index" class="like_item">
            <div @click="detail(o.vehicle_id)">
              <el-card :body-style="{ padding: '0px' }">
                <img :src="o.img" class="image" />
                <div style="padding: 14px;">
                  <span class="carName">{{o.vehicle_name}}</span>
                  <p class="time">{{ o.vehicle_time }}</p>
                  <div class="bottom clearfix">
                    <span class="priceFirst">首付{{(o.price*0.1).toFixed(2)}}万</span>
                    <el-button type="warning" plain class="button" size="mini">立即购买</el-button>
                  </div>
                </div>
              </el-card>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>
    <Bottom />
    <!-- 弹出购买框 -->
    <el-drawer
      title="下单信息"
      :visible.sync="drawer"
      :direction="direction"
      :before-close="handleClose"
    >
      <div style="width:80%;margin:20px auto">
        <el-steps :active="active" finish-status="success">
          <el-step title="下单"></el-step>
          <el-step title="支付"></el-step>
          <el-step title="完成"></el-step>
        </el-steps>
        <template>
          <el-table :data="orderArr" border style="width: 100%">
            <el-table-column prop="img" label="图片">
              <template slot-scope="scope">
                <img :src="scope.row.img" style=" width: 80%; margin:0 auto" />
              </template>
            </el-table-column>
            <el-table-column prop="vehicle_name" label="车辆名称"></el-table-column>
            <el-table-column prop="city_name" label="地址"></el-table-column>
            <el-table-column prop="price" label="价格(万)"></el-table-column>
          </el-table>
        </template>
        <p class="order_btn">
          <el-button @click="handleOrder" :disabled="isClick">立即支付</el-button>
          <el-button type="warning" @click="drawer = false">关闭</el-button>
        </p>
      </div>
    </el-drawer>

    <!-- 右侧固定 -->
    <div class="chatBox" @click="isShowCaht = true">
      <i class="el-icon-headset"></i>
    </div>

    <!-- 聊天弹框 -->
    <el-dialog :visible.sync="isShowCaht" :before-close="handleClose" top="0">
      <JwChat-index
        :config="config"
        :taleList="taleList"
        @enter="bindEnter"
        v-model="inputMsg"
        :toolConfig="tool"
        width="100%"
        height="100%"
      />
    </el-dialog>
  </div>
</template>
      

<script>
const CarNavTitle = () => import("./CarNavTitle");
const BuyCarServer = () => import("./BuyCarServer");
const CarInfoImg = () => import("./CarInfoImg");
//导航栏
const Menu = () => import("@/components/web/Menu");
//底部
const Bottom = () => import("@/components/web/Bottom");
//引入网络请求
import { getData, sendParam } from "../../network/home";
import { request } from "../../network/request"; //引入axios请求
export default {
  name: "Detail",
  components: {
    CarNavTitle,
    BuyCarServer,
    CarInfoImg,
    Menu,
    Bottom
  },
  data() {
    return {
      vid: this.$route.query,
      allInfo: {},
      orderArr: [],
      uid: "", //卖家id
      tid: "",
      remarkData: [],
      likeData: [],
      currentPage: 1, //初始页
      pagesize: 2, //    每页的数据
      drawer: false,
      direction: "ttb",
      active: 0,
      isClick: false,
      isShowCaht: false,
      isCollect: true, //收藏
      userId: "", //买家id
      socket: "",
      socketMsg: {},
      userInfo:{},
      inputMsg: "",
      taleList: [],
      tool: {
        show: ["file", "history", "img"],
        callback: this.toolEvent
      },
      config: {
        img:
          "http://b-ssl.duitang.com/uploads/item/201509/22/20150922134955_vfEWL.jpeg",
        name: "平台客服",
        dept: "有事就找姐，姐就是天",
        callback: this.headerEvent
      }
    };
  },
  mounted() {
    this.getCarInfo();
    this.isLogin();
    
  },
  methods: {
    // ------------网络请求---------
    // 判断用户是否登录
    isLogin() {
      let token = localStorage.getItem("tokenVue");
      let url = "login/Login/validateToken";
      request({
        method: "post",
        url: url,
        headers: {
          "Access-Token": token
        }
      })
        .then(res => {
          if (res.data.code == 1) {
            let uid = JSON.parse(res.data.data).id;
            
            this.userId = uid;
            this.userInfo = JSON.parse(res.data.data)
            // 初始化websocket
            this.init(); 
            // 如果买家的id和卖家的id一样就不能购买
            if (uid == this.uid) {
              this.isClick = true;
            }
            // 果然登录判断是否已收藏
            this.isloginAnd();
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 判断是否已收藏
    isloginAnd() {
      let url = "/detail/index/isloginAnd";
      let data = {
        id: this.userId,
        vid: this.vid.vehicleID
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            this.isCollect = false;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },

    getCarInfo() {
      let url = "/detail/index/get";
      let data = {
        id: this.vid.vehicleID
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            this.allInfo = res.data.data[0];
            this.orderArr = res.data.data;
            this.uid = res.data.data[0].sell_id;
            this.tid = res.data.data[0].tab_id;
            this.getRemark();
            this.getLike();
            this.isLogin();
          } else {
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 评价列表
    getRemark() {
      let url = "/detail/index/remark";
      let data = {
        uid: this.uid
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            this.remarkData = res.data.data;
          } else {
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 猜你喜欢
    getLike() {
      let url = "/detail/index/like";
      let data = {
        tid: this.tid
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            this.likeData = res.data.data;
          } else {
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // --------数据操作----------
    handleCurrentChange(currentPage) {
      this.currentPage = currentPage; //点击第几页
    },
    // 跳转详情页
    detail(id) {
      console.log(id);
      this.$router.push({ name: "Detail", query: { vehicleID: id } });

      window.location.reload();
      window.scrollTo(0, 0);
    },
    // 点击购买
    handelbBuy() {
      // 1.判断是否登录 2.判断金额是否够
      if (window.localStorage.getItem("tokenVue") == null) {
        this.$message("请先登录");
        this.$router.push("/Login");
      } else {
        this.getToken();
      }
    },
    // 获取token验证是否登录
    getToken() {
      let token = localStorage.getItem("tokenVue");
      let url = "login/Login/validateToken";
      request({
        method: "post",
        url: url,
        headers: {
          "Access-Token": token
        }
      })
        .then(res => {
          if (res.data.code == 1) {
            let uid = JSON.parse(res.data.data).id;
            this.userId = uid;

            // 跳出弹框
            this.drawer = true;
          } else {
            this.$message({ message: "请先登录" });
            this.$router.push("/Login");
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // 判断钱够不够
    handleOrder() {
      this.active = this.active + 1;
      let url = "/detail/Index/order";
      let data = {
        userId: this.userId,
        uid: this.uid,
        vid: this.vid.vehicleID,
        price: this.allInfo.price
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            const loading = this.$loading({
              lock: true,
              text: "Loading",
              spinner: "el-icon-loading",
              background: "rgba(0, 0, 0, 0.7)"
            });
            setTimeout(() => {
              loading.close();
              this.active = this.active + 1;
              this.$message.success(res.data.msg);
            }, 2000);
            this.isClick = true;
            this.active = this.active + 1;
          } else {
            this.$message(res.data.msg);
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    },
    // 收藏
    handelCollect() {
      // 判断是否登录
      let token = localStorage.getItem("tokenVue");
      let url = "login/Login/validateToken";
      request({
        method: "post",
        url: url,
        headers: {
          "Access-Token": token
        }
      })
        .then(res => {
          if (res.data.code == 1) {
            let uid = JSON.parse(res.data.data).id;
            this.userId = uid;
            let url = "/detail/Index/collect";
            let data = {
              uid: this.uid,
              userId: this.userId,
              vid: this.vid.vehicleID,
              isCollect: this.isCollect
            };
            sendParam(url, data)
              .then(res => {
                if (res.data.code == 1) {
                  this.$message.success(res.data.msg);
                  this.isCollect = false;
                } else if (res.data.code == 2) {
                  this.$message.success(res.data.msg);
                  this.isCollect = true;
                } else {
                  this.$message(res.data.msg);
                }
              })
              .catch(err => {
                console.log(err);
              });
          } else {
            this.$message({ message: "请先登录" });
            this.$router.push("/Login");
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // ----------------------聊天-----------------
    bindEnter() {
      const msg = this.inputMsg;
      if (!msg) return;
      const msgObj = {
        date: new Date().toLocaleDateString() + new Date().toLocaleTimeString(),
        text: { text: msg },
        mine: true,
        name: "我",
        img:
          "http://b-ssl.duitang.com/uploads/item/201509/22/20150922134955_vfEWL.jpeg"
      };
      this.taleList.push(msgObj);
      // 发送到nodee
      var sendContainer = {
        type: 'infor',
        sender: this.userId,
        receiver: 'adminServer',
        container: msg,
        name: this.userInfo.name,
        img: this.userInfo.head_img,
        mine: false
      }
      let params = JSON.stringify(sendContainer);
      console.log(params)
      this.socket.send(params);
    },
    toolEvent(type) {
      console.log("tools", type);
    },
    headerEvent(type) {
      console.log("header", type);
    },
    //-------websocket--
    init() {
      if (typeof WebSocket === "undefined") {
        alert("您的浏览器不支持socket");
      } else {
        // 实例化socket
        this.socket = new WebSocket("ws://127.0.0.1:3000");
        // 监听socket连接
        this.socket.onopen = this.open;
        // 监听socket错误信息
        this.socket.onerror = this.error;
        // 监听socket消息
        this.socket.onmessage = this.getMessage;
      }
    },
    open() {
      console.log("socket连接成功");
      this.send()
    },
    error() {
      console.log("连接错误");
    },
    getMessage(msg) {
      console.log(msg.data);
    },
    send() {
      let showObj = {
        type: "show",
        account: this.userId
      };
      let params = JSON.stringify(showObj);
      console.log(params)
      this.socket.send(params);
    },
    close() {
      console.log("socket已经关闭");
    },
    destroyed() {
      // 销毁监听
      this.socket.onclose = this.close;
    }
  }
};
</script>

<style scoped>
@import "../../assets/css/detail.css";
.server_box:nth-child(2) {
  padding: 0 8px;
}

.block {
  margin: 5px 20px;
}
.carName {
  display: block;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.carOrder {
  color: #fd7a3a;
  margin-left: 20px;
  font-size: 18px;
}
.order_btn {
  float: right;
  margin: 20px 0;
}
.chatBox {
  position: fixed;
  top: 50%;
  right: 0;
  cursor: pointer;
}
.chatBox i {
  font-size: 30px;
  padding: 10px;
}
.chatBox i:hover {
  color: #fd7a3a;
}
</style>
<style>
.block .el-pagination.is-background .el-pager li:not(.disabled).active {
  background-color: #fd7a3a;
  color: #fff;
}
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
.priceFirst {
  font-size: 16px;
  color: #f85d00;
  float: left;
}
.like_item {
  margin-bottom: 25px;
}
.el-drawer__header > :first-child {
  outline: none;
}
.el-drawer.ttb {
  outline: none;
}
.el-drawer {
  height: auto !important;
}
.collect .el-icon-star-on {
  color: #fd7a3a;
}
.collect .el-icon-star-off {
  font-size: 20px !important;
}
</style>
