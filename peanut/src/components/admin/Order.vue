<template>
  <div class="contanir">
    <el-breadcrumb separator-class="el-icon-arrow-right" style="font-size:20px">
      <el-breadcrumb-item>Peanut后台</el-breadcrumb-item>
      <el-breadcrumb-item>订单管理</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 头部菜单区 -->
    <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
      <el-menu-item index="全部订单">全部订单</el-menu-item>
      <el-menu-item index="未完成">未完成</el-menu-item>
      <el-menu-item index="待审核">待审核</el-menu-item>
      <el-menu-item index="已完成">已完成</el-menu-item>
      <!-- 搜索框 -->
      <div class="searchBox">
        <el-input placeholder="请输入订单号进行搜索" width="75%" onKeyUp="value=value.replace(/[\W]/g,'')" v-model="selectInfo" class="input-with-select">
          <el-button slot="append" icon="el-icon-search" @click="getOrderList(activeIndex,1,selectInfo)"></el-button>
        </el-input>
        <el-button type="primary" v-if="selectInfo != ''" @click="clearSearch" >清空搜索</el-button>
      </div>
    </el-menu>
    <!-- 订单展示区 -->
    <el-table :data="orderData.slice((nowPage - 1) * pageSize,nowPage*pageSize)" v-if="orderData == undefined || orderData == null || orderData.length <= 0 ? ''  : orderData"  border :header-cell-style="{background:'skyblue',color:'white',fontSize:'18px'}" style="width: 100%;text-align:center;border-radius:10px" :default-sort = "{prop: 'order_num', order: 'descending'}">
      <el-table-column align="center" prop="id" label="ID" width="80px" sortable></el-table-column>
      <el-table-column align="center" prop="orderNum" width="150px" label="订单号" sortable>
      </el-table-column>
      <el-table-column align="center" label="下单账号">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>用户名: {{ scope.row.uName }}</p>
            <p>账号: {{ scope.row.buyer }}</p>
            <p>联系方式: {{ scope.row.phone }}</p>
            <div slot="reference" class="name-wrapper">
              <img :src="scope.row.head_img" style="width:80px;height:80px;border-radius:50%">
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" label="商品名">
        <template slot-scope="scope">
          <el-popover trigger="click" placement="top">
            <img :src="scope.row.carImg" style="max-width:200px;max-height:200px">
            <div slot="reference" class="name-wrapper">
              <span>{{ scope.row.carName }}</span>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="price" label="总价/万"  sortable ></el-table-column>
      <el-table-column align="center" prop="orderTime" width="180px" label="下单时间" sortable></el-table-column>
      <el-table-column align="center" prop="state" label="状态" sortable></el-table-column>
      <el-table-column label="操作" align="center"  width="180px">
        <template slot-scope="scope">
          <el-button icon="el-icon-finished" v-if="scope.row.state == '退款审核中'" type="warning" circle @click="refundApplication(scope.row)"></el-button>
          <el-button icon="el-icon-view" type="primary" circle @click="getNowOrder(scope.row)"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 退款确认弹框 -->
    <el-dialog title="退款详情" :visible.sync="resOrderDialog" width="30%" :before-close="closeOrder">
      <el-form :model="refound">
        <el-image :src="refound.img_content" ></el-image>
        <el-form-item label="退款单号：" :label-width="formLabelWidth">
          <span>{{refound.order_num}}</span>
        </el-form-item>
        <el-form-item label="退款发起时间：" :label-width="formLabelWidth">
          <span>{{refound.report_time}}</span>
        </el-form-item>
        <el-form-item label="退款理由：" :label-width="formLabelWidth">
          <span>{{refound.text_content}}</span>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="warning" @click="cancel">拒绝退款</el-button>
        <el-button type="primary" @click="enterOption">同意退款</el-button>
      </div>
    </el-dialog>
  <!-- 显示当前订单 -->
    <el-dialog title="当前订单展示" :visible.sync="dialogFormVisible">
      <el-form :model="nowData">
          <el-image :src="nowData.carImg" ></el-image>
        <el-form-item label="下单用户：" :label-width="formLabelWidth">
          <span>{{nowData.uName}}</span>
        </el-form-item>
        <el-form-item label="联系方式：" :label-width="formLabelWidth">
          <span>{{nowData.phone}}</span>
        </el-form-item>
        <el-form-item label="卖家信息：" :label-width="formLabelWidth"  v-model="sellerInfo">
          <template>
            <el-popover trigger="hover" placement="top" >
              <p>账号: {{ sellerInfo.seller }}</p>
              <p>联系方式: {{ sellerInfo.sellerTel }}</p>
              <div slot="reference" style="width:120px" class="name-wrapper">
                <span>{{sellerInfo.sName}}</span>
              </div>
            </el-popover>
          </template>
        </el-form-item>
        <el-form-item label="商品名称：" :label-width="formLabelWidth">
          <span>{{nowData.carName}}</span>
        </el-form-item>
        <el-form-item label="商品价格：" :label-width="formLabelWidth">
          <span>{{nowData.price}}万</span>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
      </div>
    </el-dialog>
    <el-pagination
      background
			style="text-align:center"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="nowPage"
      :page-sizes="[5, 10, 15, 100]"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="orderData.length">
    </el-pagination>
  </div>
</template>

<script>
  export default{
    name: 'Order',
    data() {
      return {
        url: 'http://localhost/th5/public/admin_order/Backorder/',
        selectInfo: '', //搜索关键字
        orderData: [], // 所有订单显示
        nowData: [], // 当前订单显示
        sellerInfo: {},
        dialogFormVisible: false, //显示框
        activeIndex: '全部订单', //默认显示订单列表
        formLabelWidth: '120px',
        searchArr: [],
        nowPage: 1,
        pageSize: 5,
        resInfo:{},
        refound: {},
        resOrderDialog: false
      }
    },
    mounted() {
      this.getOrderList('全部订单',this.nowPage,'');
    },
    methods: {
      /**
       * [getOrderList 获取当前类别订单列表]
       */
      getOrderList(type,num,searchInfo){
        let that = this;
        this.nowPage = 1;
        that.loadBack();
        let pageSize = that.pageSize;
        that.orderData = [];
        that.$post(that.url+'getOrderArr', {
          'showType': type,
          'searchInfo': searchInfo,
          'page': that.nowPage,
          'pageSize': that.pageSize
        }).then(function (res) {
          if(res.code == 1){
            that.orderData = res.data;
          }else{
            that.orderData = [];
          }
        }).catch(function (error) {
            console.log(error)
        })
      },
      /**
       * [getNowOrder 获取当前订单信息]
       */
      getNowOrder(row){
        this.loadBack();
        this.nowData = row;
        this.$post(this.url+'getNowOrder',{nowId:row.id})
        .then(res => {
          if(res.code == 1){
            this.sellerInfo = res.data;
            this.dialogFormVisible = true;
          }else{
            this.$message({
              showClose: true,
              message: res.msg,
              type: 'error'
            });
          }
        }).catch(err => {
          console.log(err)
        })
      },
      /**
       * [refundApplication 退款请求]
       */
      refundApplication(row){
        this.loadBack();
        this.resInfo = row;
        this.$post(this.url+'reasonRefund',{
          'nowId': row.id,
        }).then(res => {
          this.refound = res.data;
          this.resOrderDialog = true;
          console.log(this.refound)
        }).catch(err => { 
          console.log(err)
        })
        
      },

      closeOrder(){
        this.resOrderDialog = false;
      },
      /**
       * [enterOption 同意退款]
       */
      enterOption(){
        let resInfo = this.resInfo
        this.$post(this.url+'editState',{
          'nowId': resInfo.id,
          'buyId': resInfo.buyer,
          'price': resInfo.price 
        }).then(res => {
          let msgType = '';
          resInfo.state = '退款成功';
          this.$message({
            showClose: true,
            message: res.msg,
            type: 'success'
          });
          this.resOrderDialog = false;
          this.getOrderList(this.activeIndex);
        }).catch(err => { 
          console.log(err)
        })
      },
      /**
      * [cancel 取消退款]
      */
      cancel(){
        let resInfo = this.resInfo;
        this.$post(this.url+'cancel',{
          'nowId': resInfo.id,
        }).then(res => {
          this.resOrderDialog = false;
          this.$message({
            showClose: true,
            message: '操纵成功',
            type: 'success'
          });
          this.getOrderList(this.activeIndex);
        }).catch(err => {
          console.log(err)
        })
      },
      /**
			 * [loadBack 事件触发延时]
			 */
			loadBack() {
        const loading = this.$loading({
          lock: true,
					text: '客官稍等，马上就好',
          spinner: 'el-icon-loading',
          background: 'rgba(0, 0, 0, 0.7)'
        });
        setTimeout(() => {
          loading.close();
        }, 2000);
      },
      /**
       * [clearSearch 清空搜索框]
       */
      clearSearch(){
        this.selectInfo = '';
        this.getOrderList(this.activeIndex);
      },
      /**
       * [handleSelect 选择]
       */
      handleSelect(key, keyPath) {
        this.getOrderList(key);

      },
      handleSizeChange(page_size) {
        this.pageSize = page_size;
      },
      handleCurrentChange(currentPage) {
        this.nowPage = currentPage;
      }
    }
  }
</script>
<style scoped>
  .el-row {
    margin-bottom: 20px;
  }
  .el-col {
    border-radius: 4px;
  }
  .name-wrapper:hover{
    color:red;
    cursor:pointer;
  }
  .searchBox{
    width: 450px;
    float: right;
    margin-right: 100px;
  }
</style>