// 聊天组件
<template>
  <JwChat-index 
  :config="config" 
  :taleList="taleList" 
  @enter="bindEnter" 
  v-model="inputMsg" 
  :toolConfig="tool"
  height="480"/>
</template>
<style>
.web__tools dl{
  margin-top: 20px;
}
</style>
<script>
// 引入网络请求模块
import { getData, sendParam } from "../../network/home";
export default {
  name: "Chat",
  data() {
    return {
      adminInfo: {},
      inputMsg: "",
      taleList: [],
      socket: "",
      socketMsg: {},
      tool: {
        show: ["file", "history", "img"],
        callback: this.toolEvent
      },
      config: {
        img: "http://b-ssl.duitang.com/uploads/item/201509/22/20150922134955_vfEWL.jpeg",
        name: "JwChat",
        dept: "最简单、最便捷",
        callback: this.headerEvent
      }
    };
  },
  mounted() {
    this.getInfoData()
    // 初始化websocket
    this.init(); 
    this.getChat()
  },
  methods: {
     // 获取员工信息
    getInfoData() {
      let url = "/info/Center/get";
      let data = {
        token: JSON.parse(localStorage.getItem("token"))
      };
      sendParam(url, data)
        .then(res => {
          // console.log(res.data.data);
          if (res.data.code == 1) {
            let admin = res.data.data;
            this.adminInfo = admin[0];

            
          } else {
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
        date: "2020/05/20 23:19:07",
        text: { text: msg },
        mine: true,
        name: "客服1号",
        img: "http://b-ssl.duitang.com/uploads/item/201509/22/20150922134955_vfEWL.jpeg"
      };
      this.taleList.push(msgObj);
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
      console.log(msgChat.container)
      this.taleList.push(msgChat.container)
    },
    send() {
      let showObj = {
        type: "show",
        account: 'adminServer'
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
    },
    // 打印聊天记录
    getChat(){
      let url = "/info/Center/chat";
      getData(url)
        .then(res => {
          console.log(res.data.data)
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>
