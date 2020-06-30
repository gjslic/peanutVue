
<template>
  <el-carousel :interval="5000" arrow="always" class="d_jump" :height="imgHeight">
    <el-carousel-item v-for="item in imgList" :key="item.id">
      <el-row>
        <el-col :span="24">
          <img ref="imgHeight" :src="item.idView" class="banner_img" style="height:400px;width:100%;" />
        </el-col>
      </el-row>
    </el-carousel-item>
  </el-carousel>
</template>

<script>
export default {
  name: "Banner",

  data() {
    return {
      imgHeight:'400px',


      // 图片需要引入, 否则无法显示
      imgList: [
        { id: 0, idView: require("../assets/images/banner.png") },
        {
          id: 1,
          name: "详情",
          idView: require("../assets/images/banner01.jpg")
        },
        {
          id: 2,
          name: "推荐",
          idView: require("../assets/images/banner02.jpeg")
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

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

@media (min-width: 768px) {
    
}

@media (max-width: 768px) {
}
</style>