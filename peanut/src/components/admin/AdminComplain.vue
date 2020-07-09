<!-- @tlh举报管理 -->
<template>
  <div>
    <!-- 公告数据渲染 -->
    <el-table
      :data="tableData.slice((currentPage-1)*pagesize,currentPage*pagesize)"
      style="width: 100%"
    >
      <el-table-column prop="id" label="ID" width="50"></el-table-column>
      <el-table-column prop="uName" label="买家" width="80"></el-table-column>
      <el-table-column prop="comment_num" label="评分" width="80"></el-table-column>
      <el-table-column prop="content" label="内容" width="300"></el-table-column>
      <el-table-column prop="comment_time" label="时间" width="100"></el-table-column>
      <el-table-column prop="dName" label="卖家" width="80"></el-table-column>
      <el-table-column prop="dCredit" label="信用值" width="80"></el-table-column>
      <el-table-column prop="comment_state" label="状态" width="80"></el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" type="success" @click="handleEdit(scope.$index, scope.row)">信用+1</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">信用-2</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="block">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pagesize"
        :page-sizes="[4, 8, 16, 32]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="tableData.length"
      ></el-pagination>
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
      tableData: [],
      currentPage: 1, // 初始页
      pagesize: 4 // 每页的数据
    };
  },
  mounted() {
    this.getInfo();
  },
  methods: {
    //获取公告
    getInfo() {
      sendParam("acomplain/index/index", "")
        .then(res => {
           console.log(res)
          this.tableData = res.data.data;
        })
        .catch(err => {});
    },


    // 初始页currentPage、初始每页数据数pagesize和数据data
    handleSizeChange: function(size) {
      this.pagesize = size; //每页下拉显示数据
    },


    handleCurrentChange(currentPage) {
      this.currentPage = currentPage; //点击第几页
    },


    //加分
    handleEdit(index, row) {
    if (row.comment_state == '已审') {
        this.$message.error("该评价已处理完毕，请勿重复提交");
        return;
    }
    if (row.dCredit == 100) {
        this.$message.error("该商家信用已经是满分，暂时无需处理");
        return;
    }
    if (row.comment_num < 3) {
        this.$message.error("用户评分小于3分，不可以进行加分");
        return;
    }
   
      this.$confirm("此操作将为商家信用值加1分, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.addscore(row);
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消加分"
          });
        });
    },


    //减分
    handleDelete(index, row) {
    if (row.comment_state == '已审') {
        this.$message.error("该评价已处理完毕，请勿重复提交");
        return;
    }
    if (row.comment_num >= 3) {
        this.$message.error("用户评分大于3分，不可以进行扣分");
        return;
    }
    this.$confirm("此操作将扣除商家信用值2分, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
    })
    .then(() => {
        this.deleteScore(row);
    })
    .catch(() => {
        this.$message({
        type: "info",
            message: "已取消扣除"
        });
    });
    },


    //封装加分
    addscore(row) {
      let url = "acomplain/index/update";
      let data = {
        id: row.sell_id,//此处获取要加分的商家id
        credit: row.dCredit+=1//加分
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            this.$message.success(res.data.msg);
            this.getInfo();
          } else {
            this.$message.error(res.data.msg);
          }
        })
        .catch(err => {});
    },


    //封装减分
    deleteScore(row) {
      let url = "acomplain/index/update";
      let data = {
        id: row.sell_id,//此处获取要加分的商家id
        credit: row.dCredit-=2//减分
      };
      sendParam(url, data)
        .then(res => {
          if (res.data.code == 1) {
            this.$message.success(res.data.msg);
                this.getInfo();
          } else {
            this.$message.error(res.data.msg);
          }
        })
        .catch(err => {

        });
    }
  }
};
</script>

<style scope>
.el-select .el-input {
  width: 130px;
}
.input-with-select .el-input-group__prepend {
  background-color: #fff;
}
.block {
  margin: 10px 0;
}
.user_avator {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
</style>