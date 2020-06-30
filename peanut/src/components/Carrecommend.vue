<template>
  <el-row style="box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1) margin-top:20px; ">
    <el-col :sm="12" :md="24">
      <div class="recommend_box">

        <el-row>
          <el-col  :md="4" :xs="24"><div class="recommend_text">
              为您推荐
          </div></el-col>
        </el-row>

      </div>
    </el-col>

    <el-row>
    
      <el-col :xs="24" :sm="6" :md="24" >
        <div class="recommend_img">
            <el-tabs v-model="activeName" @tab-click="handleClick">
                <el-tab-pane label="省油代步" name="first" class="name_text">
                    
                  <el-row :gutter="5">
                    <el-col :xs="12" :md="6" >
                      <div class="grid-content bg-purple-light">
                        <el-card class="box-card" shadow="hover">
                            <div class="car_img">

                               <el-row :gutter="5">
                                  <el-col :xs="24" :md="24" class="car_img_box">
                                      <img src="https://baidu-vr1.xin.com/car/tiles/71cf86f514e0572b410507ba3e557f8b/external/closed/cover_00.JPG" alt="" style="width:100%;height:100%">
                                  </el-col>
                               </el-row>

                                <el-row :gutter="5">
                                  <el-col :xs="12" :md="12" class="car_text_box">
                                      大众POLO
                                  </el-col>

                                   <el-col :xs="12" :md="12" class="car_text_box" style="color: #ff5837;">
                                      2.90-10.8万
                                  </el-col>
                               </el-row>

                            </div>
                        </el-card>
                      </div>
                    </el-col>

                    <el-col :xs="12" :md="6" ><div class="grid-content bg-purple">
                      <el-card class="box-card" shadow="hover">
                           <div class="car_img">

                               <el-row :gutter="5">
                                  <el-col :xs="24" :md="24" class="car_img_box">
                                      <img src="https://baidu-vr1.xin.com/car/tiles/71cf86f514e0572b410507ba3e557f8b/external/closed/cover_00.JPG" alt="" style="width:100%;height:100%">
                                  </el-col>
                               </el-row>

                               <el-row :gutter="5">
                                  <el-col :xs="12" :md="12" class="car_text_box">
                                      大众POLO
                                  </el-col>

                                   <el-col :xs="12" :md="12" class="car_text_box" style="color: #ff5837;">
                                      2.90-10.8万
                                  </el-col>
                               </el-row>

                            </div>
                      </el-card>
                    </div></el-col>

                    <el-col :xs="12" :md="6" ><div class="grid-content bg-purple-light">
                      <el-card class="box-card" shadow="hover">
                           <div class="car_img">

                               <el-row :gutter="5">
                                  <el-col :xs="24" :md="24" class="car_img_box">
                                      <img src="https://baidu-vr1.xin.com/car/tiles/71cf86f514e0572b410507ba3e557f8b/external/closed/cover_00.JPG" alt="" style="width:100%;height:100%">
                                  </el-col>
                               </el-row>

                                 <el-row :gutter="5">
                                  <el-col :xs="12" :md="12" class="car_text_box">
                                      大众POLO
                                  </el-col>

                                   <el-col :xs="12" :md="12" class="car_text_box" style="color: #ff5837;">
                                      2.90-10.8万
                                  </el-col>
                               </el-row>

                            </div>
                      </el-card>
                    </div></el-col>

                    <el-col :xs="12" :md="6" ><div class="grid-content bg-purple">
                      <el-card class="box-card" shadow="hover">
                           <div class="car_img">

                               <el-row :gutter="5">
                                  <el-col :xs="24" :md="24" class="car_img_box">
                                      <img src="https://baidu-vr1.xin.com/car/tiles/71cf86f514e0572b410507ba3e557f8b/external/closed/cover_00.JPG" alt="" style="width:100%;height:100%">
                                  </el-col>
                               </el-row>

                                <el-row :gutter="5">
                                  <el-col :xs="12" :md="12" class="car_text_box">
                                      大众POLO
                                  </el-col>

                                   <el-col :xs="12" :md="12" class="car_text_box" style="color: #ff5837;">
                                      2.90-10.8万
                                  </el-col>
                               </el-row>

                            </div>
                      </el-card>
                    </div></el-col>

                  </el-row>

                </el-tab-pane>
                <el-tab-pane label="超值豪华" name="second" class="name_text">超值豪华</el-tab-pane>
                <el-tab-pane label="家用首选" name="third" class="name_text">家用首选</el-tab-pane>
                <el-tab-pane label="保值神车" name="fourth" class="name_text">保值神车</el-tab-pane>
                <el-tab-pane label="保值神车" name="fifth" class="name_text">保值神车</el-tab-pane>
                <el-tab-pane label="保值神车" name="sixth" class="name_text">保值神车</el-tab-pane>
            </el-tabs>
        </div>
      </el-col>

    </el-row>
  </el-row>





</template>

<script>

export default {
    name:'Carrecommend',
    data() {
      return {
        activeName: 'first'
      };
    },
    methods: {
      handleClick(tab, event) {
        console.log(tab, event);
      }
    }

}
</script>

<style scoped>
/* 卡片样式 */
 .text {
    font-size: 14px;
  }

  .item {
    padding: 18px 0;
  }




/* 列样式 */
   .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .bg-purple {
    background: #d3dce6;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }



  /* 电脑端 */
 @media (min-width: 768px){
    .recommend_box{
    margin-top: 20px;
  }

  .recommend_text{
  font-size: 3rem;
    /* padding: 18px; */
    padding-left: 30px;
    padding-top: 20px;
  }

  /* 车辆图片 */
  .recommend_img{
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
    height: 370px;
    padding-top: 20px;
    padding-left: 30px;
  }

  /* 装车图片 */
  .car_img_box{
    height: 216px;
    /* border: 1px solid; */
  } 

  .car_text_box{
     height: 50px;
    /* border: 1px solid; */
    text-align: center;
    font-size: 2rem;
    padding: 10px;
  }
 
 }
 
/* 手机端 */
   @media (max-width: 768px){
      .recommend_text{
        font-size: 2rem;
          /* padding: 18px; */
          padding-left: 10px;
          /* padding-top: 20px; */
      }
      .recommend_img{
        padding-left: 10px;
      }

       /* 装车图片 */
        .car_img_box{
          height: 140px;
          /* border: 1px solid; */
        } 

        .car_text_box{
          height: 30px;
          /* border: 1px solid; */
          text-align: center;
          font-size: 1.3rem;
          padding: 10px;
        }

        .box-card{
          padding: 0;
        }
  }
 
</style>