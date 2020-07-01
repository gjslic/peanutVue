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
		      <el-input v-model="form.account" required="true" placeholder="请输入账号"></el-input>
		      <span class="commit acc_commit">账号规则：6~10位字符，支持英文、数字,英文开头</span>
		    </el-form-item>
		    <el-form-item label="员工密码" :label-width="formLabelWidth">
		    	<el-input placeholder="请输入密码" v-model="form.password" show-password></el-input>
		      <span class="commit psw_commit">密码规则：6~30位字符，支持英文、数字和小数点，英文开头</span>
		    </el-form-item>
		    <el-form-item label="昵称" :label-width="formLabelWidth">
		      <el-input v-model="form.name" placeholder="请输入昵称"></el-input>
		      <span class="commit name_commit">昵称规则：3~6位字符，支持中、英文，数字和下划线</span>
		    </el-form-item>
		    <el-form-item label="手机号" :label-width="formLabelWidth">
		    	<el-input type="text" placeholder="请输入手机号" v-model="form.tel" maxlength="11" show-word-limit></el-input>
		      <span class="commit tel_commit">手机号规则：11位数字，134/152/158/188/138开头</span>
		    </el-form-item>
		    <el-form-item label="员工职位" :label-width="formLabelWidth" >
		      <el-select v-model="form.checkRole" placeholder="请选择员工职位" @focus="getRoleArr">
		        <el-option v-for="item in roleArr" :key="item.id" :label="item.role_name" :value="item.role_name"></el-option>
		      </el-select>
		    </el-form-item>
		    <el-form-item label="性别" :label-width="formLabelWidth">
		    	<el-radio v-model="form.sex" label="男">男</el-radio>
		  		<el-radio v-model="form.sex" label="女">女</el-radio>
		    </el-form-item>
		  </el-form>
		  <div slot="footer" class="dialog-footer">
		    <el-button @click="addDialogForm = false">取 消</el-button>
		    <el-button type="primary" :plain="true" @click="addStaff">确 定</el-button>
		  </div>
		</el-dialog>
		<!-- 员工信息展示区 -->
	 	<el-table ref="multipleTable" border style="width:100%" :data="staffArr" tooltip-effect="dark">
			<el-table-column align="center" type="selection"></el-table-column>
			<el-table-column align="center" prop="id" sortable label="ID">
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
					<el-image :src="scope.row.head_img" :key="index" style="width:80px;border-radius:50%"></el-image>
				</template>
			</el-table-column>
			<el-table-column align="center" label="手机号" width="120px">
				<template slot-scope="scope">
					<span>{{scope.row.phone}}</span>
				</template>
			</el-table-column>
			<el-table-column align="center" label="职位">
				<template slot-scope="scope">
					<span>{{scope.row.role_name}}</span>
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
					<el-button type="primary" icon="el-icon-unlock" v-else-if="scope.row.state == 2" @click="editState(scope.row.id,scope.row)" circle></el-button>
					<el-button type="primary" icon="el-icon-edit" @click="editStaff(scope.row)" circle></el-button>
					<el-button type="danger" icon="el-icon-delete" circle></el-button>
				</template>
			</el-table-column>
		</el-table>
	  <el-pagination background style="text-align:center" layout="prev, pager, next" :total="pageObj.total"></el-pagination>
	</div>
	
	
</template>
<script>
	import {request} from "../../network/request";
	export default {
		name: 'StaffManage',
		data() {
      return {
				url: 'http://localhost/th5/public/',
      	selectInfo: '', //条件
      	select: '', //条件搜索
				roleArr: [], // 职位列表
      	staffArr:[],  //员工列表
        addDialogForm: false,  //添加弹出框初始状态
        form: {
          name: '',    //昵称 
          account: '', // 添加账号
          password: '',// 添加密码
          tel: '',     // 添加电话
					headImg: 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg', //图片路径
					checkRole: '',
          sex: '', // 性别
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
			let that = this;
			// that.$post('adminStaffManage/staff/getStaffArr',{
			// }).then(res => {
			// 	console.log(res)
			// 	that.staffArr = res.list;
			// }).catch(err => {
			// 	console.log(err)
			// })

			request({
				url: 'adminStaffManage/staff/getStaffArr'
			}).then(res =>{
				console.log(res)
				that.staffArr = res.data.list;
			}).catch(err =>{	
				console.log(err)
			})
    	
    },
		methods: {
			/**
			 * [addStaff 添加员工]
			 */
			addStaff(){
				let that = this;
				// that.$post(that.url+'adminStaffManage/staff/addStaff',{
				// 	data: that.form
				// }).then(res => {
				// 	let code = res.code;
				// 	let infoType = '';
				// 	if(code == 1000){
				// 		infoType = 'success';
				// 		that.addDialogForm = false;
				// 	}else{
				// 		infoType = 'error'
				// 	}
				// 	that.$message({
				// 		showClose: true,
				// 		message: res.msg,
				// 		type: infoType
				// 	});
				// 	console.log(res)
				// }).catch(err => {
				// 	console.log(err)
				// })
			},
			/**
			 * [getRoleArr 获取角色列表]
			 */
      getRoleArr() {
				let that = this;
				request({
					url: 'adminStaffManage/staff/getRoleArr'
				}).then(res =>{
					console.log(res)
					that.roleArr = res.data.roleArr;
				}).catch(err =>{	
					console.log(err)
				})
				
				// that.$post(that.url+'adminStaffManage/staff/getRoleArr',{
				// }).then(res => {
				// 	if(res.code == 1000){
				// 		that.roleArr = res.roleArr
				// 	}else{
				// 		that.$message({
				// 			showClose: true,
				// 			message: res.msg,
				// 			type: 'error'
				// 		});
				// 	}
				// }).catch(err => {
				// 	console.log(err)
				// })
			},
			/**
			 * [editState 修改状态]
			 */
			editState(id,row) {
				console.log(row)
				if(row.state == 1){
					row.state = 2
				}else{
					row.state = 1
				}
			},
			/**
			 * [editStaff 修改员工信息弹出框]
			 */
			editStaff(row){
				console.log(row)
			},
			/**
			 * [beforeUploadImg 上传头像定义规则 ]
			 */
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