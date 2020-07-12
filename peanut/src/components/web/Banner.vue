
<template>
<div>
  <el-carousel :interval="5000" arrow="always" class="d_jump" :height="imgHeight">
    <el-carousel-item v-for="item in imgList" :key="item.id" class="branner_item">
      <el-row>
        <el-col :span="24">
          <img ref="imgHeight" :src="item.idView" class="banner_img" />
        </el-col>
      </el-row>
    </el-carousel-item>
  </el-carousel>

  <!-- 手机端 -->

   <el-carousel :interval="5000" arrow="always" class="phone_branner" :height="phoneimgHeight">
    <el-carousel-item v-for="item in imgList" :key="item.id" class="branner_item">
      <el-row>
        <el-col :span="24">
          <img ref="phoneimgHeight" :src="item.idView" class="banner_img" />
        </el-col>
      </el-row>
    </el-carousel-item>
  </el-carousel>

</div>





</template>

<script>
export default {
  name: "Banner",

  data() {
    return {
      imgHeight:'400px',
      phoneimgHeight:'200px',


      // 图片需要引入, 否则无法显示
      imgList: [
        { id: 0, idView: ("https://ae01.alicdn.com/kf/Hda8487d4a3ce4c209a8e9abd6c11f45eX.jpg") },
        {
          id: 1,
          name: "详情",
          idView: ("https://ae01.alicdn.com/kf/H7209bf14e57c40a89b2096bc201741f97.jpg")
        },
        {
          id: 2,
          name: "推荐",
          idView: ("https://ae01.alicdn.com/kf/H6e255395de9941e485be7b5b6bab9406V.jpg")
        }
      ]
    };
  },
  methods: {}
};
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  font-size: 18px;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}



@media (min-width: 768px) {
    .banner_img{
      height:100%;
      width:100%;
    }
    .d_jump{
      height:400px;
    }
    .branner_item{
      height:400px;
    }
    .phone_branner{
      display: none;
    }
}

@media (max-width: 768px) {
    .banner_img{
      height:204px;
      width:100%;
    }
    .d_jump{
      height:204px;
      display: none;
    }
    .branner_item{
      height:200px;
    }

    .phone_branner{
      display: block;
    }
}
</style>