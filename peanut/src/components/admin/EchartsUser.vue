<!-- @tlh报表管理 -->
<template>
    <div>
        <el-row :gutter="20">
            <el-col :span="24">
                <div class="grid-content bg-purple">
                    <el-container>
                        <el-header>用户表</el-header>
                        <el-main>
                            <div id="demo1"></div>
                        </el-main>
                    </el-container>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
 

<script>
  import echarts from 'echarts'
  import { request } from "../../network/request"; //引入axios请求
  import { getData } from "../../network/home"; //引入axios封装的函数
  import { sendParam } from "../../network/home"; //引入axios封装的函数
  export default {
    name: 'EchartsSale',
    data() {
      return {
        regMonth: JSON.parse(sessionStorage.getItem("regMonth")),
        resNum:JSON.parse(sessionStorage.getItem("resNum"))
      }
    },
    mounted() {
      let this_ = this;
      let myChart = echarts.init(document.getElementById('demo1'));
      let option = {
        color: ['#67C23A'],
        title: {
            text: '注册量/每月'
        },
        tooltip : {
          trigger: 'axis',
          axisPointer : {
            type : 'shadow'
          }
        },
        xAxis : [
          {
            title: {
                text: '月份'
            },
            type : 'category',
            data : this.regMonth,
            axisTick: {
              alignWithLabel: true
            }
          }
        ],
        yAxis : [
          {
            type : 'value'
          }
        ],
        series : [
          {
            name:'本月注册',
            type:'bar',
            barWidth: '60%',
            data:this.resNum
          }
        ]
      };
      myChart.setOption(option);

      //建议加上以下这一行代码，不加的效果图如下（当浏览器窗口缩小的时候）。超过了div的界限（红色边框）
      window.addEventListener('resize',function() {myChart.resize()});  
 
      this.getInfo()
      },
    
    methods: {
        getInfo(){
            sendParam('adminEcharts/index/user','')
            .then(res => {            
                this.regMonth = res.data.data.categories
                this.resNum = res.data.data.data
                sessionStorage.setItem("regMonth",JSON.stringify(this.regMonth));
                sessionStorage.setItem("resNum",JSON.stringify(this.resNum));
                console.log(this.regMonth);
                console.log(this.resNum);
            })
            .catch(err => {  
                
            })
        }
    },
    watch: {},
    created() {

    }
  }
</script>


<style scoped>
  .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
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
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }

.el-header, .el-footer {
    background-color: #F2F6FC;
    color: #333;
    text-align: center;
    line-height: 60px;
  }
  
  .el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
  }
  
  .el-main {
    background-color: #F2F6FC;
    color: #333;
    text-align: center;
    line-height: 360px;
  }
  
  body > .el-container {
    margin-bottom: 40px;
  }
  
  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }
  
  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }

#demo1 {
  width: 100%;
  height: 360px;
  margin: 0 auto;
}
</style>