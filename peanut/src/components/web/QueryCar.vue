<!-- 查询车辆组件 -->
<template>
  <div>
    <div class="hidden-xs-only">
      <el-row class="keyword">
        <el-col :md="1" :sm="3" :offset="3">
          <div class="titleBox">
            <span>品牌:</span>
          </div>
        </el-col>
        <el-col :md="17" :sm="3">
          <div class="keyword-content">
            <el-row>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">大众</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">宝马</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">奥迪</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">丰田</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">大众</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">宝马</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">奥迪</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">丰田</div>
              </el-col>
            </el-row>
          </div>
        </el-col>
      </el-row>
      <el-row class="keyword">
        <el-col :md="1" :sm="3" :offset="3">
          <div class="titleBox" style="border-top:0px">
            <span>车系:</span>
          </div>
        </el-col>
        <el-col :md="17" :sm="3">
          <div class="keyword-content" style="border-top:0px">
            <el-row>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">不限</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">宝马</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">奥迪</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">丰田</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">大众</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">宝马</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">奥迪</div>
              </el-col>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">丰田</div>
              </el-col>
            </el-row>
          </div>
        </el-col>
      </el-row>
      <el-row class="keyword">
        <el-col :md="1" :sm="3" :offset="3">
          <div class="titleBox" style="border-top:0px">
            <span>价格:</span>
          </div>
        </el-col>
        <el-col :md="17" :sm="3">
          <div class="keyword-content" style="border-top:0px">
            <el-row>
              <el-col :sm="1" :xs="1" class="content-mar">
                <div class="grid-content">不限</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">3万以下</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">3-10万</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">10-20万</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">20-30万</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">30-40万</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">40-50万</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">50万以上</div>
              </el-col>
              <el-col :sm="2" :xs="1" class="content-mar">
                <div class="grid-content">50万以上</div>
              </el-col>
            </el-row>
          </div>
        </el-col>
      </el-row>
    </div>
    <div class="hidden-sm-and-up">
      <el-row>
        <el-col :span="6">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">
              智能排序
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-plus">黄金糕</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus">狮子头</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus-outline">螺蛳粉</el-dropdown-item>
              <el-dropdown-item icon="el-icon-check">双皮奶</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-check">蚵仔煎</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </el-col>
        <el-col :span="6">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">
              品牌
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-plus">黄金糕</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus">狮子头</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus-outline">螺蛳粉</el-dropdown-item>
              <el-dropdown-item icon="el-icon-check">双皮奶</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-check">蚵仔煎</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </el-col>
        <el-col :span="6">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">
              车系
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-plus">黄金糕</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus">狮子头</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus-outline">螺蛳粉</el-dropdown-item>
              <el-dropdown-item icon="el-icon-check">双皮奶</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-check">蚵仔煎</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </el-col>
        <el-col :span="6">
          <el-dropdown trigger="click">
            <span class="el-dropdown-link">
              价格
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-plus">黄金糕</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus">狮子头</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-plus-outline">螺蛳粉</el-dropdown-item>
              <el-dropdown-item icon="el-icon-check">双皮奶</el-dropdown-item>
              <el-dropdown-item icon="el-icon-circle-check">蚵仔煎</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "QueryCar",
  data() {
    return {};
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.keyword {
  font-size: 13px;
}
.titleBox {
  min-height: 30px;
  padding-top: 15px;
  text-align: center;
  background-color: #fafafa;
  border: 1px solid #f4f4f4;
  border-right: 1px solid white;
}
.keyword-content {
  min-height: 30px;
  padding-top: 15px;
  text-align: center;
  border: 1px solid #f4f4f4;
  border-left: 1px solid white;
  height: 100%;
}
.content-mar {
  margin-left: 10px;
  cursor: pointer;
}
.content-mar:hover .grid-content {
  color: #ff5a37;
}
</style>