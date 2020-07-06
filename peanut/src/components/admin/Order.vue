<template>
  <div class="contanir">
    <h1>订单管理</h1>
    <el-row type="flex" push="3" class="row-bg">
		  <el-col :span="12">
			<el-select v-model="setInfo.value" placeholder="请选择" style="width:100px;float:left">
				<el-option v-for="item in setInfo" :key="item.name" :label="item.name" :value="item.name"></el-option>
			</el-select>
			<el-input placeholder="请输入内容" v-model="selectInfo" style="width:150px;float:left" class="input-with-select"></el-input>
			<el-button icon="el-icon-search"></el-button>
		  </el-col>
		</el-row>
    <el-table :data="orderData" border :header-cell-style="{background:'skyblue',color:'white',fontSize:'18px'}" style="width: 100%;text-align:center" :default-sort = "{prop: 'order_num', order: 'descending'}">
      <el-table-column align="center" prop="id" label="ID" width="80px" sortable></el-table-column>
      <el-table-column align="center" prop="orderNum" label="订单号" sortable>
      </el-table-column>
      <el-table-column align="center" label="下单账号">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>用户名: {{ scope.row.uName }}</p>
            <p>账号: {{ scope.row.buyer }}</p>
            <p>联系方式: {{ scope.row.phone }}</p>
            <div slot="reference" class="name-wrapper">
              <img :src="scope.row.head_img" style="width:80px;height:80px">
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" label="商品名">
        <template slot-scope="scope">
          <el-popover trigger="click" placement="top">
            <img :src="scope.row.carImg" style="max-width:200px;max-height:200px">
            <div slot="reference" class="name-wrapper">
              <span style="cursor:pointer">{{ scope.row.carName }}</span>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="price" label="总价/万"  sortable ></el-table-column>
      <el-table-column align="center" prop="orderTime" label="下单时间" sortable></el-table-column>
      <el-table-column align="center" prop="state" label="状态" sortable></el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button icon="el-icon-search" type="primary" circle @click="getNowOrder(scope.row)"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="当前订单展示" :visible.sync="dialogFormVisible">
      <el-form :model="nowData">
        <el-form-item label="车辆展示" :label-width="formLabelWidth">
          <el-image :src="nowData.carImg" width="200px"></el-image>
        </el-form-item>
        <el-form-item label="下单用户" :label-width="formLabelWidth">

        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
      </div>
    </el-dialog>
	  <el-pagination background style="text-align:center" :page-size='8' layout="prev, pager, next" :total="100"></el-pagination>
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
        dialogFormVisible: false, //显示框
        formLabelWidth: '120px',
        setInfo: [{
          value: '1',
          name: '买家账号'
        },
        {
          value: '2',
          name: '订单号'
        }],
        
      }
    },
    mounted() {
      var that = this;
      that.$post(this.url+'getOrderArr', {
      }).then(function (res) {
          console.log(res);
          that.orderData = res.data;
      }).catch(function (error) {
          console.log(error)
      })
    },
    methods: {
      formatter(row, column) {
          return row.address;
      },
      getNowOrder(row){
        this.nowData = row;
        this.dialogFormVisible = true;
      }
    }
  }
</script>
<style scoped>
.sort-caret{
  color:white;
}
</style>