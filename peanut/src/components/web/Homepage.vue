<template>
  <div>
    <Menu />
    <Banner />
    <Carbrand />
    <Carrecommend />
    <Bottom />
    <!-- 右侧固定 -->
    <div class="rightChatBox " @click="isChatFn()">
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
// 首页  轮播  品牌  推荐  底部
import Menu from "../web/Menu";
import Banner from "../web/Banner";
import Carbrand from "../web/Carbrand";
import Carrecommend from "../web/Carrecommend";
import Bottom from "../web/Bottom";
//引入网络请求
import { getData, sendParam } from "../../network/home";
import { request } from "../../network/request"; //引入axios请求
export default {
  name: "Homepage",
  components: {
    Menu,
    Banner,
    Carbrand,
    Carrecommend,
    Bottom
  },
  data(){
    return {
      userId: "", //买家id
      socket: "",
      socketMsg: {},
      userInfo:{},
      inputMsg: "",
      taleList: [],
      isShowCaht: false,
      tool: {
        show: ["file", "history", "img"],
        callback: this.toolEvent
      },
      config: {
        img:
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg",
        name: "平台客服",
        dept: "有事就找姐，姐就是天",
        callback: this.headerEvent
      }
    }
  },
  mounted() {
    this.isLogin();  
  },
  methods: {
    
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    },
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
            // 请求用户信息
            this.getUser();
            // lo初始化websocket
            this.init(); 
            
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    //请求用户信息
    getUser(){
      let url = "/detail/index/getUser";
      let data = {
        id: this.userId
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            console.log(res.data.data)
            this.userInfo = res.data.data
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    // ----------------------聊天-----------------
    // 点击聊天，未登录提示请登录
    isChatFn(){
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
          console.log(res)
          if (res.data.code == 1) {
            this.isShowCaht = true   
          }else{
            this.$message({ message: "请先登录" });
            this.$router.push("/Login");
          }
        })
        .catch(err => {
          console.log(err);
        });
      
    },
    bindEnter() {
      const msg = this.inputMsg;
      if (!msg) return;
      const msgObj = {
        date: new Date().toLocaleDateString() + new Date().toLocaleTimeString(),
        text: { text: msg },
        mine: true,
        name: this.userInfo.name,
        img: this.userInfo.head_img,
          
      };
      console.log(this.userInfo)
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
      let msgChat = JSON.parse(msg.data);
      // console.log(msgChat.container)
      this.taleList.push(msgChat.container)
      this.config.img = msgChat.container.img
      this.config.name = msgChat.container.name
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
.rightChatBox {
  position: fixed;
  top: 50%;
  right: 0;
  cursor: pointer;
  z-index: 3;
}
.rightChatBox i {
  font-size: 30px;
  padding: 10px;
}
.rightChatBox i:hover {
  color: #fd7a3a;
}
</style>
<style>
.rightBox{
  display: none !important;
}
.chatBox{
  width:100%;
}
.chatPage{
  width:100% !important;
}
.wrapper{
  width: auto !important;
}
.web__tools dl{
  margin-top: 20px;
}

.ChatPage {
    width:100% !important;
}
@media screen and (max-width:992px){
  .el-dialog{
    width:90% !important;
  }
}
</style>