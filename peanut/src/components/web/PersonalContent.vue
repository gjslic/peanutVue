<template>
    <div id="PersonalContent" class="PersonalContent">
        <el-row :gutter="22">
            <el-col :span="22" :offset="1">
                <div class="grid-content bg-purple">
                    <template>
                         <!-- class="content_box" -->
                        <el-tabs type="border-card">
                            <!-- 个人信息 -->
                            <el-tab-pane>
                                <span slot="label"><i class="el-icon-user"></i> 个人信息</span>
                                <el-row :gutter="24">
                                    <el-col :span="24" :offset="0">
                                        <div class="grid-content bg-purple">
                                            <el-card shadow="always">
                                                <div class="Personal_img">
                                                    <div class="grid-content bg-purple width_60px">
                                                        <img class="img" :src="userMessage.head_img" alt="">
                                                    </div>
                                                    <!-- 如果数据库等于男的就是蓝色性别 -->
                                                    <div class="grid-content bg-purple width_70 text_color" v-if="userMessage.sex == '男'">
                                                        {{userMessage.name}}
                                                        <el-link type="primary" :underline="false" @click="changeName"><i class="el-icon-edit font_size_20"></i></el-link>
                                                    </div>
                                                    <!-- else 就是红色性别 -->
                                                    <div class="grid-content bg-purple width_70 text_color" v-else>
                                                        {{userMessage.name}}
                                                        <el-link type="danger" :underline="false" @click="changeName"><i class="el-icon-edit font_size_20"></i></el-link>
                                                    </div>
                                                    <div class="grid-content bg-purple width_70">
                                                        <el-progress :percentage="userMessage.credit" :format="format" :color="customColor"></el-progress>
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
                                                            <i class="el-icon-phone-outline font_size_16"></i><span class="font_size_13">手机号： {{userMessage.phone}}</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 性别 -->
                                                            <!-- 判断性别 -->
                                                            <el-link target="_blank" :underline="false" v-if="userMessage.sex == '男'">
                                                                <el-link type="danger" :underline="false"><i class="el-icon-female font_size_16"></i></el-link>
                                                                <span class="font_size_13">性别：</span>
                                                                <el-link type="primary" :underline="false"><i class="el-icon-male font_size_16"></i></el-link>
                                                            </el-link>
                                                            <el-link target="_blank" :underline="false" v-else>
                                                                <el-link type="primary" :underline="false"><i class="el-icon-male font_size_16"></i></el-link>
                                                                <span class="font_size_13">性别：</span>
                                                                <el-link type="danger" :underline="false"><i class="el-icon-female font_size_16"></i></el-link>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 用户余额 -->
                                                            <el-link type="warning" target="_blank" :underline="false">
                                                            <i class="el-icon-coin font_size_16"></i><span class="font_size_13">当前用户余额：<span class="color_ffb800">{{userMessage.money}}</span></span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 个人地址 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-map-location font_size_16"></i><span class="font_size_13">个人地址：{{userMessage.add}}</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 注册时间 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-watch font_size_16"></i><span class="font_size_13">注册时间：{{userMessage.register_time}}</span>
                                                            </el-link>
                                                        </div>
                                                        <div>
                                                            <!-- 当前登录时间 -->
                                                            <el-link :underline="false">
                                                            <i class="el-icon-watch-1 font_size_16"></i><span class="font_size_13">当前登录时间：{{userMessage.last_time}}</span>
                                                            </el-link>
                                                        </div>
                                                    </el-collapse-item>
                                                    <!-- 充值 -->
                                                    <el-collapse-item name="2">
                                                        <template slot="title">
                                                            <i class="el-icon-platform-eleme font_size_20_409EFF"></i><span class="text_color_3">饿了么充值</span>
                                                        </template>
                                                        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                                                            <el-row :gutter="20">
                                                                <el-col :span="18" :offset="3">
                                                                    <div class="grid-content bg-purple">
                                                                        <el-form-item prop="rechargeMoney">
                                                                            <el-input type="text" placeholder="请输您充值的金额" v-model="ruleForm.rechargeMoney" maxlength="10" show-word-limit onkeyup="this.value=this.value.replace(/\D/g,'')">
                                                                                <i slot="prefix" class="el-input__icon el-icon-coin"></i>
                                                                            </el-input>
                                                                        </el-form-item>
                                                                    </div>
                                                                </el-col>    
                                                            </el-row>
                                                            <el-row :gutter="20">
                                                                <el-col :span="18" :offset="3">
                                                                    <el-button type="primary" plain class="button"  @click="onSubmitRecharge">立即充值</el-button>
                                                                </el-col>
                                                            </el-row>
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
                                                                        <el-input type="password" placeholder="请输入您的旧密码" v-model="ruleForm.LoginPassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
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
                                                                    <el-button type="primary" plain class="button" @click="change">确认修改密码</el-button>
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
                                                            <el-col :span="16" :offset="5" class="padding-left-0">
                                                                <el-upload 
                                                                action="http://127.0.0.1/node_yzlll/peanut/th5/public/personal/Personal/avatar" 
                                                                list-type="picture-card" 
                                                                :limit="1"
                                                                name="image"
                                                                :on-preview="handlePictureCardPreview" 
                                                                :on-remove="handleRemove"
                                                                :on-success="uploadSuccess">
                                                                    <i class="el-icon-plus" ></i>
                                                                </el-upload>
                                                                <el-dialog :visible.sync="dialogVisible">
                                                                    <img width="100%" :src="dialogImageUrl" alt="" >
                                                                </el-dialog>
                                                            </el-col>
                                                        </el-row>
                                                        <el-row :gutter="20">
                                                            <el-col :span="16" :offset="5">
                                                                <el-button type="primary" plain class="button_mt10px" @click="avatarClick">确认修改头像</el-button>
                                                            </el-col>
                                                        </el-row>
                                                    </el-collapse-item>
                                                    <!-- 修改性别 -->
                                                    <el-collapse-item name="5">
                                                        <template slot="title" v-if="userMessage.sex == '男'">
                                                            <el-link type="primary" :underline="false"><i class="el-icon-male font_size_20"></i></el-link>
                                                            <span class="text_color_2">修改性别</span>
                                                        </template>
                                                        <template slot="title" v-else>
                                                            <el-link type="danger" :underline="false"><i class="el-icon-female font_size_20"></i></el-link>
                                                            <span class="text_color_2">修改性别</span>
                                                        </template>
                                                        <el-select v-model="value" clearable placeholder="请选择">
                                                            <el-option value="女">
                                                                <el-link type="danger" :underline="false">
                                                                    <i class="el-icon-female font_size_20"></i>
                                                                </el-link>
                                                            </el-option>
                                                            <el-option value="男">
                                                                <el-link type="primary" :underline="false">
                                                                    <i class="el-icon-male font_size_16"></i>
                                                                </el-link>
                                                            </el-option>
                                                        </el-select>
                                                        <el-row :gutter="20">
                                                            <el-col :span="18" :offset="0" class="padding-left-0">
                                                                <el-button type="primary" plain class="button_mt10px" @click="gender">确认修改性别</el-button>
                                                            </el-col>
                                                        </el-row>
                                                    </el-collapse-item>
                                                    <!-- 修改地址 -->
                                                    <el-collapse-item name="6">
                                                        <template slot="title">
                                                            <i class="el-icon-location font_size_20"></i><span class="text_color_2">修改地址</span>
                                                        </template>
                                                        <!-- 详细地址 -->
                                                        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                                                            <el-row :gutter="24">
                                                                <el-col :span="24" :offset="0">
                                                                    <div class="grid-content bg-purple">
                                                                        <el-form-item prop="address">
                                                                            <el-input type="text" placeholder="请输入详细地址" v-model="ruleForm.address" maxlength="30" show-word-limit onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')">
                                                                                <i slot="prefix" class="el-input__icon el-icon-location-outline"></i>
                                                                            </el-input>
                                                                        </el-form-item>
                                                                    </div>
                                                                </el-col>    
                                                            </el-row>
                                                            <el-row :gutter="24">
                                                                <el-col :span="24" :offset="0">
                                                                    <el-button type="primary" plain @click="addressClick">确认修改地址</el-button>
                                                                </el-col>
                                                            </el-row>
                                                        </el-form>
                                                    </el-collapse-item>
                                                    <!-- 修改充值密码 -->
                                                    <el-collapse-item name="7">
                                                        <template slot="title" >
                                                            <i class="el-icon-edit font_size_20"></i><span class="text_color_2">修改充值密码</span>
                                                        </template>
                                                        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                                                            <el-row :gutter="20">
                                                                <el-col :span="18" :offset="3">
                                                                    <el-form-item prop="NewRechargePassword">
                                                                        <el-input type="password" placeholder="充值密码6~9位" v-model="ruleForm.NewRechargePassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                                                                            <i slot="prefix" class="el-input__icon el-icon-unlock"></i>
                                                                        </el-input>
                                                                    </el-form-item>
                                                                </el-col>
                                                            </el-row>
                                                            <el-row :gutter="20">
                                                                <el-col :span="18" :offset="3">
                                                                    <el-button type="primary" plain class="button" @click="rechargeButtonClick">修改充值密码</el-button>
                                                                </el-col>
                                                            </el-row>
                                                        </el-form>
                                                    </el-collapse-item>
                                                </el-collapse>
                                            </div>
                                        </div>
                                    </el-col>
                                </el-row>
                            </el-tab-pane>
                            <!-- 我的收藏 v-if-->
                            <el-tab-pane v-if="this.collection == ''">
                                <span slot="label"><i class="el-icon-star-off"></i>我的收藏</span>
                                <div style="height: 576px;">
                                    <p style="text-align:center;margin-top: 10px;">
                                        <img src="../../assets/peanutImg/noContent.png" alt="">
                                    </p>
                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">暂无收藏</el-link></p>
                                </div>
                            </el-tab-pane>
                            <!-- 我的收藏 v-else-->
                            <el-tab-pane v-else>
                                <span slot="label"><i class="el-icon-star-off"></i>我的收藏</span>
                                <el-collapse v-model="cerName" accordion v-for="(item,index) in collection" :key="index">
                                    <el-collapse-item :name="item.o_id">
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" style="border-radius: 50px;" :src="item.head_img" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">{{item.name}}</el-link>
                                        </template>
                                        <div>
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="text_f">
                                                        <el-link :underline="false">
                                                            <el-link type="info" :underline="false">
                                                                <i class="el-icon-star-on font_size_16"></i><span class="font_size_13 cursor_pointer" @click="cancel(item.collection_id,item.vehicle_id)">取消收藏</span>
                                                            </el-link>
                                                        </el-link>
                                                    </div>
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" :src="item.img" alt="">
                                                    </div>
                                                </div>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <div class="text_w_o_t font_size_15"> 
                                                            {{item.vehicle_name}}           
                                                        </div>
                                                    </div></el-col>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <div class="tag-group color_b4b3af">       
                                                            {{item.vehicle_time}} | <span>{{item.introduce}}</span>
                                                            <span> {{item.vehicle_distance}}万公里</span>
                                                        </div>
                                                    </div></el-col>
                                                    <el-col :span="12"><div class="grid-content bg-purple-light">
                                                        <el-link type="warning" :underline="false" class="font_weight">￥{{item.price}}万</el-link>
                                                        <el-tag type="danger" class="margin_b_10px cursor_pointer" @click="purchase(item.vehicle_id)"><i class="el-icon-bank-card font_size_16"></i> 点我立即购买</el-tag>
                                                    </div></el-col>
                                                </el-card>
                                            </el-col>
                                        </div>
                                    </el-collapse-item>
                                </el-collapse>
                            </el-tab-pane>
                            <!-- 我的消息 -->
                            <el-tab-pane>
                                <span slot="label"><el-badge value="new" class="item"><i class="el-icon-chat-dot-round"></i>我的消息</el-badge></span>
                                <div style="height: 576px;">
                                    <p style="text-align:center;margin-top: 10px;">
                                        <img src="../../assets/peanutImg/noMessage.png" alt="">
                                    </p>
                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">暂无信息</el-link></p>
                                </div>       
                            </el-tab-pane>
                            <!-- 我发布的车车 -->
                            <el-tab-pane>
                                <span slot="label"><i class="el-icon-truck"></i> 我发布的车车</span>
                                <el-collapse v-model="cerCollection" accordion>
                                    <!-- 您发布的车车 v-if-->
                                    <div v-if="this.onTheShelf == '' && this.undercarriage == '' && this.atAuction == '' && this.auctioned == '' && this.notReviewed == '' ">
                                        <el-collapse-item name="1">
                                            <template slot="title">
                                                <i class="el-icon-upload font_size_20"></i>
                                                <span class="text_color_2">您发布的车车</span>
                                            </template>
                                            <div style="height: 501px;">
                                                <p style="text-align:center;margin-top: 10px;">
                                                    <img src="../../assets/peanutImg/release.png" alt="">
                                                </p>
                                                <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">未发布车车</el-link></p>
                                            </div>
                                        </el-collapse-item>
                                    </div>
                                    <div v-else>
                                        <!-- 上架的车 -->
                                        <div v-if="this.onTheShelf == ''">
                                            <el-collapse-item name="1">
                                                <template slot="title">
                                                    <el-link type="danger" :underline="false"><i class="el-icon-lollipop font_size_20"></i><span class="text_color_2">您已上架的车车</span></el-link>
                                                </template>
                                                <div style="height: 285px;">
                                                    <p style="text-align:center;margin-top: 10px;">
                                                        <img src="../../assets/peanutImg/release.png" alt="">
                                                    </p>
                                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">没有已上架的车车</el-link></p>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 上架的车 -->
                                        <div v-else>
                                            <el-collapse-item name="1">
                                                <template slot="title">
                                                    <el-link type="danger" :underline="false"><i class="el-icon-lollipop font_size_20"></i><span class="text_color_2">您已上架的车车</span></el-link>
                                                </template>
                                                <div v-for="(release,releaseIndex) in onTheShelf" :key="releaseIndex">
                                                    <el-col :span="24" class="margin_10px">
                                                        <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                        <div class="img_text_div">
                                                            <div class="img_120px_f">
                                                                <img  class="img_100" :src="release.img" alt="">
                                                            </div>
                                                        </div>
                                                            <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                            <div class="text_w_o_t font_size_13"> 
                                                                {{release.vehicle_name}}          
                                                            </div>
                                                            <div class="height_20px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{release.vehicle_distance}}公里
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{release.introduce}}
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                                    ￥{{release.price}}万
                                                                </div>     
                                                            </div>
                                                            <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                                    <i class="el-icon-time font_size_13"></i> {{release.vehicle_time}}  
                                                                </div>
                                                                <div v-if="release.vehicle_state == '已上架'">
                                                                    <el-link type="danger" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                        {{release.vehicle_state}}
                                                                    </div></el-link>
                                                                </div>
                                                            </div></el-col>
                                                        </div></el-col>
                                                        </el-card>
                                                    </el-col>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 下架的车 -->
                                        <div v-if="this.undercarriage == ''">
                                            <el-collapse-item name="2">
                                                <template slot="title">
                                                    <el-link type="info" :underline="false"><i class="el-icon-sugar font_size_20"></i><span class="text_color_2">您已下架的车车</span></el-link>
                                                </template>
                                                <div style="height: 285px;">
                                                    <p style="text-align:center;margin-top: 10px;">
                                                        <img src="../../assets/peanutImg/release.png" alt="">
                                                    </p>
                                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">没有已下架的车车</el-link></p>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 下架的车 -->
                                        <div v-else>
                                            <el-collapse-item name="2">
                                                <template slot="title">
                                                    <el-link type="info" :underline="false"><i class="el-icon-sugar font_size_20"></i><span class="text_color_2">您已下架的车车</span></el-link>
                                                </template>
                                                        <div v-for="(undercarriage,undercarriageIndex) in undercarriage" :key="undercarriageIndex">
                                                    <el-col :span="24" class="margin_10px">
                                                        <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                        <div class="img_text_div">
                                                            <div class="img_120px_f">
                                                                <img  class="img_100" :src="undercarriage.img" alt="">
                                                            </div>
                                                        </div>
                                                            <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                            <div class="text_w_o_t font_size_13"> 
                                                                {{undercarriage.vehicle_name}}          
                                                            </div>
                                                            <div class="height_20px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{undercarriage.vehicle_distance}}公里
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{undercarriage.introduce}}
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                                    ￥{{undercarriage.price}}万
                                                                </div>     
                                                            </div>
                                                            <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                                    <i class="el-icon-time font_size_13"></i> {{undercarriage.vehicle_time}}  
                                                                </div>
                                                                <div v-if="undercarriage.vehicle_state == '已下架'">
                                                                    <el-link type="info" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                        {{undercarriage.vehicle_state}}
                                                                    </div></el-link>
                                                                </div>
                                                            </div></el-col>
                                                        </div></el-col>
                                                        </el-card>
                                                    </el-col>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 拍卖中的车 -->
                                        <div v-if="this.atAuction == ''">
                                            <el-collapse-item name="3">
                                                <template slot="title">
                                                    <el-link type="warning" :underline="false"><i class="el-icon-ice-cream-round font_size_20"></i><span class="text_color_2">您拍卖中的车车</span></el-link>
                                                </template>
                                                <div style="height: 285px;">
                                                    <p style="text-align:center;margin-top: 10px;">
                                                        <img src="../../assets/peanutImg/release.png" alt="">
                                                    </p>
                                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">没有拍卖中的车车</el-link></p>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 拍卖中的车 -->
                                        <div v-else>
                                            <el-collapse-item name="3">
                                                <template slot="title">
                                                    <el-link type="warning" :underline="false"><i class="el-icon-ice-cream-round font_size_20"></i><span class="text_color_2">您拍卖中的车车</span></el-link>
                                                </template>
                                                <div v-for="(atAuction,atAuctionIndex) in atAuction" :key="atAuctionIndex">
                                                    <el-col :span="24" class="margin_10px">
                                                        <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                        <div class="img_text_div">
                                                            <div class="img_120px_f">
                                                                <img  class="img_100" :src="atAuction.img" alt="">
                                                            </div>
                                                        </div>
                                                            <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                            <div class="text_w_o_t font_size_13"> 
                                                                {{atAuction.vehicle_name}}          
                                                            </div>
                                                            <div class="height_20px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{atAuction.vehicle_distance}}公里
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{atAuction.introduce}}
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                                    ￥{{atAuction.price}}万
                                                                </div>     
                                                            </div>
                                                            <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                                    <i class="el-icon-time font_size_13"></i> {{atAuction.vehicle_time}}  
                                                                </div>
                                                                <div v-if="atAuction.vehicle_state == '拍卖中'">
                                                                    <el-link type="warning" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                        {{atAuction.vehicle_state}}
                                                                    </div></el-link>
                                                                </div>
                                                            </div></el-col>
                                                        </div></el-col>
                                                        </el-card>
                                                    </el-col>
                                                </div>                                    
                                            </el-collapse-item>
                                        </div>
                                        <!-- 已拍卖的车 -->
                                        <div v-if="this.auctioned == ''">
                                            <el-collapse-item name="4">
                                                <template slot="title">
                                                    <el-link type="success" :underline="false"><i class="el-icon-ice-drink font_size_20"></i><span class="text_color_2">您已拍卖的车车</span></el-link>
                                                </template>
                                                <div style="height: 285px;">
                                                    <p style="text-align:center;margin-top: 10px;">
                                                        <img src="../../assets/peanutImg/release.png" alt="">
                                                    </p>
                                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">没有已拍卖的车车</el-link></p>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 已拍卖的车 -->
                                        <div v-else>
                                            <el-collapse-item name="4">
                                                <template slot="title">
                                                    <el-link type="success" :underline="false"><i class="el-icon-ice-drink font_size_20"></i><span class="text_color_2">您已拍卖的车车</span></el-link>
                                                </template>
                                                <div v-for="(auctioned,auctionedIndex) in auctioned" :key="auctionedIndex">
                                                    <el-col :span="24" class="margin_10px">
                                                        <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                        <div class="img_text_div">
                                                            <div class="img_120px_f">
                                                                <img  class="img_100" :src="auctioned.img" alt="">
                                                            </div>
                                                        </div>
                                                            <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                            <div class="text_w_o_t font_size_13"> 
                                                                {{auctioned.vehicle_name}}          
                                                            </div>
                                                            <div class="height_20px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{auctioned.vehicle_distance}}公里
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{auctioned.introduce}}
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                                    ￥{{auctioned.price}}万
                                                                </div>     
                                                            </div>
                                                            <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                                    <i class="el-icon-time font_size_13"></i> {{auctioned.vehicle_time}}  
                                                                </div>
                                                                <div v-if="auctioned.vehicle_state == '已拍卖'">
                                                                    <el-link type="success" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                        {{auctioned.vehicle_state}}
                                                                    </div></el-link>
                                                                </div>
                                                            </div></el-col>
                                                        </div></el-col>
                                                        </el-card>
                                                    </el-col>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 未审核的车 -->
                                        <div v-if="this.notReviewed == ''">
                                            <el-collapse-item name="5">
                                                <template slot="title">
                                                    <el-link type="primary" :underline="false"><i class="el-icon-milk-tea font_size_20"></i><span class="text_color_2">您未审核的车车</span></el-link>
                                                </template>
                                                <div style="height: 285px;">
                                                    <p style="text-align:center;margin-top: 10px;">
                                                        <img src="../../assets/peanutImg/release.png" alt="">
                                                    </p>
                                                    <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">没有未审核的车车</el-link></p>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                        <!-- 未审核的车 -->
                                        <div v-else>
                                            <el-collapse-item name="5">
                                                <template slot="title">
                                                    <el-link type="primary" :underline="false"><i class="el-icon-milk-tea font_size_20"></i><span class="text_color_2">您未审核的车车</span></el-link>
                                                </template>
                                                <div v-for="(notReviewed,notReviewedIndex) in notReviewed" :key="notReviewedIndex">
                                                    <el-col :span="24" class="margin_10px">
                                                        <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                        <div class="img_text_div">
                                                            <div class="img_120px_f">
                                                                <img  class="img_100" :src="notReviewed.img" alt="">
                                                            </div>
                                                        </div>
                                                            <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                            <div class="text_w_o_t font_size_13"> 
                                                                {{notReviewed.vehicle_name}}          
                                                            </div>
                                                            <div class="height_20px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{notReviewed.vehicle_distance}}公里
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                                    {{notReviewed.introduce}}
                                                                </div>
                                                                <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                                    ￥{{notReviewed.price}}万
                                                                </div>     
                                                            </div>
                                                            <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                                <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                                    <i class="el-icon-time font_size_13"></i> {{notReviewed.vehicle_time}}  
                                                                </div>
                                                                <div v-if="notReviewed.vehicle_state == '未审核'">
                                                                    <el-link type="primary" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                        {{notReviewed.vehicle_state}}
                                                                    </div></el-link>
                                                                </div>
                                                            </div></el-col>
                                                        </div></el-col>
                                                        </el-card>
                                                    </el-col>
                                                </div>
                                            </el-collapse-item>
                                        </div>
                                    </div>
                                </el-collapse>
                            </el-tab-pane>
                            <!-- 买卖记录 -->
                            <el-tab-pane>
                                <span slot="label"><i class="el-icon-notebook-2"></i> 买卖记录</span>
                                <el-collapse v-model="cerBusiness" accordion>
                                    <!-- 购买车辆 v-if-->
                                    <el-collapse-item name="1" v-if="this.peanutOrderAdd == ''">
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/gm.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">购买车辆</el-link>
                                        </template>
                                        <div style="height: 453px;">
                                            <p style="text-align:center;margin-top: 10px;">
                                                <img src="../../assets/peanutImg/vehicle.png" alt="">
                                            </p>
                                            <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">暂无购买车辆</el-link></p>
                                        </div>
                                    </el-collapse-item>
                                    <!-- 购买车辆 v-else-->
                                    <el-collapse-item name="1" v-else>
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/gm.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">购买车辆</el-link>
                                        </template>
                                        <div v-for="(order,orderIndex) in peanutOrderAdd" :key="orderIndex">
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" :src="order.img" alt="">
                                                    </div>
                                                </div>
                                                <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                    <div class="text_w_o_t font_size_13"> 
                                                        {{order.vehicle_name}}        
                                                    </div>
                                                    <div class="height_20px">
                                                        <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                            {{order.order_num}}
                                                        </div>
                                                        <div class="text_w_o_t font_size_11 color_b4b3af float_f"> 
                                                            {{order.introduce}}
                                                        </div>
                                                        <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                            ￥{{order.price}}万
                                                        </div>     
                                                    </div>
                                                    <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                        <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                            <i class="el-icon-time font_size_13"></i> {{order.transaction_time}}
                                                        </div>
                                                        <!-- 待验收 -->
                                                        <div v-if="order.o_state == '待验收'">
                                                            <el-link type="primary" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                {{order.o_state}}
                                                            </div></el-link>
                                                                <!-- 订单号,卖家id,买家id,车辆id -->
                                                                <el-tag type="primary" class="cursor_pointer" @click="primary(order.order_num,order.sell_id,order.buy_id,order.vehicle_id)">点我验收</el-tag>
                                                                <!-- 订单号,卖家id,买家id,车辆id -->
                                                                <el-tag type="danger" class="button_mt10px cursor_pointer" @click="danger(order.order_num,order.sell_id,order.buy_id,order.vehicle_id)">点我退货</el-tag>
                                                        </div>
                                                        <!-- 退款审核中 -->
                                                        <div v-if="order.o_state == '退款审核中'">
                                                            <el-link type="info" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                {{order.o_state}}
                                                            </div></el-link>
                                                                <!-- 订单号,卖家id,买家id,车辆id -->
                                                                <!-- <el-tag type="info" class="cursor_pointer" @click="info()">正在进行审核</el-tag> -->
                                                        </div>
                                                        <!-- 退款完成 -->
                                                        <div v-if="order.o_state == '退款完成'">
                                                            <el-link type="info" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                {{order.o_state}}
                                                            </div></el-link>
                                                        </div>
                                                        <!-- 待评价 -->
                                                        <div v-if="order.o_state == '待评价'">
                                                            <el-link type="warning" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                {{order.o_state}}
                                                            </div></el-link>
                                                                <!-- 订单号,卖家id,买家id,车辆id -->
                                                                <el-tag type="success" class="cursor_pointer" @click="successClick(order.order_num,order.sell_id,order.buy_id,order.vehicle_id)">完成购买</el-tag>
                                                                <!-- 订单号,卖家id,买家id,车辆id -->
                                                                <el-tag type="warning" class="button_mt10px cursor_pointer" @click="warning(order.order_num,order.sell_id,order.buy_id,order.vehicle_id)">点我评价</el-tag>
                                                        </div>
                                                        <!-- 交易完成 -->
                                                        <div v-if="order.o_state == '交易完成'">
                                                            <el-link type="success" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                                {{order.o_state}}
                                                            </div></el-link>
                                                        </div>
                                                    </div></el-col>
                                                </div></el-col>
                                                </el-card>
                                            </el-col>
                                        </div>
                                    </el-collapse-item>
                                    <!-- 卖出车辆 v-if-->
                                    <el-collapse-item name="2" v-if="this.sellvehicleAdd == ''">
                                        <template slot="title" >
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/mc.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">卖出车辆</el-link>
                                        </template>
                                        <div style="height: 453px;">
                                            <p style="text-align:center;margin-top: 10px;">
                                                <img src="../../assets/peanutImg/sellingCars.png" alt="">
                                            </p>
                                            <p style="text-align:center;margin-top: 10px;"><el-link type="info" style="font-size: 30px;">暂无卖出车辆</el-link></p>
                                        </div>
                                    </el-collapse-item>
                                    <!-- 卖出车辆 v-else-->
                                    <el-collapse-item name="2" v-else>
                                        <template slot="title">
                                            <img  class="img_20px_m10px" src="../../assets/peanutImg/mc.png" alt=""><el-link type="_blank" :underline="false" class=" text_color_2">卖出车辆</el-link>
                                        </template>
                                        <div v-for="(sellvehicle,sellIndex) in sellvehicleAdd" :key="sellIndex">
                                            <el-col :span="24" class="margin_10px">
                                                <el-card :body-style="{ padding: '10px'}" shadow="hover">
                                                <div class="img_text_div">
                                                    <div class="img_120px_f">
                                                        <img  class="img_100" :src="sellvehicle.img" alt="">
                                                    </div>
                                                </div>
                                                <el-col :span="12"><div class="grid-content bg-purple-light margin_b_10px">
                                                    <div class="text_w_o_t font_size_13"> 
                                                        {{sellvehicle.vehicle_name}}         
                                                    </div>
                                                    <div class="height_20px">
                                                        <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                            <el-link type="success" :underline="false" class="font_size_11">买家: {{sellvehicle.name}}</el-link>
                                                        </div>
                                                        <div class="text_w_o_t font_size_11 color_b4b3af float_f margin_right_10px"> 
                                                            {{sellvehicle.introduce}}
                                                        </div>
                                                        <div class="text_w_o_t font_size_11 color_ffb800 float_f"> 
                                                            ￥{{sellvehicle.price}}万
                                                        </div>
                                                    </div>
                                                    <el-col :span="24" class="padding-left-0"><div class="grid-content bg-purple-light margin_b_10px">
                                                        <div class="text_w_o_t font_size_11 color_b4b3af"> 
                                                            <i class="el-icon-time font_size_13"></i> {{sellvehicle.transaction_time}}  
                                                        </div>
                                                        <el-link type="success" :underline="false"><div class="text_w_o_t font_size_11"> 
                                                            {{sellvehicle.o_state}}
                                                        </div></el-link>
                                                    </div></el-col>
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
        <!-- 修改名字-->
        <el-drawer :visible.sync="modifyName" :direction="directionName" :before-close="handleClose">
            <div class="demo-drawer__content">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                    <el-row :gutter="20">
                        <el-col :span="18" :offset="3">
                            <div class="grid-content bg-purple">
                                <el-form-item label="请输入新的名字" prop="name">
                                    <el-form-item prop="name">
                                        <el-input type="text" placeholder="请输入名称5位中英数字都可以" v-model="ruleForm.name" maxlength="5" show-word-limit onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')">
                                        <i slot="prefix" class="el-input__icon el-icon-user"></i>
                                        </el-input>
                                    </el-form-item>
                                </el-form-item>
                            </div>
                            <div class="demo-drawer__footer button_mb10px">
                                <el-button type="primary" @click="modifyNameClick()" :loading="loadingName">{{ loadingName ? '正在修改 ...' : '确定修改' }}</el-button>
                            </div>
                        </el-col>
                    </el-row>
                </el-form>
            </div>
        </el-drawer>
        <!-- 输入充值密码 -->
        <el-drawer :visible.sync="onSubmit" :direction="direction" :before-close="handleClose">
            <div class="demo-drawer__content">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                    <el-row :gutter="20">
                        <el-col :span="18" :offset="3">
                            <div v-if="userMessage.recharge == ''">
                                <el-tag type="danger" class="textCentered">请先设置充值密码</el-tag>
                            </div>
                            <div v-else>
                                <div class="grid-content bg-purple">
                                    <el-form-item label="请输入充值密码" prop="rechargePassword">
                                        <el-input type="password" placeholder="充值密码" v-model="ruleForm.rechargePassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                                        <i slot="prefix" class="el-input__icon el-icon-unlock"></i>
                                        </el-input>
                                    </el-form-item>
                                </div>
                                <div class="demo-drawer__footer button_mb10px">
                                    <el-button type="primary" @click="onSubmitClick()" :loading="loading">{{ loading ? '正在充值 ...' : '确 定' }}</el-button>
                                </div>
                            </div>
                        </el-col>
                    </el-row>
                </el-form>
            </div>
        </el-drawer>
        <!-- 修改新的充值密码 -->
        <el-drawer :visible.sync="rechargeButton" :direction="directionttb" :before-close="handleClose">
            <div class="demo-drawer__content">
                <el-form :model="form">
                    <el-row :gutter="20">
                        <el-col :span="18" :offset="3">
                            <div class="grid-content bg-purple">
                                <el-form-item prop="LoginAccount">
                                    <el-input type="text" placeholder="请输入您的账号" v-model="ruleForm.rechargeLoginAccount" maxlength="11" show-word-limit onkeyup="this.value=this.value.replace(/\D/g,'')">
                                        <i slot="prefix" class="el-input__icon el-icon-key"></i>
                                    </el-input>
                                </el-form-item>
                            </div>
                        </el-col>    
                    </el-row>
                    <el-row :gutter="20">
                        <el-col :span="18" :offset="3">
                            <el-form-item prop="LoginPassword">
                                <el-input type="password" placeholder="请输入您的密码" v-model="ruleForm.rechargeLoginPassword" autocomplete="off" show-password onKeyUp="value=value.replace(/[\W]/g,'')">
                                    <i slot="prefix" class="el-input__icon el-icon-lock"></i>
                                </el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row :gutter="20">
                        <el-col :span="18" :offset="3">
                            <div class="demo-drawer__footer button_mb10px">
                                <el-button type="primary" @click="rechargeClick()" :rechargeing="rechargeing">{{ rechargeing ? '正在修改充值密碼 ...' : '确 定' }}</el-button>
                            </div>
                        </el-col>
                    </el-row>
                </el-form>
            </div>
        </el-drawer>
        <!-- 输入评价信息 -->
        <el-drawer :visible.sync="evaluate" :direction="evaluatedirection" :before-close="handleClose">
            <div class="demo-drawer__content">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" class="demo-ruleForm">
                    <el-row :gutter="20">
                        <el-col :span="18" :offset="3">
                            <el-rate
                                v-model="value3"
                                :colors="colors">
                            </el-rate>
                            <div class="grid-content bg-purple button_mt10px2">
                                <el-form-item prop="evaluateContent">
                                    <el-input type="text" placeholder="请输入您的评价内容" v-model="ruleForm.evaluateContent" maxlength="60" show-word-limit onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5，。：！？,.:!?~·_+=/、@‘’“”'';；]/g, '')">
                                        <i slot="prefix" class="el-input__icon el-icon-message"></i>
                                    </el-input>
                                </el-form-item>
                            </div>
                            <div class="demo-drawer__footer button_mb10px">
                                <el-button type="warning" @click="evaluateClick()" :loading="evaluateloading">{{ evaluateloading ? '正在发布评价 ...' : '确定发布' }}</el-button>
                            </div>
                        </el-col>
                    </el-row>
                </el-form>
            </div>
        </el-drawer>
    </div>
</template>

<script>
import {getData , sendParam} from "../../network/home"
const store = () => import('../../store/index')

var phone = /^1[3456789]\d{9}P$/; //手机号
var account=/^\d{11}$/; //账号
var password=/^[0-9a-zA-Z]{10,18}$/; //密码
var rechargePasswordAdd=/^[0-9a-zA-Z]{6,9}$/; //充值密码
var money = /^\d{1,100}$/; //充值

export default {
    name: 'PersonalContent',
    data() {
        //修改名字
        var validateName = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入新的名称'));
            }
        };
        //修改
        var validateAcco = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的账号'));
            }
        };
        //修改
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的密码'));
            }
        };
        //修改
        var validateNpas = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的新密码'));
            }
        };
        //充值
        var validateRech = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的充值密码'));
            }else if(value.match(rechargePasswordAdd) == null){
                callback(new Error('充值密码格式不正确'));
            }
        };
        //新充值密码
        var validateNew = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您新的充值密码'));
            }else if(value.match(rechargePasswordAdd) == null){
                callback(new Error('充值密码6~9位'));
            }
        };
        //登录账号（充值）
        var validaterLA = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的登录账号'));
            }
        };
        //登录密码（充值）
        var validaterLP = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的登录密码'));
            }
        };
        //充值金额
        var validaterMoney = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您的充值金额'));
            }else if(value.match(money) == null) {
                callback(new Error('请输入1~10位金额'));
            }
        };
        //修改地址
        var validaterAdd = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您要修改的地址'));
            }
        };
        //输入评价内容
        var validaterEva = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入您宝贵的评价'));
            }
        };
        return {
            //已上架
            onTheShelf: '',
            //已下架
            undercarriage: '',
            //拍卖中
            atAuction: '',
            //已拍卖
            auctioned: '',
            //未审核
            notReviewed: '',
            //卖出车
            sellvehicleAdd: '',
            value3: null,
            colors: ['#99A9BF', '#F7BA2A', '#FF9900'],  // 等同于 { 2: '#99A9BF', 4: { value: '#F7BA2A', excluded: true }, 5: '#FF9900' }
            //订单号,卖家id,买家id,车辆id
            order_num: '',
            sell_id: '',
            buy_id: '',
            vehicle_id: '',
            //
            lastImgUrl: '',
            dialogImageUrl: '',
            dialogVisible: false,
            //修改名字
            modifyName: false,
            directionName: 'ttb',
            loadingName: false,
            //输入充值密码
            onSubmit: false,
            direction: 'ttb',
            loading: false,
            //输入评价信息
            evaluate: false,
            evaluatedirection: 'ttb',
            evaluateloading: false,
            //修改新的充值密码
            rechargeButton: false,
            directionttb: 'ttb',
            rechargeing: false,
            //用户的信息
            userMessage:[],

            active: 0,
            value1: '',
            value: '',
            //收藏
            collection: [],
            //买车
            peanutOrderAdd:[],
            activeName: ['1'],
            cerName:['1'],
            cerCollection:['1'],
            cerBusiness:['1'],
            customColor: [
                {color: '#014289', percentage: 20},
                {color: '#006FAF', percentage: 40},
                {color: '#009AC0', percentage: 60},
                {color: '#00CCBC', percentage: 80},
                {color: '#60F3AB', percentage: 100}
            ],
            form: {
                region: '',
                date1: '',
                date2: '',
                delivery: false,
                type: [],
                resource: '',
                desc: ''
            },
            ruleForm: {
                //修改名字
                name: '',
                //修改密码的三个内容
                LoginAccount: '',
                LoginPassword: '',
                NewPassword: '',
                //充值密码
                rechargePassword: '',
                //新的充值密码
                NewRechargePassword: '',
                //登录账号
                rechargeLoginAccount: '',
                //登录密码
                rechargeLoginPassword: '',
                //充值金额
                rechargeMoney: '',
                //修改地址
                address: '',
                //输入评价内容
                evaluateContent: ''
            },
            rules: {
                name: [
                    { validator: validateName, trigger: 'blur' }
                ],
                //修改密码的三个内容
                LoginAccount: [
                    { validator: validateAcco, trigger: 'blur' }
                ],
                LoginPassword: [
                    { validator: validatePass, trigger: 'blur' }
                ],
                NewPassword: [
                    { validator: validateNpas, trigger: 'blur' }
                ],
                //充值密码
                rechargePassword: [
                    { validator: validateRech, trigger: 'blur' }
                ],
                //新的充值密码
                NewRechargePassword: [
                    { validator: validateNew, trigger: 'blur' }
                ],
                //登录账号
                rechargeLoginAccount: [
                    { validator: validaterLA, trigger: 'blur' }
                ],
                //登录密码
                rechargeLoginPassword: [
                    { validator: validaterLP, trigger: 'blur' }
                ],
                //充值金额
                rechargeMoney: [
                    { validator: validaterMoney, trigger: 'blur' }
                ],
                //修改地址
                address: [
                    { validator: validaterAdd, trigger: 'blur' }
                ],
                //输入评价内容
                evaluateContent: [
                    { validator: validaterEva, trigger: 'blur' }
                ]
            }
        }
    },
    //开局
    mounted(){
        //用户信息
        this.userAdd();
        //用户收藏
        this.userCollection();
        //已上架
        this.userOnTheShelf();
        //已下架
        this.userUndercarriage();
        //拍卖中
        this.userAtAuction();
        //已拍卖
        this.userAuctioned();
        //未审核
        this.userNotReviewed();
        //用户买车
        this.peanutOrder();
        //用户卖车
        this.sellingCars();
    },
    methods: {
        //打印用户信息
        userAdd(){
            //开局验证
            let url = '/personal/Personal/personal';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                // let user = JSON.parse(res.data.data);
                // console.log(user["id"]);
                // localStorage.setItem('userId',user["id"]);
                if(res.data.code==1){
                    let userContent = res.data.data;
                    this.userMessage = userContent;
                }else{
                    //无账号失败返回
                    this.$message({
                        message: res.data.msg,
                        type: 'warning',
                        center: true
                    });
                    this.$router.push("/");
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印用户个人收藏
        userCollection(){
            //开局验证
            let url = '/personal/Personal/collection';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.collection = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印已上架车辆
        userOnTheShelf(){
            //开局验证
            let url = '/personal/Personal/userOnTheShelf';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.onTheShelf = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印已下架车辆
        userUndercarriage(){
            //开局验证
            let url = '/personal/Personal/userUndercarriage';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.undercarriage = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印拍卖中车辆
        userAtAuction(){
            //开局验证
            let url = '/personal/Personal/userAtAuction';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.atAuction = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印已拍卖车辆
        userAuctioned(){
            //开局验证
            let url = '/personal/Personal/userAuctioned';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.auctioned = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印未审核车辆
        userNotReviewed(){
            //开局验证
            let url = '/personal/Personal/userNotReviewed';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.notReviewed = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印用户买的车
        peanutOrder(){
            //开局验证
            let url = '/personal/Personal/peanutOrder';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.peanutOrderAdd = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //打印用户卖的车
        sellingCars(){
            //开局验证
            let url = '/personal/Personal/sellingCars';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.sellvehicleAdd = res.data.data;
                }else{
                    
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //修改名字
        changeName(){
            this.modifyName = true;
        },
        //真.修改名字
        modifyNameClick(){
            if(this.ruleForm.name == ''){
                this.$message.error({
                    message: '未输入新的名字',
                    center: true
                });
            }else if(this.userMessage.name == this.ruleForm.name){
                this.$message.error({
                    message: '与旧名字相同,无法修改',
                    center: true
                });
            }else{
                //显示正在发布评价中
                this.loadingName = true;
                //真.修改名字
                let url = '/personal/Personal/modifyNameClick';
                // console.log(this.$store.state.UserToken);
                //给php发送内容
                let data = {
                    id:this.userMessage.id,
                    name:this.ruleForm.name
                };
                sendParam(url, data).then(res => {
                    if(res.data.code==1){
                        this.userMessage.name = res.data.data;
                        this.timer = setTimeout(() => {
                            // 动画关闭需要一定的时间
                            setTimeout(() => {
                                //关闭正在发布评价中，按钮字变成回原来字迹
                                this.loadingName = false;                           
                            }, 400);
                            //自动关闭修改名字框
                            this.modifyName = false;
                        }, 2000);
                        //修改成功返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        this.timer = setTimeout(() => {
                        // 动画关闭需要一定的时间
                            setTimeout(() => {
                                this.loadingName = false;
                            }, 400);
                        }, 2000);
                        //修改失败返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err);
                })
            }
        },
        //待验收(订单号,卖家id,买家id,车辆id)
        primary(order_num,sell_id,buy_id,vehicle_id){
            //开局验证
            let url = '/personal/Personal/primary';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token,
                order_num:order_num,
                sell_id:sell_id,
                buy_id:buy_id,
                vehicle_id:vehicle_id
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.peanutOrderAdd = res.data.data;
                    //修改成功返回
                    this.$message({
                        message: res.data.msg,
                        type: 'success',
                        center: true
                    });
                }else{
                    //修改失败返回
                    this.$message({
                        message: res.data.msg,
                        type: 'warning',
                        center: true
                    });
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //退货(订单号,卖家id,买家id,车辆id)
        danger(order_num,sell_id,buy_id,vehicle_id){
            //退货
            let url = '/personal/Personal/danger';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token,
                order_num:order_num,
                sell_id:sell_id,
                buy_id:buy_id,
                vehicle_id:vehicle_id
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.peanutOrderAdd = res.data.data;
                    //退货成功返回
                    this.$message({
                        message: res.data.msg,
                        center: true
                    });
                }else{
                    //退货失败返回
                    this.$message({
                        message: res.data.msg,
                        type: 'warning',
                        center: true
                    });
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //待评价(订单号,卖家id,买家id,车辆id)
        warning(order_num,sell_id,buy_id,vehicle_id){
            this.order_num = order_num;
            this.sell_id = sell_id;
            this.buy_id = buy_id;
            this.vehicle_id = vehicle_id;
            //显示评价框
            this.evaluate = true;
        },
        //发布评价
        evaluateClick(){
            console.log(this.value3);
            //(订单号,卖家id,买家id,车辆id);
            console.log(this.order_num,this.sell_id,this.buy_id,this.vehicle_id);
            //评价
            let url = '/personal/Personal/evaluateClick';
            let token = localStorage.getItem("tokenVue");
            if(this.value3 == ''){
                this.$message.error({
                    message: '未选择评价等级',
                    center: true
                });
            }else if(this.ruleForm.evaluateContent == ''){
                this.$message.error({
                    message: '请输入评价内容',
                    center: true
                });
            }else{
                //给php发送内容
                let data = {
                    token:token,
                    order_num:this.order_num,
                    sell_id:this.sell_id,
                    buy_id:this.buy_id,
                    vehicle_id:this.vehicle_id,
                    content:this.ruleForm.evaluateContent,
                    comment_num:this.value3
                };
                sendParam(url, data).then(res => {
                    //显示正在发布评价中
                    this.evaluateloading = true;
                    this.timer = setTimeout(() => {
                        // 动画关闭需要一定的时间
                        setTimeout(() => {
                            //关闭正在发布评价中，按钮字变成回原来字迹
                            this.evaluateloading = false;                           
                        }, 400);
                        //自动关闭评价框
                        this.evaluate = false;
                    }, 2000);
                    if(res.data.code==1){
                        this.peanutOrderAdd = res.data.data;
                        //发布评价返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        //发布评价返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err);
                })
            }
        },
        //完成交易(订单号,卖家id,买家id,车辆id)
        successClick(order_num,sell_id,buy_id,vehicle_id){
            //完成
            let url = '/personal/Personal/successClick';
            let token = localStorage.getItem("tokenVue");
            // console.log(this.$store.state.UserToken);
            //给php发送内容
            let data = {
                token:token,
                order_num:order_num,
                sell_id:sell_id,
                buy_id:buy_id,
                vehicle_id:vehicle_id
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.peanutOrderAdd = res.data.data;
                    //完成成功返回
                    this.$message({
                        message: res.data.msg,
                        type: 'success',
                        center: true
                    });
                }else{
                    //完成失败返回
                    this.$message({
                        message: res.data.msg,
                        type: 'warning',
                        center: true
                    });
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //判断有无输入充值金额
        onSubmitRecharge(){
            if(this.ruleForm.rechargeMoney == ''){
                this.$message.error({
                    message: '未输入充值金额',
                    center: true
                });
            }else if(this.ruleForm.rechargeMoney.match(money) == null){
                this.$message({
                    message: '请输入1~10位金额',
                    type: 'warning',
                    center: true
                });
            }else{
                //用户信息
                this.userAdd();
                //显示输入充值密码框
                this.onSubmit = true;
            }
        },
        //充值显示判断输入密码按钮
        onSubmitClick() {
            if(this.ruleForm.rechargePassword == ''){
                this.$message.error({
                    message: '未输入充值密码',
                    center: true
                });
            }else if(this.ruleForm.rechargePassword.match(rechargePasswordAdd) == null){
                this.$message({
                    message: '充值密码格式不正确',
                    type: 'warning',
                    center: true
                });
            }else{
                //充值
                let url = '/personal/Personal/onSubmitClick';
                let token = localStorage.getItem("tokenVue");
                //给php发送内容
                let data = {
                    recharge:this.ruleForm.rechargePassword,
                    money:this.ruleForm.rechargeMoney,
                    token:token
                };
                sendParam(url, data).then(res => {
                    if(res.data.code==1){
                        this.userMessage.money = res.data.data;
                        this.loading = true;
                        this.timer = setTimeout(() => {
                            // 动画关闭需要一定的时间
                            setTimeout(() => {
                                this.loading = false;
                            }, 400);
                            //自动关闭
                            this.onSubmit = false;
                        }, 2000);
                        //充值成功返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        this.loading = true;
                        this.timer = setTimeout(() => {
                            // 动画关闭需要一定的时间
                            setTimeout(() => {
                                this.loading = false;
                            }, 400);
                        }, 2000);
                        //充值失败返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err);
                })   
            }  
        },
        //
        handleClose(done) {
            done();       
        },
        //点击收藏跳转
        purchase(vehicleId){
            console.log(vehicleId);
            this.$router.push({ name: "Detail", query: { vehicleID: vehicleId } });
        },
        //点击取消收藏
        cancel(collectionId,vehicleId){
            console.log(collectionId);
            console.log(vehicleId);
            //取消收藏
            let url = '/personal/Personal/cancel';
            let token = localStorage.getItem("tokenVue");
            //给php发送内容
            let data = {
                collection_id:collectionId,
                vehicle_id:vehicleId,
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.collection = res.data.data;
                    //取消成功返回
                    this.$message({
                        message: res.data.msg,
                        type: 'success',
                        center: true
                    });
                }else{
                    //取消失败返回
                    this.$message({
                        message: res.data.msg,
                        type: 'warning',
                        center: true
                    });
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        //判断有无输入充值密码
        rechargeButtonClick(){
            //充值密码未输入
            if(this.ruleForm.NewRechargePassword == ''){
                this.$message.error({
                    message: '未输入新的充值密码',
                    center: true
                });
            //充值密码正则判断
            }else if(this.ruleForm.NewRechargePassword.match(rechargePasswordAdd) == null){
                this.$message({
                    message: '充值密码6~9位!',
                    type: 'warning',
                    center: true
                });
            }else{
                this.rechargeButton = true;
            }
        },
        //修改充值密码
        rechargeClick(){
            this.rechargeing = true;
            if(this.ruleForm.rechargeLoginAccount == '' || this.ruleForm.rechargeLoginPassword == ''){
                this.$message.error({
                    message: '未输入修改充值的所需内容',
                    center: true
                });
            //正则判断
            }else if(this.ruleForm.rechargeLoginAccount.match(account) == null || this.ruleForm.rechargeLoginPassword.match(password) == null){
                this.$message({
                    message: '所需内容格式错误',
                    type: 'warning',
                    center: true
                });
            }else{              
                //修改支付密码
                let url = '/personal/Personal/rechargeClick';
                let token = localStorage.getItem("tokenVue");
                //给php发送内容
                let data = {
                    acc:this.ruleForm.rechargeLoginAccount,
                    password:this.ruleForm.rechargeLoginPassword,
                    recharge:this.ruleForm.NewRechargePassword,
                    token:token
                };
                sendParam(url, data).then(res => {
                    
                    if(res.data.code==1){
                        this.timer = setTimeout(() => {
                        // 动画关闭需要一定的时间
                            setTimeout(() => {
                                this.rechargeing = false;
                            }, 400);
                            //自动关闭
                            this.rechargeButton = false;
                        }, 2000);
                        //修改成功返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        this.timer = setTimeout(() => {
                        // 动画关闭需要一定的时间
                            setTimeout(() => {
                                this.rechargeing = false;
                            }, 400);
                        }, 2000);
                        //修改失败返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err);
                })   
            }  
        },
        //修改密码
        change() {
            //判断所有内容不能为空
            if(this.ruleForm.LoginAccount == '' || this.ruleForm.LoginPassword == '' || this.ruleForm.NewPassword == ''){
                this.$message.error({
                    message: '未输入修改密码的所需内容',
                    center: true
                });
            //修改所需内容格式不正确
            }else if(this.ruleForm.LoginAccount.match(account) == null || this.ruleForm.LoginPassword.match(password) == null || this.ruleForm.NewPassword.match(password) == null){
                this.$message({
                    message: '所需内容格式错误',
                    type: 'warning',
                    center: true
                });
            }else {
                //修改密码
                let url = '/personal/Personal/change';
                let token = localStorage.getItem("tokenVue");
                //给php发送内容
                let data = {
                    acc:this.ruleForm.LoginAccount,
                    password:this.ruleForm.LoginPassword,
                    newPassword:this.ruleForm.NewPassword,
                    token:token
                };
                sendParam(url, data).then(res => {
                    if(res.data.code==1){
                        //修改成功返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        //修改失败返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err)
                })
            }
        }, 
        //修改性别
        gender() {
            if(this.value == ''){
                this.$message.error({
                    message: '请选择修改性别',
                    center: true
                });
            }else{
                //修改性别
                let url = '/personal/Personal/gender';
                let token = localStorage.getItem("tokenVue");
                //给php发送内容
                let data = {
                    sex:this.value,
                    token:token
                };
                sendParam(url, data).then(res => {
                    if(res.data.code==1){
                        this.userMessage.sex = res.data.data
                        //修改成功返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        //修改失败返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err)
                }) 
            }
        },
        //修改地址
        addressClick() {
            if(this.ruleForm.address == ''){
                this.$message.error({
                    message: '未输入修改地址的内容',
                    center: true
                });
            }else{
                //修改地址
                let url = '/personal/Personal/address';
                let token = localStorage.getItem("tokenVue");
                //给php发送内容
                let data = {
                    add:this.ruleForm.address,
                    token:token
                };
                sendParam(url, data).then(res => {
                    this.userMessage.add = res.data.data
                    if(res.data.code==1){
                        //修改成功返回
                        this.$message({
                            message: res.data.msg,
                            type: 'success',
                            center: true
                        });
                    }else{
                        //修改失败返回
                        this.$message({
                            message: res.data.msg,
                            type: 'warning',
                            center: true
                        });
                    }
                }).catch(err => {
                    //异常返回
                    console.log(err);
                })
            }
        },
        //修改头像
        avatarClick() {
            //修改地址
            let url = '/personal/Personal/avatarClick';
            let token = localStorage.getItem("tokenVue");
            //给php发送内容
            let data = {
                head_img:this.lastImgUrl,
                token:token
            };
            sendParam(url, data).then(res => {
                if(res.data.code==1){
                    this.userMessage.head_img = res.data.data;
                    //修改成功返回
                    this.$message({
                        message: res.data.msg,
                        type: 'success',
                        center: true
                    });
                }else{
                    //修改失败返回
                    this.$message({
                        message: res.data.msg,
                        type: 'warning',
                        center: true
                    });
                }
            }).catch(err => {
                //异常返回
                console.log(err);
            })
        },
        handleChange(val) {
            console.log(val);
        },
        format(percentage) {
            return percentage === 100 ? '满信誉' : `${percentage}分`;
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
        // 图片上传成功后取到地址
        uploadSuccess(response, file, fileList) {
            this.lastImgUrl = response;
        },
        next() {
            if (this.active++ > 2) this.active = 0;
        }
    }
}
</script>

<style scoped>
.textCentered{
    text-align:center !important; 
    width: 100% !important;
    margin-bottom: 25px !important;
}
.cursor_pointer{
    cursor: pointer !important;
}
.float_f{
    float: left;
}
.button{
    width: 100% !important;
}
.padding-left-0{
    padding-left: 0px !important;
}
.button_mt10px{
    margin: 10px 0 0 0;
}
.button_mt10px2{
    margin-top: 10px !important;
}
.button_mb10px{
    margin-bottom: 10px !important;  
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
<style>
#PersonalContent .el-row{
    width: 100%;
    margin-left: 0px !important;
}
#PersonalContent .el-upload__input{
    display: none;
}
#PersonalContent .el-drawer__header{
    margin-bottom: 0px;
}
#PersonalContent .el-drawer{
  height: auto !important;
}
#PersonalContent .el-tabs__content{
    height: 667px;
    overflow-y: auto;
}
#PersonalContent .el-tabs__content::-webkit-scrollbar {/*滚动条整体样式*/
    width: 4px;     /*高宽分别对应横竖滚动条的尺寸*/
    height: 4px;
    scrollbar-arrow-color:red;
}
#PersonalContent .el-tabs__content::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
    border-radius: 5px;
    -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
    background: rgba(0,0,0,0.2);
    scrollbar-arrow-color:red;
}
#PersonalContent .el-tabs__content::-webkit-scrollbar-track {/*滚动条里面轨道*/
    -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
    border-radius: 0;
    background: rgba(0,0,0,0.1);
}
#PersonalContent .el-collapse-item__header{
    border-bottom: 0px solid #EBEEF5;
}
#PersonalContent .el-collapse-item__wrap{
    border-bottom: 0px solid #EBEEF5;
}
#PersonalContent .el-collapse{
    border-top: 0px solid #EBEEF5;
}
</style>