<template>
    <div class="PersonalContent">
        <el-row :gutter="22">
            <el-col :span="22" :offset="1">
                <div class="grid-content bg-purple">
                    <template>
                         <!-- class="content_box" -->
                        <el-tabs type="border-card">
                            <el-tab-pane>
                                <span slot="label"><i class="el-icon-user"></i> 个人信息</span>
                                <el-row :gutter="24">
                                    <el-col :span="24" :offset="0">
                                        <div class="grid-content bg-purple">
                                            <el-card shadow="always">
                                                <div class="Personal_img">
                                                    <div class="grid-content bg-purple width_60px">
                                                        <img class="img" src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png" alt="">
                                                    </div>
                                                    <div class="grid-content bg-purple width_70 text_color"><el-link type="primary" :underline="false"><i class="el-icon-female font_size_20"></i></el-link>柚子啦啦啦</div>
                                                    <div class="grid-content bg-purple width_70">
                                                        <el-progress :percentage="100" :format="format" :color="customColor"></el-progress>
                                                    </div>
                                                </div>         
                                            </el-card>
                                            <div class="padding_10_10">                                        
                                                <el-collapse v-model="activeName" accordion>
                                                    <!-- 用户信息 -->
                                                    <el-collapse-item name="1">
                                                        <template slot="title" >
                                                            <i class="el-icon-s-custom font_size_20"></i><span class="text_color_2">用户信息</span>
                                                        </template>
                                                        <div>
                                                            <!-- 手机号：13395059606 -->
                                                            <el-link target="_blank" :underline="false">
                                                            <i class="el-icon-phone-outline font_size_16"></i><span class="font_size_13">手机号：133*****606</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 年龄 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-star-off font_size_16"></i><span class="font_size_13">当前用户年龄：21</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 性别 -->
                                                            <el-link target="_blank" :underline="false">
                                                                <el-link type="danger" :underline="false"><i class="el-icon-male font_size_16"></i></el-link>
                                                                <span class="font_size_13">性别：</span>
                                                                <el-link type="primary" :underline="false"><i class="el-icon-female font_size_16"></i></el-link>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 用户余额 -->
                                                            <el-link type="warning" target="_blank" :underline="false">
                                                            <i class="el-icon-coin font_size_16"></i><span class="font_size_13">当前用户余额：<span class="color_ffb800">1314520</span></span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 注册时间 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-map-location font_size_16"></i><span class="font_size_13">个人地址：福建省厦门市海沧区嵩屿南二里263号909室</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 注册时间 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-watch font_size_16"></i><span class="font_size_13">注册时间：2020-06-28</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 当前登录时间 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-watch-1 font_size_16"></i><span class="font_size_13">当前登录时间：2020-06-29</span>
                                                            </el-link>
                                                        </div>
                                                    </el-collapse-item>
                                                    <!-- 充值 -->
                                                    <el-collapse-item name="2">
                                                        <template slot="title">
                                                            <i class="el-icon-platform-eleme font_size_20_409EFF"></i><span class="text_color_3">饿了么充值</span>
                                                        </template>
                                                        <el-form ref="form" :model="form" label-width="80px">
                                                            <el-row :gutter="20">
                                                                <el-col :span="23" :offset="0">         
                                                                <el-form-item label="充值金额">
                                                                    <el-input v-model="form.name" onkeyup="this.value=this.value.replace(/\D/g,'')"></el-input>
                                                                </el-form-item>
                                                                </el-col>
                                                            </el-row>
                                                            <el-form-item label="支付方式">
                                                                <el-radio-group v-model="form.resource">
                                                                    <el-radio label="微信支付"></el-radio>
                                                                    <el-radio label="支付宝支付"></el-radio>
                                                                </el-radio-group>
                                                            </el-form-item>
                                                            <el-form-item>
                                                                <el-button type="primary" @click="onSubmit">立即充值</el-button>
                                                                <el-button>取消</el-button>
                                                            </el-form-item>
                                                        </el-form>
                                                    </el-collapse-item>
                                                    <!-- 修改密码 -->
                                                    <el-collapse-item name="3">
                                                        <template slot="title" >
                                                            <i class="el-icon-s-tools font_size_20"></i><span class="text_color_2">修改密码</span>
                                                        </template>
                                                        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                                                            <el-row :gutter="20">
                                                                <el-col :span="18" :offset="3">
                                                                    <div class="grid-content bg-purple">
                                                                        <el-form-item prop="LoginAccount">
                                                                            <el-input type="text" placeholder="请输您的账号" v-model="ruleForm.LoginAccount" maxlength="11" show-word-limit onkeyup="this.value=this.value.replace(/\D/g,'')">
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
                                                                <el-col :span="18" :offset="3">
                                                                    <el-form-item prop="NewPassword">
                                                                        <el-input type="password" placeholder="请输入新密码" v-model="ruleForm.NewPassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                                                                            <i slot="prefix" class="el-input__icon el-icon-unlock"></i>
                                                                        </el-input>
                                                                    </el-form-item>
                                                                </el-col>
                                                            </el-row>
                                                            <el-row :gutter="20">
                                                                <el-col :span="18" :offset="3">
                                                                    <el-button type="primary" plain class="button">确认修改密码</el-button>
                                                                </el-col>
                                                            </el-row>
                                                        </el-form>
                                                    </el-collapse-item>
                                                    <!-- 修改头像 -->
                                                    <el-collapse-item name="4">
                                                        <template slot="title">
                                                            <i class="el-icon-picture font_size_20"></i><span class="text_color_2">修改头像</span>
                                                        </template>
                                                        <el-row :gutter="20">
                                                            <el-col :span="16" :offset="5">
                                                                <el-upload action="https://jsonplaceholder.typicode.com/posts/" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove">
                                                                    <i class="el-icon-plus" ></i>
                                                                </el-upload>
                                                                <el-dialog :visible.sync="dialogVisible">
                                                                    <img width="100%" :src="dialogImageUrl" alt="" >
                                                                </el-dialog>
                                                            </el-col>
                                                        </el-row>
                                                    </el-collapse-item>
                                                    <!-- 修改性别 -->
                                                    <el-collapse-item name="5">
                                                        <template slot="title">
                                                            <el-link type="primary" :underline="false"><i class="el-icon-female font_size_20"></i></el-link>
                                                            <span class="text_color_2">修改性别</span>
                                                        </template>
                                                        <el-select v-model="value" clearable placeholder="请选择">
                                                            <el-option value="男">
                                                                <el-link type="primary" :underline="false">
                                                                    <i class="el-icon-female font_size_20"></i>
                                                                </el-link>
                                                            </el-option>
                                                            <el-option value="女">
                                                                <el-link type="danger" :underline="false">
                                                                    <i class="el-icon-male font_size_16"></i>
                                                                </el-link>
                                                            </el-option>
                                                        </el-select>
                                                        <el-row :gutter="20">
                                                            <el-col :span="18" :offset="0">
                                                                <el-button type="primary" plain class="button_mt10px">确认修改性别</el-button>
                                                            </el-col>
                                                        </el-row>
                                                    </el-collapse-item>
                                                    <!-- 修改地址 -->
                                                    <el-collapse-item name="6">
                                                        <template slot="title">
                                                            <i class="el-icon-location font_size_20"></i><span class="text_color_2">修改地址</span>
                                                        </template>
                                                        <!-- 省 -->
                                                        <el-select v-model="value1" placeholder="请选择省" class="button_mt10px">
                                                            <el-option-group v-for="group in options" :key="group.label" :label="group.label">
                                                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.value">
                                                            </el-option>
                                                            </el-option-group>
                                                        </el-select>
                                                        <!-- 市 -->
                                                        <el-select v-model="value1" placeholder="请选择市" class="button_mt10px">
                                                            <el-option-group v-for="group in options" :key="group.label" :label="group.label">
                                                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.value">
                                                            </el-option>
                                                            </el-option-group>
                                                        </el-select>
                                                        <!-- 区 -->
                                                        <el-select v-model="value1" placeholder="请选择区" class="button_mt10px">
                                                            <el-option-group v-for="group in options" :key="group.label" :label="group.label">
                                                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.value">
                                                            </el-option>
                                                            </el-option-group>
                                                        </el-select>
                                                        <!-- 详细地址 -->
                                                        <el-row :gutter="20">
                                                            <el-col :span="20" :offset="0">
                                                                    <el-input v-model="index1" class="button_mt10px" placeholder="请输入详细地址" onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')"></el-input>
                                                            </el-col>
                                                        </el-row>
                                                        <el-row :gutter="20">
                                                            <el-col :span="18" :offset="0">
                                                                <el-button type="primary" plain class="button_mt10px">确认修改地址</el-button>
                                                            </el-col>
                                                        </el-row>
                                                    </el-collapse-item>
                                                </el-collapse>
                                            </div>
                                        </div>
                                    </el-col>
                                </el-row>
                                <!-- <el-row>
                                    <el-col :span="24">
                                        <div class="grid-content bg-purple-dark">
                                            <el-avatar class="margin_right_10px" :size="50" src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
                                            <el-link :underline="false">
                                                <el-col :span="24">
                                                    <div class="grid-content bg-purple-dark">柚子啦啦啦</div>
                                                </el-col>
                                                
                                            </el-link>
                                        </div>
                                    </el-col>
                                </el-row> -->
                            </el-tab-pane>
                            <el-tab-pane>
                                <span slot="label"> <el-link type="warning" :underline="false"><i class="el-icon-star-off"></i>我的收藏</el-link></span>
                                <el-collapse v-model="cerName" accordion>
                                    <el-collapse-item name="1">
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/b_84.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">柚子啦啦啦啦啦</el-link>
                                        </template>
                                        <div>
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="text_f">
                                                        <el-link :underline="false">
                                                            <el-link type="info" :underline="false">
                                                                <i class="el-icon-star-on font_size_16"></i><span class="font_size_13">取消收藏</span>
                                                            </el-link>
                                                        </el-link>
                                                    </div>
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" src="../../assets/images/5eda0917532ee771004_20.jpg" alt="">
                                                    </div>
                                                </div>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <div class="text_w_o_t font_size_15"> 
                                                            丰田 致炫 2018款 1.5 自动 E冠军限量版           
                                                        </div>
                                                    </div></el-col>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <div class="tag-group color_b4b3af">       
                                                            2020 | <span>车况极佳</span><span> 8.98万公里</span>
                                                        </div>
                                                    </div></el-col>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <el-link type="warning" :underline="false" class="font_weight">￥7.83万</el-link>
                                                        <el-tag type="danger" class="margin_b_10px"><i class="el-icon-bank-card font_size_16"></i> 点我立即购买</el-tag>
                                                    </div></el-col>
                                                </el-card>
                                            </el-col>
                                        </div>
                                    </el-collapse-item>
                                </el-collapse>
                            </el-tab-pane>
                            <el-tab-pane>
                                <span slot="label"><el-badge value="new" class="item"><i class="el-icon-chat-dot-round"></i>我的消息</el-badge></span>
                               
                            </el-tab-pane>
                            <el-tab-pane>
                                <span slot="label"><i class="el-icon-truck"></i> 我发布的车车</span>
                                <el-collapse v-model="cerCollection" accordion>
                                    <el-collapse-item name="1">
                                        <template slot="title">
                                            <i class="el-icon-upload font_size_20"></i>
                                            <span class="text_color_2">您发布的车车</span>
                                        </template>
                                        <div>
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="text_f">
                                                        <el-link :underline="false">
                                                            <el-link type="info" :underline="false">
                                                                <i class="el-icon-time font_size_16"></i><span class="font_size_13">2020-10-21</span>
                                                            </el-link>
                                                        </el-link>
                                                    </div>
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" src="../../assets/images/5eda0917532ee771004_20.jpg" alt="">
                                                    </div>
                                                </div>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <div class="text_w_o_t font_size_15"> 
                                                            丰田 致炫 2018款 1.5 自动 E冠军限量版           
                                                        </div>
                                                    </div></el-col>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <div class="tag-group color_b4b3af">       
                                                            2020 | <span>车况极佳</span><span> 8.98万公里</span>
                                                        </div>
                                                    </div></el-col>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <el-link type="warning" :underline="false" class="font_weight">￥7.83万</el-link>
                                                        <el-tag type="info" class="margin_b_10px"><i class="el-icon-circle-close font_size_16"></i> 取消发布车车</el-tag>
                                                    </div></el-col>
                                                </el-card>
                                            </el-col>
                                        </div>
                                    </el-collapse-item>
                                </el-collapse>
                            </el-tab-pane>
                            <el-tab-pane>
                                <span slot="label"><i class="el-icon-notebook-2"></i> 买卖记录</span>
                                <el-collapse v-model="cerBusiness" accordion>
                                    <el-collapse-item name="1">
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/gm.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">购买车辆</el-link>
                                        </template>
                                        <div>
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" src="../../assets/peanutImg/5eda0917532ee771004_20.jpg" alt="">
                                                    </div>
                                                </div>
                                                <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                    <div class="text_w_o_t font_size_13"> 
                                                        丰田 致炫 2018款 1.5 自动 E冠军限量版           
                                                    </div>
                                                    <div class="height_20px">
                                                        <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                            车况极佳
                                                        </div>
                                                        <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                            ￥7.83万
                                                        </div>
                                                    </div>
                                                    <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                        <i class="el-icon-time font_size_13"></i> 2020-10-21  
                                                    </div>
                                                    <div class="text_w_o_t font_size_11"> 
                                                        购买中...
                                                    </div>
                                                </div></el-col>
                                                <el-col :span="24"><div class="grid-content bg-purple-light margin_b_10px">
                                                    <el-steps :space="200" :active="1" finish-status="success">
                                                        <el-step title="车辆下单"></el-step>
                                                        <el-step title="车辆付款"></el-step>
                                                        <el-step title="收到车辆"></el-step>
                                                    </el-steps>
                                                </div></el-col>
                                                </el-card>
                                            </el-col>
                                        </div>
                                    </el-collapse-item>
                                    <el-collapse-item name="2">
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/mc.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">卖出车辆</el-link>
                                        </template>
                                        <div>
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" src="../../assets/peanutImg/5eda0917532ee771004_20.jpg" alt="">
                                                    </div>
                                                </div>
                                                <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                    <div class="text_w_o_t font_size_13"> 
                                                        丰田 致炫 2018款 1.5 自动 E冠军限量版           
                                                    </div>
                                                    <div class="height_20px">
                                                        <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                            车况极佳
                                                        </div>
                                                        <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                            ￥7.83万
                                                        </div>
                                                    </div>
                                                    <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                        <i class="el-icon-time font_size_13"></i> 2020-10-21  
                                                    </div>
                                                    <div class="text_w_o_t font_size_11"> 
                                                        卖出中...
                                                    </div>
                                                </div></el-col>
                                                <el-col :span="24"><div class="grid-content bg-purple-light margin_b_10px">
                                                    <el-steps :space="200" :active="1" finish-status="success">
                                                        <el-step title="对方下单"></el-step>
                                                        <el-step title="对方付款"></el-step>
                                                        <el-step title="卖出车辆"></el-step>
                                                    </el-steps>
                                                </div></el-col>
                                                </el-card>
                                            </el-col>
                                        </div>
                                    </el-collapse-item>
                                </el-collapse>   
                            </el-tab-pane>
                        </el-tabs>
                    </template>
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>

export default {
    name: 'PersonalContent',
    data() {
        var validateAcco = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的账号'));
            }
        };
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的密码'));
            }
        };
        var validateNpas = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的新密码'));
            }
        };
        return {
            options: [{
                label: '省份名',
                options: [{
                    value: 'Chengdu',
                    label: '成都'
                }, {
                    value: 'Shenzhen',
                    label: '深圳'
                }, {
                    value: 'Guangzhou',
                    label: '广州'
                }, {
                    value: 'Dalian',
                    label: '大连'
                }]
            }],
            active: 0,
            index1: '',
            value1: '',
            value: '',
            activeName: ['1'],
            cerName:['1'],
            cerCollection:['1'],
            cerBusiness:['1'],
            dialogImageUrl: '',
            dialogVisible: false,
            customColor: [
                {color: '#014289', percentage: 20},
                {color: '#006FAF', percentage: 40},
                {color: '#009AC0', percentage: 60},
                {color: '#00CCBC', percentage: 80},
                {color: '#60F3AB', percentage: 100}
            ],
            form: {
                name: '',
                region: '',
                date1: '',
                date2: '',
                delivery: false,
                type: [],
                resource: '',
                desc: ''
            },
            ruleForm: {
                LoginAccount: '',
                LoginPassword: '',
                NewPassword: '' 
            },
            rules: {
                LoginAccount: [
                    { validator: validateAcco, trigger: 'blur' }
                ],
                LoginPassword: [
                    { validator: validatePass, trigger: 'blur' }
                ],
                NewPassword: [
                    { validator: validateNpas, trigger: 'blur' }
                ]
            }
        }
    },
    methods: {
        handleChange(val) {
            console.log(val);
        },
        format(percentage) {
            return percentage === 100 ? '满信誉' : `${percentage}%`;
        },
        onSubmit() {
            console.log('submit!');
        },
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
        },
        handleRemove(file, fileList) {
            console.log(file, fileList);
        },
        handlePictureCardPreview(file) {
            this.dialogImageUrl = file.url;
            this.dialogVisible = true;
        },
        next() {
            if (this.active++ > 2) this.active = 0;
        }
    }
}
</script>

<style scoped>
.float_f{
    float: left;
}
.button{
    width: 100% !important;
}
.button_mt10px{
    margin: 10px 0 0 0;
}
.text_f{
    margin: 0 0 5px 0;
}
.margin_b_10px{
    margin: 0 0 10px 0;
}
.img_text_div{
    float: left;
}
.PersonalContent{
    background-color: #f0f0f0;
    width: 100%;
    padding: 20px 0 20px 0;
}
/* .content_box{
    height: 500px;
} */
.padding_10_10{
    padding:0 10px 0 10px;
}
.el-col {
    border-radius: 4px;
}
.grid-content {
    border-radius: 4px;
    min-height: 36px;
}
.margin_right_10px{
    margin-right: 10px;
}
.margin_10px{
    margin: 0 0 10px 0;
}
.Personal_img{
    width: 100%;
}
.width_70{
    float: left;
    width: 60%;
    margin: 0 0 0 10px;
}
.height_20px{
    height: 20px;
}
.text_color{
    font-size: 20px;
    font-weight: 700;
}
.width_60px{
    float: left;
    width: 60px;
    margin: 0 10px 0 0;
}
.font_weight{
    font-weight: 700;
}
.img{
    width: 60px;
    height: 60px;
    border-radius: 50px;
}
.img_100{
    width: 100%;
    height: 100%;
}
.text_color_2{
    font-size: 16px;
    font-weight: 700;
}
.text_color_3{
    font-size: 16px;
    font-weight: 700;
    color: #409EFF;
}
.font_size_20{
    font-size: 20px !important;
}
.font_size_20_409EFF{
    color: #409EFF;
    font-size: 20px !important;
}
.font_size_16{
    font-size: 16px !important;
}
.font_size_13{
    font-size: 13px !important;
}
.font_size_11{
    font-size: 11px !important;
}
.color_ffb800{
    color: #ffb800;
}
.color_b4b3af{
    color: #b4b3af;
}
.img_20px_m10px{
    width: 30px;
    height: 30px;
    margin: 0 5px 0 0;
}
.img_120px_f{
    width: 120px;
    height: 80px;
    float: left;
    margin: 0 0 10px 0;
}
.text_w_o_t{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.font_size_15{
    font-size: 15px;
}
/* 上传头像 */
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
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
</style>