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
      uid: '',
      tool: {
        show: ["file", "history", "img"],
        callback: this.toolEvent
      },
      config: {
        img: '',
        name: '',
        dept: "聊天记录",
        callback: this.headerEvent
      }
    };
  },
  mounted() {
    this.getInfoData()
    this.getchat()
  },
  created() {
     // 初始化websocket
    this.init();
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
        date: new Date().toLocaleDateString() + new Date().toLocaleTimeString(),
        text: { text: msg },
        mine: true,
        name: "客服1号",
        img: "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg"
      };
      this.taleList.push(msgObj);
      // 发送到nodee
      var sendContainer = {
        type: 'infor',
        sender: 'adminServer',
        receiver: this.uid,
        container: msg,
        name: "客服1号",
        img: "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg",
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
      let msgChat = JSON.parse(msg.data);
      // console.log(msgChat.container)
      this.taleList.push(msgChat.container)
      this.config.img = msgChat.container.img
      this.config.name = msgChat.container.name
      this.uid = msgChat.id
      console.log(msgChat.id)
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
    getchat(){
      let url = "/info/Center/chat";
      getData(url)
        .then(res => {
          if (res.data.code == 1) {
            console.log(res.data.data)
            for( let item of res.data.data){
              if(item.sender == 'adminServer'){
                const msgObj = {
                  date: item.chat_time,
                  text: { text: item.content },
                  mine: true,
                  name: "客服1号",
                  img: "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg"
                };
                this.taleList.push(msgObj);
              }else{
                const msgObj = {
                  date: item.chat_time,
                  text: { text: item.content },
                  mine: false,
                  name: item.name,
                  img: item.head_img
                };
                this.taleList.push(msgObj);
              }
            }
            
          
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>
