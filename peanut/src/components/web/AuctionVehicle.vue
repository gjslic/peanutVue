<!-- 拍卖车辆信息 -->
<template>
  <div style="margin-bottom:50px">
    <el-row class="breadcrumb hidden-xs-only">
      <el-col :md="18" :offset="3" class="hidden-xs-only auctionTitle">
        <h3>竞拍中(22)</h3>
      </el-col>
    </el-row>
    <el-row class="outerFrame" :gutter="20">
      <el-col :sm="3" :xs="0">
        <p></p>
      </el-col>
      <el-col :md="18">
        <div class="infinite-list-wrapper" style="overflow:auto">
          <ul class="list" v-infinite-scroll="load" infinite-scroll-disabled="disabled">
            <li v-for="i in count" class="list-item" :key="i">
              <el-col :sm="24" :xs="24" class="outerFrameBox">
                <el-card shadow="hover">
                  <div class="vehicleImg">
                    <el-image
                      style="width:100%;height:100%"
                      src="https://baidu-vr1.xin.com/car/tiles/71cf86f514e0572b410507ba3e557f8b/external/closed/cover_00.JPG"
                    ></el-image>
                  </div>
                  <P class="vehicleName">
                    <span class="logo">花生</span> 广汽传祺 传祺GS8 2020款 2.0T 自动 GS8S 390T豪华智联版前驱
                  </P>
                  <div class="minVehicleBox">
                    <span class="vehicleTime">2020年 | 车况极佳</span>
                    <span class="priceDistance">8.98万公里</span>
                    <span class="priceFirst">竞拍金额24.05万</span>
                    <p class="vehiclePrice">
                      <i class="el-icon-star-off"></i>
                      <span style="font-size: 14px;">收藏</span>
                    </p>
                  </div>
                  <div class="vehicleBtn">
                    <p class="endTime">
                      距离结束：
                      <span>11:30</span>
                    </p>
                    <el-button type="warning" plain class="auctionBtn">出价</el-button>
                  </div>
                </el-card>
              </el-col>
            </li>
          </ul>
          <p v-if="loading" class="tiShi">加载中...</p>
          <p v-if="noMore" class="tiShi">没有更多了</p>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "AuctionVehicle",
  data() {
    return {
      count: 8,
      loading: false
    };
  },
  computed: {
    noMore() {
      return this.count >= 20;
    },
    disabled() {
      return this.loading || this.noMore;
    }
  },
  methods: {
    load() {
      this.loading = true;
      setTimeout(() => {
        this.count += 4;
        this.loading = false;
      }, 2000);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.outerFrame {
  margin: 15px 0;
}
.list {
  list-style: none;
  margin: 0;
  padding: 0;
}

.auctionTitle {
  position: relative;
  text-align: initial;
  color: #ff5837;
}
.auctionTitle h3 {
  margin: 10px 0 0 0;
}
@media (max-width: 768px) {
  /* 手机端 */
  .outerFrameBox {
    padding: 10px 5px;
    position: relative;
    border-bottom: 1px solid #f1f1f1;
    margin-bottom: 20px;
  }
  .vehicleImg {
    width: 8.5rem;
    height: 5.5rem;
    float: left;
    margin-right: 10px;
  }
  .logo {
    padding: 0 3px;
    background-color: #ff7f34;
    color: white;
  }
  .vehicleName {
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    margin: 0px;
    overflow: hidden;
    text-align: initial;
  }
  .minVehicleBox {
    margin: 0px;
  }
  .minVehicleStateBox {
    text-align: initial;
    margin: 3px;
    font-size: 14px;
  }
  .minVehicleState {
    background: #f5f6f8;
    color: #8a99b5;
    padding: 0 3px;
    display: block;
  }
  .priceDistance {
    display: block;
  }
  .minVehicleBox {
    margin: 0px;
    text-align: initial;
  }
  .vehicleTime {
    font-size: 12px;
    color: #999;
    display: block;
  }
  .vehiclePrice {
    font-size: 16px;
    color: #f85d00;
    float: left;
  }
  .priceFirst {
    font-size: 12px;
    color: #f85d00;
  }
  .vehicleBtn {
    float: left;
  }
  .endTime {
    margin: 0px 0 0 17px;
    font-size: 13px;
    float: left;
  }
  .auctionBtn {
    position: absolute;
    bottom: 19px;
    right: 35px;
  }
  .tiShi {
    position: absolute;
    bottom: -40px;
    left: 45%;
  }
}
/* 电脑 */
@media (min-width: 768px) {
  .outerFrameBox {
    margin-top: 10px;
    padding: 0px 5px;
    position: relative;
  }
  .vehicleImg {
    width: 24%;
    height: 195px;
    float: left;
    margin-bottom: 10px;
    margin-right: 32px;
  }
  .vehicleName {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font: 400 14px/16px "Microsoft YaHei";
    text-align: initial;
    font-size: 17px;
  }
  .vehicleTime {
    height: 27px;
    font-size: 12px;
    line-height: 24px;
    color: #999;
    display: block;
    text-align: initial;
  }
  .logo {
    padding: 0 3px;
    background-color: #ff7f34;
    color: white;
    position: absolute;
    top: 10px;
    left: 24px;
    font-size: 13px;
  }
  .vehiclePrice {
    font-style: normal;
    font-weight: 400;
    font-size: 16px;
    color: #ff7f34;
    display: block;
    text-align: initial;
    height: 33px;
    line-height: 33px;
    margin: 0px;
  }
  .priceDistance {
    height: 27px;
    font-size: 12px;
    line-height: 24px;
    color: #999;
    display: block;
    text-align: initial;
  }
  .priceFirst {
    padding: 8px 0 10px;
    display: block;
    font-size: 16px;
    color: #f85d00;
    text-align: initial;
  }
  .vehicleBtn {
    position: absolute;
    right: 7%;
    bottom: 40%;
  }
  .tiShi {
    position: absolute;
    bottom: -52px;
    left: 45%;
  }
}
</style>