<!-- @tlh前台公告新闻告滚动条 -->
<template>
  <div class="marquee">
    <div class="marquee_title">
      <span>热门公告</span>
    </div>
    <div class="marquee_box">
      <ul class="marquee_list" :class="{marquee_top:animate}">
        <li v-for="(item,index) in marqueeList" :key="index">{{item.notice_cont}}</li>
      </ul>
    </div>
  </div>
</template> 


<script>
import { request } from "../../network/request"; //引入axios请求
import { getData } from "../../network/home"; //引入axios封装的函数
import { sendParam } from "../../network/home"; //引入axios封装的函数
export default {
  data() {
    return {
      animate: false,

      marqueeList: []
    };
  },
  created: function() {
    // 页面显示
    setInterval(this.showMarquee, 2000);
    // 加载后端数据库数据
    this.getInfo();
  },
  methods: {
    showMarquee: function() {
      this.animate = true;

      setTimeout(() => {
        this.marqueeList.push(this.marqueeList[0]);

        this.marqueeList.shift();

        this.animate = false;
      }, 1000);
    },

    getInfo() {
      sendParam("anotice/index/index", "")
        .then(res => {
          this.marqueeList = res.data.data;
          console.log(this.marqueeList);
        })
        .catch(err => {});
    }
  }
};
</script>
 

<style scoped>
.marquee {
  width: 100%;

  height: 50px;

  align-items: center;

  color: #3a3a3a;

  background-color: #fff;

  display: flex;

  box-sizing: border-box;

  overflow: hidden;
}

.marquee_title {

  width: 120px;

  height: 21px;

  font-size: 18px;

  align-items: center;

  margin-left: 8%;

  padding-right: 2px;



}

.marquee_box {

  border-left: 1px solid #d8d8d8;

  display: block;

  position: relative;

  width: 100%;

  height: 30px;

  overflow: hidden;
}

.marquee_list {
  display: block;

  position: absolute;

  top: 0;

  left: 0;
}

.marquee_top {
  transition: all 3s;

  margin-top: -30px;
}

.marquee_list li {
  height: 30px;

  line-height: 30px;

  font-size: 18px;

  padding-left: 20px;

  color:red
}

.marquee_list li span {
  padding: 0 2px;
  
}
</style>

