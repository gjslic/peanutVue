<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="24">
        <div class="grid-content bg-purple">
          <el-container>
            <!-- <el-header>
            </el-header> -->
            <el-main>
              <div id="main"></div>
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
    name: 'index',
    data() {
      return {
          
          dataArr:[]
      }
    },
    mounted: function() {
        this.getInfo()
      this.$nextTick(function() {
        this.getPie()
      })
    },
    methods: {
    getInfo(){
        sendParam('aecharts/index/pie','')
        .then(res => {       
            // console.log(res.data[0][0]) 
            this.dataArr = [
                res.data[0][0],
                res.data[1][0],
                res.data[2][0],
                res.data[3][0]
            ]
             this.$nextTick(function() {
                    this.getPie()
                })
        })
        .catch(err => {  
            
        })
    },
      getPie() {
        // 绘制图表
        var myChart = echarts.init(document.getElementById('main'))
        // 指定图表的配置项和数据
        var option = {
          //标题
          title: {
            text: '订单状态饼图',
            x: 'left' ,              //标题位置
            // textStyle: { //标题内容的样式
            //   color: '#000',
            //   fontStyle: 'normal',
            //   fontWeight: 100,
            //   fontSize: 16 //主题文字字体大小，默认为18px
            // },
          },
          // stillShowZeroSum: true,
          //鼠标划过时饼状图上显示的数据
          tooltip: {
            trigger: 'item',
            formatter: '{a}<br/>{b}:{c} ({d}%)'
          },
          //图例
          legend: {//图例  标注各种颜色代表的模块
            // orient: 'vertical',//图例的显示方式  默认横向显示
            bottom: 10,//控制图例出现的距离  默认左上角
            left: 'center',//控制图例的位置
            // itemWidth: 16,//图例颜色块的宽度和高度
            // itemHeight: 12,
            textStyle: {//图例中文字的样式
              color: '#000',
              fontSize: 16
            },
            data: ['交易完成', '待验收', '退款审核中','退款完成']//图例上显示的饼图各模块上的名字
          },
          //饼图中各模块的颜色
          color: ['#67C23A', '#409EFF', '#F56C6C','#E6A23C'],
          // 饼图数据
          series: {
            name: '订单',
            type: 'pie',             //echarts图的类型   pie代表饼图
            radius: '70%',           //饼图中饼状部分的大小所占整个父元素的百分比
            center: ['50%', '50%'],  //整个饼图在整个父元素中的位置
            // data:''               //饼图数据
            data: this.dataArr,
            itemStyle: {
              normal: {
                label: {
                  show: true,//饼图上是否出现标注文字 标注各模块代表什么  默认是true
                  // position: 'inner',//控制饼图上标注文字相对于饼图的位置  默认位置在饼图外
                },
                labelLine: {
                  show: true//官网demo里外部标注上的小细线的显示隐藏    默认显示
                }
              }
            },
          }

        }
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option)
      }
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

#main {
  width: 100%;
  height: 360px;
  margin: 0 auto;
}
</style>

