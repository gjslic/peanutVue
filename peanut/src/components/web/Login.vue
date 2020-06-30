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
                        <i class="el-icon-s-promotion font_size_30"></i><span class="font_size_30">花生二手车用户登录</span>
                    </el-link>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="18" :offset="3">
                    <div class="grid-content bg-purple">
                        <el-form-item prop="LoginAccount">
                            <el-input type="text" placeholder="请输入账号" v-model="ruleForm.LoginAccount" maxlength="11" show-word-limit onkeyup="this.value=this.value.replace(/\D/g,'')">
                                <i slot="prefix" class="el-input__icon el-icon-key"></i>
                            </el-input>
                        </el-form-item>
                    </div>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="18" :offset="3">
                    <el-form-item prop="LoginPassword">
                        <el-input type="password" placeholder="请输入密码" v-model="ruleForm.LoginPassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                            <i slot="prefix" class="el-input__icon el-icon-lock"></i>
                        </el-input>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="13" :offset="3">
                    <div class="grid-content bg-purple">
                        <el-form-item prop="code">
                            <el-input type="text" placeholder="请输入验证码" v-model="ruleForm.code" maxlength="4" show-word-limit onKeyUp="value=value.replace(/[\W]/g,'')">
                                <i slot="prefix" class="el-input__icon el-icon-edit"></i>
                            </el-input>
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="6" :offset="0">
                    图片
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="18" :offset="3">
                    <el-button type="primary" plain class="LoginButton">确认登录</el-button>
                </el-col>
            </el-row>
            <el-row :gutter="20">
                <el-col :span="18" :offset="3">
                    <el-form-item>
                        <router-link to="/Register" class="Jump_Login"><el-link type="primary" :underline="false">还没账号？点我注册~</el-link></router-link>
                        <router-link to="/AddPersonalCenter" class="Jump_Login margin_r_5"><el-link type="warning" :underline="false">返回首页</el-link></router-link>
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>
    </div>
</template>

<script>
export default {
    name: 'Login',
    data(){
        var validateAcco = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入登录账号'));
            }
        };
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入登录密码'));
            }
        };
        var validateCode = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入登录验证码'));
            }
        };
        return {
            fits: ['fill'],
            url: 'https://uat-vgic2019cms.wedochina.cn/images/files/Homepage/2020Q220200420/19201080.jpg',           
            ruleForm: {
                LoginAccount: '',
                LoginPassword: '',
                code: ''  
            },
            rules: {
                LoginAccount: [
                    { validator: validateAcco, trigger: 'blur' }
                ],
                LoginPassword: [
                    { validator: validatePass, trigger: 'blur' }
                ],
                code: [
                    { validator: validateCode, trigger: 'blur' }
                ]
            }
        }
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
    .LoginButton{
        width: 100% !important;

    }
    .Jump_Login{
        float: right;
    }
</style>