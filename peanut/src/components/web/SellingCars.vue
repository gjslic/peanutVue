<template>
    <div>
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
                <el-col :sm="5" :xs="1"><p></p></el-col>
                <el-col :span="18" >

                    <!-- <el-form-item label="活动名称">
                        <el-input v-model="form.name"></el-input>
                    </el-form-item> -->
                    <el-row :gutter="24">
                        <el-col :span="24" :offset="0">
                            <el-form-item label="卖车城市">                      
                                <el-select v-model="form.region" placeholder="省" class="margin_bottom_10">
                                    <el-option label="区域一" value="shanghai"></el-option>
                                    <el-option label="区域二" value="beijing"></el-option>
                                </el-select>
                                <el-select v-model="form.region" placeholder="市" class="margin_bottom_10">
                                    <el-option label="区域一" value="shanghai"></el-option>
                                    <el-option label="区域二" value="beijing"></el-option>
                                </el-select>
                                <el-select v-model="form.region" placeholder="区" class="margin_bottom_10">
                                    <el-option label="区域一" value="shanghai"></el-option>
                                    <el-option label="区域二" value="beijing"></el-option>
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row :gutter="24">
                        <el-col :span="24" :offset="0">
                            <el-form-item label="车辆牌照">
                                <el-select v-model="form.region" placeholder="闽" class="margin_bottom_10">
                                    <el-option label="区域一" value="shanghai"></el-option>
                                    <el-option label="区域二" value="beijing"></el-option>
                                </el-select>
                                <el-select v-model="form.region" placeholder="D" class="margin_bottom_10">
                                    <el-option label="区域一" value="shanghai"></el-option>
                                    <el-option label="区域二" value="beijing"></el-option>
                                </el-select>
                                <el-input v-model="input" placeholder="输入后五位车牌" class="width_150" onKeyUp="value=value.replace(/[\W]/g,'')"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-form-item label="品牌车系">
                        <div class="block float_left margin_bottom_10 margin_right_4">
                            <el-cascader v-model="value" :options="options" @change="handleChange"></el-cascader>
                        </div>
                        <el-input v-model="input1" placeholder="车型" class="width_160" onkeyup="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')"></el-input>
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
                            <el-radio :label="4" class="margin_bottom_5">泡水车车</el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="车辆图片">
                        <el-upload class="upload-demo" action="https://jsonplaceholder.typicode.com/posts/" :on-preview="handlePreview" :on-remove="handleRemove" :file-list="fileList" list-type="picture">
                            <el-button size="small" type="primary">点击上传车辆信息</el-button>
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
export default {
    name: 'SellingCars',
    data(){
        return {
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
            value: [],
            options: [{
                value: 'zhinan',
                label: '指南',
                children: [{
                    value: 'shejiyuanze',
                    label: '设计原则'
                }, {
                    value: 'daohang',
                    label: '导航'
                }]
                },{
                value: 'zhinan',
                label: '指南',
                children: [{
                    value: 'shejiyuanze',
                    label: '设计原则'
                }, {
                    value: 'daohang',
                    label: '导航'
                }]
            }]
        }
    },
    methods: {
        onSubmit() {
            console.log('submit!');
        },
        handleChange(value) {
            console.log(value);
        },
        handleRemove(file, fileList) {
            console.log(file, fileList);
        },
        handlePreview(file) {
            console.log(file);
        }
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