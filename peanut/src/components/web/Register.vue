<template>   
  <div>
    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
      <el-row class="margin_bottom_20">
        <el-col :span="24">
          <div class="grid-content bg-purple-dark">
            <div class="demo-image">
              <div class="block" v-for="fit in fits" :key="fit">
                <el-image style="width: 100%; height:100%" :src="url" :fit="fit"></el-image>
              </div>
            </div>
          </div>  
        </el-col>
      </el-row>
      <el-row :gutter="20" class="margin_bottom_20">
        <el-col :span="18" :offset="3" style="text-align: center;">
          <el-link type="primary" :underline="false">
            <i class="el-icon-s-management font_size_30"></i><span class="font_size_30">花生二手车用户注册</span>
          </el-link>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="18" :offset="3">
          <div class="grid-content bg-purple">
            <el-form-item prop="account">
              <el-input type="text" placeholder="请输入账号" v-model="ruleForm.account" maxlength="11" show-word-limit onkeyup="this.value=this.value.replace(/\D/g,'')">
                <i slot="prefix" class="el-input__icon el-icon-key"></i>
              </el-input>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="18" :offset="3">
          <div class="grid-content bg-purple">
            <el-form-item prop="password">
              <el-input type="password" placeholder="请输入密码" v-model="ruleForm.password" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                <i slot="prefix" class="el-input__icon el-icon-lock"></i>
              </el-input>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="18" :offset="3">
          <div class="grid-content bg-purple">
              <el-form-item prop="newPassword">
                <el-input type="password" placeholder="确认密码" v-model="ruleForm.newPassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                  <i slot="prefix" class="el-input__icon el-icon-unlock"></i>
                </el-input>
              </el-form-item>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="18" :offset="3">
            <el-button type="primary" plain class="button">确认注册</el-button>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="18" :offset="3">
          <el-form-item>
            <router-link to="/Login" class="Jump_Login"><el-link type="primary" :underline="false">已有账号？点我登录~</el-link></router-link>
            <router-link to="/Register" class="Jump_Login margin_r_5"><el-link type="warning" :underline="false">返回首页</el-link></router-link>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>
<script>
export default {
    name: 'Register',
    data() {
        var validateAcco = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入注册账号'));
            }
        };
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入注册密码'));
            } else {
            if (this.ruleForm.newPassword !== '') {
                this.$refs.ruleForm.validateField('newPassword');
            }
                callback();
            }
        };
        var validatePass2 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请再次输入密码'));
            } else if (value !== this.ruleForm.password) {
                callback(new Error('两次输入密码不一致!'));
            } else {
                callback();
            }
        };
        return {
          fits: ['fill'],
          url: 'https://uat-vgic2019cms.wedochina.cn/images/files/CarType/Touareg/20200619cheshu/banner192010801_1.jpg',
          ruleForm: {
                account: '',
                password: '',
                newPassword: ''
                
            },
            rules: {
                account: [
                    { validator: validateAcco, trigger: 'blur' }
                ],
                password: [
                    { validator: validatePass, trigger: 'blur' }
                ],
                newPassword: [
                    { validator: validatePass2, trigger: 'blur' }
                ]
            }
          
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    alert('submit!');
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    }
}
</script>

<style scoped>
  .el-row {
    &:last-child {
      margin-bottom: 0;
    }
  }
  .font_size_30{
    font-size: 25px !important;
  }
  .margin_bottom_20{
    margin-bottom: 20px;
  }
  .margin_r_5{
        margin: 0 5px 0 0;
    }
  .el-col {
    border-radius: 4px;
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
  .button{
    width: 100% !important;
  }
  .Jump_Login{
    float: right;
  }
</style>