<template>
  <el-row style="margin-top:20px;padding: 25px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)" class="hidden-xs-only hidden-sm-and-down">
    <el-col :md="10" :xs="24">
      <div class="car_barnd">
        <div class="brand_text">
          <!-- 品牌下拉框 -->
          <el-dropdown>
            <span class="el-dropdown-link">
              品牌
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>黄金糕</el-dropdown-item>
              <el-dropdown-item>狮子头</el-dropdown-item>
              <el-dropdown-item>螺蛳粉</el-dropdown-item>
              <el-dropdown-item disabled>双皮奶</el-dropdown-item>
              <el-dropdown-item divided>蚵仔煎</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>

        <!-- 品牌图标 -->
        <el-row >
          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              大众
            </div>
          </el-col>

          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              大众
            </div>
          </el-col>

          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              丰田
            </div>
          </el-col>

          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              本田
            </div>
          </el-col>

          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              大众
            </div>
          </el-col>

          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              大众
            </div>
          </el-col>

          <el-col :md="4" :xs="8">
            <div class="img_item">
              <img src="../../assets/images/b_84.png" alt class="a_img" />

              大众
            </div>
          </el-col>
        </el-row>
      </div>
    </el-col>

    <el-col :md="7" :xs="7" class="hidden-xs-only">
      <div class="car_barnd">
        <div class="brand_text">价格</div>

        <el-row type="flex" class="row-bg">
          <el-col :span="8">
            <div class="price_text">
              <span>分期购</span>
            </div>
          </el-col>

          <el-col :span="8">
            <div class="price_text">
              <span>分期购</span>
            </div>
          </el-col>

          <el-col :span="8">
            <div class="price_text">
              <span>分期购</span>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-col>

    <el-col :md="7" :xs="7" class="hidden-xs-only">
      <div class="car_barnd">
        <div class="brand_text">车型</div>

        <el-row type="flex" class="row-bg">
          <el-col :span="8">
            <div class="style_item">
              <img src="../../assets/images/c-2.png" alt class="style_img" />
              SUV
            </div>
          </el-col>

          <el-col :span="8">
            <div class="style_item">
              <img src="../../assets/images/c-2.png" alt class="style_img" />
              SUV
            </div>
          </el-col>

          <el-col :span="8">
            <div class="style_item">
              <img src="../../assets/images/c-2.png" alt class="style_img" />
              SUV
            </div>
          </el-col>
        </el-row>
      </div>
    </el-col>
  </el-row>


</template>

<script>

export default {
  name: "Carbrand"
};
</script>

<style scoped>



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

.el-col {
  border-radius: 4px;
}
/* 汽车信息 */
.car_barnd {
  border: 1px solid #ccc;
  height: 300px;
}

/* 品牌，价格，车型 字体*/
.brand_text {
  border-bottom: 1px solid #ccc;
  height: 60px;
  padding-top: 15px;
  text-align: center;
  font-size: 2rem;
}

/* 下拉菜单字体 */
.el-dropdown-link {
  cursor: pointer;
  font-size: 2rem;
}
.el-dropdown-link:hover {
  color: #ff5a37;
}
/* 品牌连接 */
.brand_a {
  text-align: center;
  float: left;
  height: 80px;
  cursor: pointer;
}

/* 品牌图片 */
.a_img {
  display: block;
  /* margin: 1rem; */
  width: 100%;
  margin-bottom: 1rem;
  cursor: pointer;
}

/* 品牌图标盒子 */
.img_item {
  padding: 17px;
  text-align: center;
  margin-top: 1rem;
  height: 105px;
}

/* 价格说明 */
.price_text {
  padding: 35px;
  text-align: center;
  cursor: pointer;
  font-size: 1.5rem;
}

.price_text span:hover {
  color: #ff5a37;
}
/* 车型图标盒子 */
.style_item {
  padding: 20px;
  text-align: center;
  cursor: pointer;
  margin-top: 1rem;
}

/* 车型图片大小 */
.style_img {
  width: 100%;
  margin-bottom: 1rem;
}
</style>