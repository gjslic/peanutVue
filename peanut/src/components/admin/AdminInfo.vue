// 欢迎页
<template>
  <div class="info_box">
    <div class="demo-fit">
      <div class="block" @click="imgShow = true">
        <el-avatar shape="square" :size="100" :src="adminInfo.head_img"></el-avatar>
      </div>
      <el-button
        style="margin: 0 auto;display: block;"
        type="warning"
        size="mini"
        @click="passShow = true"
      >修改密码</el-button>
    </div>

    <div>
      <el-divider></el-divider>
      <span>角色 ：{{adminInfo.role_name}}</span>
      <el-divider></el-divider>
      <span>姓名：{{adminInfo.name}}</span>
      <el-button type="primary" size="mini" class="info_btn" @click="dialogVisible = true">修改</el-button>
      <el-divider></el-divider>
      <span>账号：{{adminInfo.account}}</span>

      <el-divider></el-divider>
      <span>手机号：{{adminInfo.phone}}</span>
      <el-button type="primary" size="mini" class="info_btn" @click="phoneShow = true">修改</el-button>
      <el-divider></el-divider>
      <span>性别 ：{{adminInfo.sex}}</span>
      <el-button type="primary" size="mini" class="info_btn" @click="sexShow = true">修改</el-button>
    </div>
    <!-- 修改姓名 -->
    <el-dialog title="提示" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="姓名" prop="name" class="newName">
          <el-input type="text" v-model="ruleForm.name" autocomplete="off" placeholder="请输入新姓名"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleNameEdit('ruleForm')">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改手机 -->
    <el-dialog title="提示" :visible.sync="phoneShow" width="30%" :before-close="handleClose">
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="手机号" prop="phone" class="newName">
          <el-input type="text" v-model="ruleForm.phone" autocomplete="off" placeholder="请输入新手机"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="phoneShow = false">取 消</el-button>
        <el-button type="primary" @click="handlePhoneEdit('ruleForm')">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改密码 -->
    <el-dialog title="提示" :visible.sync="passShow" width="30%" :before-close="handleClose">
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="密码" prop="pass" class="newName">
          <el-input type="password" v-model="ruleForm.pass" autocomplete="off" placeholder="请输入新密码"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="passShow = false">取 消</el-button>
        <el-button type="primary" @click="handlePassEdit('ruleForm')">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改性别 -->
    <el-dialog title="提示" :visible.sync="sexShow" width="30%" :before-close="handleClose">
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="性别" prop="sex" class="newName">
          <el-radio-group v-model="ruleForm.sex">
            <el-radio label="男"></el-radio>
            <el-radio label="女"></el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="sexShow = false">取 消</el-button>
        <el-button type="primary" @click="handleSexEdit('ruleForm')">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改头像 -->
    <el-dialog title="修改头像" :visible.sync="imgShow" width="30%" :before-close="handleClose">
      <el-upload
        class="avatar-uploader"
        action="http://127.0.0.1/peanut/th5/public/goods/index/upload"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload"
        name="image"
      >
        <img v-if="imageUrl" :src="imageUrl" class="avatar" />
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
      <span slot="footer" class="dialog-footer">
        <el-button @click="imgShow = false">取 消</el-button>
        <el-button type="primary" @click="upAvatar">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<style  scoped>
.info_box {
  width: 60%;
  margin: 0 auto;
}
.info_btn {
  float: right;
}
.block {
  text-align: center;
  cursor: pointer;
}
</style>
<style>
.newName label {
  width: auto !important;
}
.newName .el-form-item__content {
  margin-left: 55px !important;
}
</style>
<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;

}
.el-upload__input{
  display: none !important;
}
</style>
<script>
// 引入网络请求模块
import { getData, sendParam } from "../../network/home";
export default {
  name: "AdminInfo",
  data() {
    // 昵称正则：nickNameReg => 中文、英文、数字包括下划线
    // 手机号正则：telReg => 13,15,17,18开头，11位数字
    // 密码正则：pswReg => 6-16位英文+数字,必须包含大小写字母和数字
    let nickNameReg = /^[\u4E00-\u9FA5A-Za-z0-9_]{1,6}$/;
    let pswReg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,16}$/;
    let telReg = /^1[3578]\d{9}$/;
    var validateName = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入新姓名"));
      } else {
        if (value.match(nickNameReg) == null) {
          callback(new Error("昵称规则：中文、英文、数字包括下划线"));
        }
        callback();
      }
    };
    var validatePhone = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入新手机号"));
      } else {
        if (value.match(telReg) == null) {
          callback(new Error("手机号规则：13,15,17,18开头，11位数字"));
        }
        callback();
      }
    };
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入新密码"));
      } else {
        if (value.match(pswReg) == null) {
          callback(
            new Error("密码规则：8-10位英文+数字,必须包含大小写字母和数字")
          );
        }
        callback();
      }
    };
    return {
      adminInfo: {},
      dialogVisible: false,
      phoneShow: false,
      passShow: false,
      sexShow: false,
      imgShow: false,
      imageUrl: "",
      lastUrl: '',
      ruleForm: {
        name: "",
        phone: "",
        pass: "",
        sex: ""
      },
      rules: {
        name: [{ validator: validateName, trigger: "blur" }],
        phone: [{ validator: validatePhone, trigger: "blur" }],
        pass: [{ validator: validatePass, trigger: "blur" }],
        sex: [{ required: true, message: "请选性别", trigger: "change" }]
      }
    };
  },
  created() {
    this.getInfoData();
  },
  methods: {
    // ----------网络请求----------
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
            this.ruleForm.name = admin[0].name;
            this.ruleForm.phone = admin[0].phone;
            this.ruleForm.sex = admin[0].sex;
          } else {
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    },
    // 修改用户名
    handleNameEdit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          let url = "/info/Center/editName";
          let data = {
            id: this.adminInfo.id,
            name: this.ruleForm.name
          };
          sendParam(url, data)
            .then(res => {
              console.log(res.data.data);
              if (res.data.code == 1) {
                this.$message.success(res.data.msg);
                this.adminInfo.name = this.ruleForm.name;
                this.dialogVisible = false;
              } else {
                this.$message.error(res.data.msg);
              }
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          this.$message.error("请按正确格式输入");
          return false;
        }
      });
    },
    // 修改手机
    handlePhoneEdit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          let url = "/info/Center/editPhone";
          let data = {
            id: this.adminInfo.id,
            phone: this.ruleForm.phone
          };
          sendParam(url, data)
            .then(res => {
              if (res.data.code == 1) {
                this.$message.success(res.data.msg);
                this.adminInfo.phone = this.ruleForm.phone;
                this.phoneShow = false;
              } else {
                this.$message.error(res.data.msg);
              }
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          this.$message.error("请按正确格式输入");
          return false;
        }
      });
    },
    // 修改密码
    handlePassEdit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          let url = "/info/Center/editPass";
          let data = {
            id: this.adminInfo.id,
            pass: this.ruleForm.pass
          };
          sendParam(url, data)
            .then(res => {
              console.log(res.data.data);
              if (res.data.code == 1) {
                this.$message.success(res.data.msg);
                this.passShow = false;
              } else {
                this.$message.error(res.data.msg);
              }
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          this.$message.error("请按正确格式输入");
          return false;
        }
      });
    },
    // 修改性别
    handleSexEdit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          let url = "/info/Center/editSex";
          let data = {
            id: this.adminInfo.id,
            sex: this.ruleForm.sex
          };
          sendParam(url, data)
            .then(res => {
              console.log(res.data.data);
              if (res.data.code == 1) {
                this.$message.success(res.data.msg);
                this.adminInfo.sex = this.ruleForm.sex;
                this.sexShow = false;
              } else {
                this.$message.error(res.data.msg);
              }
            })
            .catch(err => {
              console.log(err);
            });
        } else {
          this.$message.error("请按正确格式输入");
          return false;
        }
      });
    },
    // 修改头像
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.lastUrl = file.response
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isPNG = file.type === "image/png";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG && !isPNG) {
        this.$message.error("上传头像图片只能是 JPG 和 PNG格式!");
      }else if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return (isJPG || isPNG) && isLt2M;
    },
    // 确定修改头像
    upAvatar(){
      this.$confirm('您确定要修改头像吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let url = "/info/Center/editAvatar";
          let data = {
            id: this.adminInfo.id,
            imgUrl: this.lastUrl
          };
          sendParam(url, data)
            .then(res => {
              if (res.data.code == 1) {
                this.$message.success(res.data.msg);
                this.imgShow = false;
                this.adminInfo.head_img = this.lastUrl;
              } else {
                this.$message.error(res.data.msg);
              }
            })
            .catch(err => {
              console.log(err);
            });

          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消修改'
          }); 
          
        }) 

    }
  }
};
</script>