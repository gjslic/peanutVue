<template>
	<div id="contanir" v-cloak>
		<!-- 页面头部操作框 -->
		<el-row type="flex" push="3" class="row-bg">
		  <el-col :span="3">
		  	<el-button type="primary"  @click="addDialogForm =true">添加员工</el-button>
		  </el-col>
		  <el-col :span="12">
				<el-select v-model="value" placeholder="请选择" style="width:100px">
					<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
				</el-select>
				<el-input placeholder="请输入内容" v-model="selectInfo" class="input-with-select"></el-input>
				<el-button icon="el-icon-search"></el-button>
		  </el-col>
		</el-row>
		<!-- 员工添加弹出框 -->
		<el-dialog title="员工信息录入" :visible.sync="addDialogForm">
		  <el-form :model="form">
		    <el-form-item label="员工账号" :label-width="formLabelWidth">
		      <el-input @focus="showCom" v-model="form.account" placeholder="请输入账号"></el-input>
		      <span class="commit acc_commit">账号规则：6~10位字符，支持英文、数字和下划线</span>
		    </el-form-item>
		    <el-form-item label="员工密码" :label-width="formLabelWidth">
		    	<el-input placeholder="请输入密码" v-model="form.password" show-password></el-input>
		      <span class="commit psw_commit">密码规则：6~30位字符，支持英文、数字、下划线及常用符号</span>
		    </el-form-item>
		    <el-form-item label="昵称" :label-width="formLabelWidth">
		      <el-input v-model="form.name" placeholder="请输入昵称"></el-input>
		      <span class="commit name_commit">昵称规则：3~6位字符，支持中、英文，数字和下划线</span>
		    </el-form-item>
		    <el-form-item label="手机号" :label-width="formLabelWidth">
		    	<el-input type="text" placeholder="请输入手机号" v-model="form.tel" maxlength="11" show-word-limit></el-input>
		      <span class="commit tel_commit">手机号规则：11位数字，134/152/158/188/138开头</span>
		    </el-form-item>
		    <el-form-item label="头像" :label-width="formLabelWidth">
		    	<el-upload class="avatar-uploader" action="http://localhost/th5/public/index.php/index/index/loadImg" :show-file-list="false" :on-success="uploadImg" :before-upload="beforeUploadImg">
					<img v-if="form.headImg" :src="form.headImg" class="avatar">
  					<i v-else class="el-icon-plus avatar-uploader-icon"></i>
				</el-upload>
		    </el-form-item>
		    <el-form-item label="员工职位" :label-width="formLabelWidth" >
		      <el-select v-model="form.roleList" placeholder="请选择员工职位" @focus="getRoleArr">
		        <el-option v-for="item in form.roleArr" :key="item.id" :label="item.name" :value="item.name"></el-option>
		      </el-select>
		    </el-form-item>
		    <el-form-item label="性别" :label-width="formLabelWidth">
		    	<el-radio v-model="form.radio" label="1">男</el-radio>
		  		<el-radio v-model="form.radio" label="2">女</el-radio>
		    </el-form-item>
		  </el-form>
		  <div slot="footer" class="dialog-footer">
		    <el-button @click="addDialogForm = false">取 消</el-button>
		    <el-button type="primary" @click="addDialogForm = false">确 定</el-button>
		  </div>
		</el-dialog>
		
		<!-- 员工信息展示区 -->
	 	<el-table ref="multipleTable" border style="width:100%" :data="staffArr" tooltip-effect="dark" @current-change="setStaff">
			<el-table-column align="center" type="selection"></el-table-column>
			<el-table-column align="center" prop="id" label="ID">
			<!-- <template slot-scope="scope">{{ id }}</template> -->
			</el-table-column>
			<el-table-column align="center" label="账号">
				<template slot-scope="scope">
					<span>{{scope.row.account}}</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="昵称">
				<template slot-scope="scope">
					<span>{{scope.row.name}}</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="头像">
				<template slot-scope="scope"  v-for="(item , index) in staffArr">
					<el-image :src="item.head_img" :key="index" style="width:80px;border-radius:50%"></el-image>
				</template>
			</el-table-column>
			<el-table-column align="center" label="手机号" width="120px">
				<template slot-scope="scope">
					<span>{{scope.row.phone}}</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="职位">
				<template slot-scope="scope">
					<span>{{scope.row.role_id}}</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="性别">
				<template slot-scope="scope">
					<span>{{scope.row.sex}}</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="状态">
				<template slot-scope="scope">
					<span v-if="scope.row.state == 1">解锁</span>
					<span v-else-if="scope.row.state == 2">锁定</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="操作" width="200px">
				<template slot-scope="scope">
					<el-button type="warning" icon="el-icon-lock" v-if="scope.row.state == 1" @click="editState(scope.row.id,scope.row)" circle></el-button>
					<el-button type="primary" icon="el-icon-unlock" v-else-if="scope.row.state == 2" @click="editState(scope.row.id,scope.row.state,scope.row)" circle></el-button>
					<el-button type="primary" icon="el-icon-edit" circle></el-button>
					<el-button type="danger" icon="el-icon-delete" circle></el-button>
				</template>
			</el-table-column>
		</el-table>
	  <!-- <table style="width:100%;border:1px solid">
		  <thead>
			  <tr>
				  <th>ID</th>
				  <th>账号</th>
				  <th>昵称</th>
				  <th>头像</th>
				  <th>手机号</th>
				  <th>职位</th>
				  <th>性别</th>
				  <th>状态</th>
				  <th>操作</th>
			  </tr>
		  </thead>
		  <tbody v-for="item in staffArr">
			  <tr style="text-align:center">
				  <td>{{item.id}}</td>
				  <td>{{item.account}}</td>
				  <td>{{item.name}}</td>
				  <td><image :src="item.head_img"></image></td>
				  <td>{{item.phone}}</td>
				  <td>{{item.role_id}}</td>
				  <td>{{item.sex}}</td>
				  <td>{{item.state}}</td>
				  <td>
					<el-button type="primary" icon="el-icon-unlock" circle></el-button>
					<el-button type="primary" icon="el-icon-edit" circle></el-button>
					<el-button type="danger" icon="el-icon-delete" circle></el-button>
				  </td>
			  </tr>
		  </tbody>
	  </table> -->
	  <el-pagination background style="text-align:center" layout="prev, pager, next" :total="pageObj.total"></el-pagination>
	</div>
	
	
</template>
<script>
	export default {
		name: 'StaffManage',
		data() {
      return {
      	selectInfo: '', //条件
      	select: '', //条件搜索

      	staffArr:[],  //员工列表
        addDialogForm: false,  //添加弹出框初始状态
        form: {
          name: '',    //昵称 
          account: '', // 添加账号
          password: '',// 添加密码
          tel: '',     // 添加电话
					headImg: '', //图片路径
					roleList: '',
          roleArr: [
						{
							name: '管理员',
							value: 'first'
						},
						{
							name: '超级管理员',
							value: 'second'
						},
						{
							name: '客服',
							value: 'third'
						}
					],
          radio: '1', // 性别
          delivery: false,
        },
				formLabelWidth: '120px',
				options: [{
          value: '选项1',
          label: '账号'
        }, {
          value: '选项2',
          label: '昵称'
        }, {
          value: '选项3',
          label: '手机号'
        }, {
          value: '选项4',
          label: '职位'
        }],
				value: '',
				pageObj: {
					nowPage: 1,
					allPage: 1,
					total: 10
				}
      };
    },
    // 获取员工列表
    mounted() {
    	// let that = this;
    	// that.axios.post('http://localhost/th5/public/admin/Staff/getStaffArr',{

    	// }).then(function (res){
			// 	that.staffArr = res.data.list;
			// 	console.log(that.form.roleArr)
    	// }).catch(function (error) {
    	// 	console.log(error)
    	// })
    },
		methods: {
			// 上传头像
			uploadImg(res, file) {
				this.form.headImg = URL.createObjectURL(file.raw);
			},
      // 获取角色列表
      getRoleArr() {
      	let that = this;
     			this.axios.post('http://localhost/th5/public/admin/Staff/getRoleArr', {

     		 	}).then(function (res) {
					console.log(res);
					if(res.data.code == 1000){
						that.form.roleArr = res.data.roleArr
					}else{
						alert(res.data.msg)
					}
			  }).catch(function (error) {
			    console.log(error);
			  });
      },
      // 
      setStaff() {
				console.log(1);
			},
			// 修改状态
			editState(id,row) {
				console.log(id)
			},
			// 添加输入框提示信息
      showCom() {
      	$('.acc_commit').show()
      },
      // 上传头像定义规则
      beforeUploadImg(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      }
    }
	} 
</script>
<style scoped>
	[v-cloak]{
		display: none;
	}
	.el-input {
		position: relative;
		font-size: 14px;
		display: inline-block;
		width: 50%;
	}
	.commit{
		font-size:14px;
		color: lightblue;
		white-space: nowrap;
		display: none;
	}
	.avatar-uploader{
		border-radius: 6px;
		position: relative;
		overflow: hidden;
	}
	.avatar-uploader-icon{
		display: inline-block;
		text-align: center;
		cursor: pointer;
		outline: 0;
		border: 1px dashed lightcoral;
	}
	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}
	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 80px;
		height: 80px;
		line-height: 80px;
		text-align: center;
	}
	.avatar {
		width: 80px;
		height: 80px;
		display: block;
	}
</style>