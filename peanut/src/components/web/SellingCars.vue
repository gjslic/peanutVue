<template>
    <div id="SellingCars">
        <!-- 图片 -->
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
        <!-- 卖车表 -->
        <el-form ref="form" :model="form" label-width="80px">
            <el-row :gutter="20">
                <el-col :sm="5" :xs="1" style="height:1px"></el-col>
                <el-col :span="18" >
                    <!-- <el-form-item label="活动名称">
                        <el-input v-model="form.name"></el-input>
                    </el-form-item> -->

                    <!-- 选择城市 -->
                    <el-row :gutter="24">
                         <el-form-item label="选择城市">
                            <el-autocomplete
                            v-model="citystate"
                            :fetch-suggestions="querySearchcity"
                            placeholder="请选择所在城市"
                            @select="citySelect"
                            ></el-autocomplete>
                         </el-form-item>
                    </el-row>
                    <!-- 选择品牌 -->
                    <el-form-item label="品牌车系">

                        <div class="block float_left margin_bottom_10 margin_right_4">

                            <el-autocomplete
                            v-model="brandstate"
                            :fetch-suggestions="querySearchbrand"
                            placeholder="请选择车辆品牌"
                            @select="brandSelect"
                            ></el-autocomplete>

                        </div>

                        <el-input v-model="input1" placeholder="请输入车型" class="width_160" onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')"></el-input>
                    </el-form-item>
                    <el-form-item label="上牌时间">
                        <el-date-picker v-model="value1" type="date" placeholder="选择时间">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item label="行驶里程">
                        <el-input type="text" v-model="input2" placeholder="已万公里记录" maxlength="2" class="width_150" show-word-limit onkeyup="this.value=this.value.replace(/\D/g,'')"></el-input>
                    </el-form-item>
                    <el-form-item label="车况标签">
                        <el-radio-group v-model="radio">
                            <el-radio :label="1" class="margin_bottom_5">车况极佳</el-radio>
                            <el-radio :label="2" class="margin_bottom_5">稍微刮伤</el-radio>
                            <el-radio :label="3" class="margin_bottom_5">严重刮伤</el-radio>
                            <el-radio :label="4" class="margin_bottom_5">是否泡水</el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="卖车拍卖">
                        <el-radio-group v-model="radio">
                            <!-- <el-radio :label="5" class="margin_bottom_5">我要卖车</el-radio> -->
                              <div>
                                <el-checkbox v-model="checked1" label="我要拍卖" border></el-checkbox>
                                <!-- <el-checkbox v-model="checked2" label="备选项2" border></el-checkbox> -->
                            </div>
                            <!-- <el-radio :label="6" class="margin_bottom_5">我要拍卖</el-radio> -->
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="车辆图片">
                        <el-upload class="upload-demo" action="https://jsonplaceholder.typicode.com/posts/" :on-preview="handlePreview" :on-remove="handleRemove" :file-list="fileList" list-type="picture">
                            <el-button size="small" type="primary" >点击上传车辆信息</el-button>
                            <div slot="tip" class="el-upload__tip ">只能上传jpg/png文件只取第一张</div>
                        </el-upload>
                    </el-form-item>
                    <el-form-item class="margin_left_20">
                        <div class="margin_bottom_10 margin_l_10">
                            <el-checkbox v-model="checked"><el-link type="info" :underline="false">我已阅读同意</el-link><el-link type="primary" :underline="false">《个人信息使用告知书》</el-link></el-checkbox>
                        </div>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit" class="margin_l_10">提交信息</el-button>
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>  
    </div>
</template>

<script>
import { getData, sendParam} from "../../network/home";
export default {
    name: 'SellingCars',
    data(){
        return {
            citystate: '',
            brandstate:'',

            checked1: true,
            // 时间选择器
            cityArr:[],
            checked: true,
            input: '',
            input1: '',
            input2: '',
            fits: ['fill'],
            url: '//s5.xinstatic.com/static/newcar-www/widget/c2b_sale_new/c2b_car_sale_top/imgs/salecar-banner_bc02644.jpg',
            // {name: '', url: ''}
            fileList: [],
            value1: '',
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now();
                }
            },
            //单选框
            radio: 1,
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
          
        }
    },
    // mounted(){
    // // 获取到城市数据
    // this.getsellingCity();
    // },
    methods: {
        // 城市输入建议
        querySearchcity(queryString, callback) {
        var citylist = [{}];
        let url = '/homepage/Homepage/getsellingCity';
        getData(url).then(res => {
            //this获取到数据
            // console.log(res);
                this.cityArr = res.data;
                for(let i of res.data){
                    i.value = i.city_name;  //将想要展示的数据作为value
                }
                citylist = res.data;
                callback(citylist);
            }).catch(err => {
            console.log(err);
        });
        },

        citySelect(item) {
            console.log(item);
        },

        // 品牌输入建议
        querySearchbrand(queryString,callback){
            var brandlist = [{}];
            let url = '/homepage/Homepage/getsellingbrand';
            getData(url).then(res => {
            //this获取到数据
            // console.log(res);
                for(let i of res.data){
                    i.value = i.brand_name;  //将想要展示的数据作为value
                }
                brandlist = res.data;
                callback(brandlist);
            }).catch(err => {
            console.log(err);
        });
        },

         brandSelect(item) {
            console.log(item);
        },


        // 提交表单
        onSubmit() { 
            // console.log('submit!');
            
        },

        handleRemove(file, fileList) {
            console.log(file, fileList);
        },
        handlePreview(file) {
            console.log(file);
        },
    }
    
}
</script>

<style scoped>
.margin_left_20{
    margin-left: -70px !important;
}
.margin_bottom_20{
    margin-bottom: 20px;
}
.margin_bottom_5{
    margin-bottom: 5px;
}
.margin_bottom_10{
    margin-bottom: 10px;
}
.margin_right_4{
    margin-right: 4px;
}
.width_150{
    width: 150px;
}
.width_160{
    width: 160px;
}
.float_left{
    float: left;
}
.margin_0_auto{
    margin: 0 auto;
}
@media (min-width: 768px){
    .margin_l_10{
        margin: 0 0 0 10%;
    }
}
@media (max-width: 768px) {
    .margin_l_10{
        margin: 0 0 0 10%;
    }
}
</style>

<style>
#SellingCars .el-upload__input{
    display: none;
}
#SellingCars .el-row{
    margin-left: 0px !important;
    width: 100%;
}
</style>