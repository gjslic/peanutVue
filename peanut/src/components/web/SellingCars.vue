<template>

    <div id="SellingCars">
        <!-- 导航栏 -->
        <Menu />
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
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">

            <el-row :gutter="20">
                <el-col :sm="5" :xs="1" style="height:1px"></el-col>
                <el-col :span="18" >

                    <!-- 选择城市 -->
                    <el-row :gutter="24">
                        
                         <el-form-item label="选择城市" prop="name">
                            
                             <el-select v-model="ruleForm.name" clearable placeholder="请选择">
                                <el-option
                                v-for="item in cityArr"
                                :key="item.city_id"
                                :label="item.city_name"
                                :value="item.city_id">
                                </el-option>
                            </el-select>
                          
                         </el-form-item>

                    </el-row>
                    <!-- 选择品牌 -->
                    <el-form-item label="车牌系列" prop="brand">
                        <el-cascader
                            v-model="ruleForm.brand"
                            :options="brandS"
                            :props="{ expandTrigger: 'hover' }"
                        ></el-cascader>
                    </el-form-item>

                
                    <el-form-item label="车辆信息" prop="carname" style="width: 300px;">
                       <el-input
                       
                        placeholder="请输入年份款式，排气等信息"
                        v-model="ruleForm.carname"
                         type="text"
                        maxlength="25"
                        show-word-limit
                        class="carinfo"
                        >
                        </el-input>
                    </el-form-item>

                      <el-form-item label="车辆标签" prop="tab">
                         <el-select v-model="ruleForm.tab" clearable placeholder="请选择车辆标签">
                                <el-option
                                v-for="item in tabArr"
                                :key="item.tab_id"
                                :label="item.tab_name"
                                :value="item.tab_id">
                                </el-option>
                            </el-select>
                    </el-form-item>



                    <!-- 上牌时间 -->
                    <el-form-item label="上牌时间"  prop="date">
                        <el-date-picker v-model="ruleForm.date" type="date" placeholder="选择时间">
                        </el-date-picker>
                    </el-form-item>


                    <el-form-item label="行驶里程" prop="num">
                        <el-input type="text" v-model="ruleForm.num" placeholder="已万公里记录" maxlength="4" class="width_150" show-word-limit onkeyup="value=value.replace(/[^\d.]/g,'')" onpaste="value=value.replace(/[^\0-9\.]/g,'')" oncontextmenu = "value=value.replace(/[^\0-9\.]/g,'')"></el-input>
                    </el-form-item>

                    <el-form-item label="期望价格" prop="salePrice" style="width:300px;">
                        <el-input v-model="ruleForm.salePrice" placeholder="请输入价格（万）" maxlength="4"
                        onkeyup="value=value.replace(/[^\d.]/g,'')"></el-input>
                    </el-form-item>

                    <el-form-item label="车况标签" prop="resource">
                        <el-radio-group v-model="ruleForm.resource">
                            <el-radio :label="'车况极佳'" class="margin_bottom_5">车况极佳</el-radio>
                            <el-radio :label="'稍微刮伤'" class="margin_bottom_5">稍微刮伤</el-radio>
                            <el-radio :label="'严重刮伤'" class="margin_bottom_5">严重刮伤</el-radio>
                            <el-radio :label="'是否泡水'" class="margin_bottom_5">是否泡水</el-radio>
                        </el-radio-group>
                    </el-form-item>

                    <el-form-item label="拍卖场次">
                        <el-tooltip class="item" effect="dark" content="在需要拍卖时选择" placement="right">

                            <el-select v-model="ruleForm.auction" clearable placeholder="请选择拍卖场次">
                                <el-option
                                v-for="item in auctiontimeArr"
                                :key="item.id"
                                :label="item.start_time+'~'+item.end_time"
                                :value="item.id">
                                </el-option>
                            </el-select>
                        </el-tooltip>
                    </el-form-item>


                   

                    
                    <el-form-item label="车辆图片">
                        <el-upload class="upload-demo" action="http://127.0.0.1/th5/public/sellcar/Sellcar/uploadimg" 
                        :limit="1"
                        name="image"
                        :on-preview="handlePictureCardPreview"
                        :on-remove="handleRemove"
                        :on-success="uploadSuccess" 
                        :file-list="fileList" 
                        list-type="picture-card">
                            <el-button size="small" type="primary" >点击上传车辆信息</el-button>
                            <div slot="tip" class="el-upload__tip ">只能上传jpg/png文件只取第一张</div>
                        </el-upload>
                    </el-form-item>


                    <el-form-item class="margin_left_20">
                        <div class="margin_bottom_10 margin_l_10">
                            <el-checkbox v-model="checked"><el-link type="info" :underline="false">我已阅读同意</el-link><el-link type="primary" :underline="false">《个人信息使用告知书》</el-link></el-checkbox>
                        </div>
                    </el-form-item>
                    <el-form-item class="form_button">
                        <el-button type="primary" @click="submitForm('ruleForm')"  class="margin_l_10">提交信息</el-button>
                         <el-button @click="resetForm('ruleForm')" style="margin-left: 30px;margin-top: 10px;">重置</el-button>
                    </el-form-item>
                </el-col>
            </el-row>


        </el-form> 

        <Bottom />
    </div>
    
</template>

<script>
import Menu from "./Menu";
import Bottom from "./Bottom";
import { getData, sendParam} from "../../network/home";
export default {
    name: 'SellingCars',
    components:{
        Menu,
        Bottom,
    },

    data(){
        return {
            fileList:[{name:'',url:''}],
            brandS: [],
            series:[],
            cityArr:[],
            brandArr:[],
            tabArr:[],
            auctiontimeArr:[],
            cityid: '',
            brandid:'',
            // 图片
            lastImgUrl:'',
            //拍卖场次时间显示
            showPrise:false,
            checked1: false,
            // 时间选择器
            cityArr:[],
            checked: true,
            input: '',
            input1: '',
            textarea: '',
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
            radio: '',
            
            ruleForm: {
                name: '',
                brand: '',
                date: '',
                num:'',
                delivery: false,
                type: [],
                resource: '',
                salePrice:'',
                carname:'',
                tab:''
            },

            rules:{
                name: [
                    { required: true, message: '请输入城市名称', trigger: 'blur' },
                ],
                 brand: [
                    { required: true, message: '请输入车辆品牌', trigger: 'blur' },
                ],
                date:[
                     { required: true, message: '请输入上牌时间', trigger: 'blur' },
                ],
                num:[
                     { required: true, message: '请输入行驶里程', trigger: 'blur' },
                ],
                resource:[
                    { required: true, message: '请选择一个车辆信息', trigger: 'change' }
                ],  
                 salePrice:[
                    { required: true, message: '请输入期望价格', trigger: 'change' }
                ], 
                 carname:[
                    { required: true, message: '请输入车辆信息', trigger: 'change' }
                ],
                 tab:[
                    { required: true, message: '请选择车辆标签', trigger: 'change' }
                ],
            }
          
        }
    },


    mounted(){
        // 获取到城市
        this.getsellcity();
        //获取到品牌
        this.getSeriesData();
        //获取到车辆标签
        this.getcartab();
        //获取拍卖场次时间
        this.showaction();
        //登录状态判断
        this.iftoken();

        
    },


    methods: {

        //判断登录状态
        iftoken(){
            var usertoken = localStorage.getItem('tokenVue');
            if(usertoken == '' || usertoken==null){
                this.$message({
                    type:'warning',
                    message:'请先登录'    
                })
                 this.$router.push({name:'Login'})
            }
        },
        //获取到城市数据
        getsellcity(){
            let url = '/sellcar/Sellcar/getsellcity';
              getData(url).then(res => {
                //this获取到数据
                console.log(res);
                    this.cityArr = res.data;
                }).catch(err => {
                console.log(err);
            });
        },
    
        // 获取品牌车系
        getSeriesData() {
        let url = "/sellcar/Sellcar/getSeries";
        getData(url)
            .then(res => {
            console.log(res);
            //需要渲染的数据
            var renderData = [];
            let series = res.data.series;
            let brand = res.data.brand;
            for (let item of brand) {
                item.children = [];
                renderData.push(item);
                for (let val of series) {
                if (val.brand_id == item.value) {
                    item.children.push(val);
                }
                }
            }
            this.brandS = renderData;
            })
            .catch(err => {
            console.log(err);
            });
        },

        //获取到车辆标签信息
        getcartab(){
             let url = '/sellcar/Sellcar/getcartab';
              getData(url).then(res => {
                //this获取到数据
                console.log(res);
                    this.tabArr = res.data;
                }).catch(err => {
                console.log(err);
            });
        },

        //获取拍卖场次时间
        showaction(){
            let url = '/sellcar/Sellcar/showaction'; 
              getData(url).then(res => {
                //this获取到数据
                console.log(res);
                    this.auctiontimeArr = res.data;
                }).catch(err => {
                console.log(err);
            });
        },
        
        
        //判断是否填写输入框
       submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
              let url = "/sellcar/Sellcar/sellcardata";
              var usetoken = localStorage.getItem('tokenVue');
              var allinfo = this.ruleForm;
              var auctiontime = allinfo.auction;
              if(auctiontime == null){
                  auctiontime=0;
              }
              console.log(auctiontime);
                let data = {
                    imgUrl: this.lastImgUrl,
                    ruleForm: this.ruleForm,
                    auctiontime:auctiontime,
                    usetoken:usetoken
                };
          
            console.log(data);
            //判断是否阅读个人信息告知书
            if(this.checked == true){
                //提示框
                 this.$confirm('请确保信息的真实性，如需拍卖您的爱车请联系客服。点击确认提交信息', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning',
                    center: true
                }).then(() => {
                    //提交成功信息
                    this.$message({
                            type: 'success',
                            message: '提交成功！请敬候佳音~',   
                        });
                        sendParam(url, data).then(res => {
                            // this.$router.push('/AddPersonalCenter');
                        console.log(res);

                        }).catch(err => {
                            console.log(err);
                        });
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消提交'
                        });
                    }); 
               
            }else{
                 this.$message({
                    message: '请勾选个人信息告知书',
                    type: 'warning'
                });
            }
            

          } else {
            this.$message({
                message: '请确认是否已填写所有信息',
                type: 'warning'
            });
            return false;
          }
        });
      },

      //重置表单
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
    }
    
}
</script>

<style scoped>
/* //输入框 */
.form_input{
    width: 200px;
}



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
    /* .form_button{
        margin-left: 10px;
    } */

    /* .carinfo{
       width: 300px;
    } */
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