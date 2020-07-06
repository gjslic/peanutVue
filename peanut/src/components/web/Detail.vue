<template>
  <div>
    <!-- 导航栏 -->
    <div class="nav_top"></div>
    <!-- 购买 -->
    <el-row>
      <el-col :md="12" :sm="24">
        <!-- 图片轮播 -->
        <div class="img_detail">
          <img src="../assets/images/cover_00.jpg" alt />
        </div>
      </el-col>
      <el-col :md="12" :sm="24">
        <div class="text_detail">
          <h1 class="car_title">奔驰 C级 2011款 1.8T 自动 C200时尚型CGI</h1>
          <p class="car_price">
            <span class="now_price">
              <b>￥12.99万</b>
            </span>
            <span class="new_car_price">
              新车含税价：42.23万
              <i class="el-icon-info"></i>
            </span>
          </p>
          <p class="car_address">
            <span class="postage">包物流</span>
            <span class="car_from">由东北仓运往福州 可迁本市</span>
          </p>
          <div class="down_payment">
            <span>首付低至2.60万</span>
            <span>月供3421元</span>
          </div>
          <div class="detail_txt hidden-xs-only">汽车详情信息汽车详情信息汽车详情信息汽车详情信息汽车详情信息汽车详情信息汽车详情信息</div>
          <div class="btn_box">
            <el-button type="warning">
              <i class="el-icon-chat-dot-round"></i> 在线客服
            </el-button>
            <el-button type="danger">
              <i class="el-icon-shopping-bag-1"></i> 立即购买
            </el-button>
          </div>
          <div class="collect">
            <i class="el-icon-star-off"></i>
            <span>点击收藏</span>
          </div>
        </div>
      </el-col>
    </el-row>
    <div class="buy_server">
      <CarNavTitle />
      <el-row>
        <el-col :span="8" class="server_box">
          <ServerItem />
        </el-col>
        <el-col :span="8" class="server_box">
          <ServerItem>
            <p slot="title_name">交易服务</p>
            <span slot="span_one">包过户</span>
            <span slot="span_two">上门服务</span>
            <span slot="span_three">车辆整备</span>
          </ServerItem>
        </el-col>
        <el-col :span="8" class="server_box">
          <ServerItem>
            <p slot="title_name">售后服务</p>
            <span slot="span_one">一年包退</span>
            <span slot="span_two">一年保修</span>
            <span slot="span_three">全国联保</span>
          </ServerItem>
        </el-col>
      </el-row>
      <CarNavTitle>车辆信息</CarNavTitle>
      <el-row>
        <el-col :md="3" :sm="6" :xs="6">
          <div>
            <span class="carInfoItem">HUD显示</span>
          </div>
        </el-col>
        <el-col :md="3" :sm="6" :xs="6">
          <div>
            <span class="carInfoItem ci_1">自动驻车</span>
          </div>
        </el-col>
        <el-col :md="3" :sm="6" :xs="6">
          <div>
            <span class="carInfoItem ci_2">并线辅助</span>
          </div>
        </el-col>
        <el-col :md="3" :sm="6" :xs="6">
          <div>
            <span class="carInfoItem ci_3">方向盘换挡</span>
          </div>
        </el-col>
        <el-col :md="3" class="hidden-sm-only hidden-xs-only">
          <div>
            <span class="carInfoItem ci_4">随动转向大灯</span>
          </div>
        </el-col>
        <el-col :md="3" class="hidden-sm-only hidden-xs-only">
          <div>
            <span class="carInfoItem ci_5">主动自动</span>
          </div>
        </el-col>
        <el-col :md="3" class="hidden-sm-only hidden-xs-only">
          <div>
            <span class="carInfoItem ci_6">自动灯头</span>
          </div>
        </el-col>
        <el-col :md="3" class="hidden-sm-only hidden-xs-only">
          <div>
            <span class="carInfoItem ci_7">电动座椅</span>
          </div>
        </el-col>
      </el-row>
      <!-- 卖家信息 -->
      <CarNavTitle>卖家信息</CarNavTitle>
      <div class="sell_info_box">
        <el-row>
          <el-col :md="24">
            <p class="sell_title hidden-xs-only">卖家个人信息</p>
          </el-col>
        </el-row>
        <el-row>
          <div class="top_us">
            <el-col :md="10">
              <el-row>
                <el-col :md="10" :xs="10" :sm="14">
                  <div class="sell_user_img">
                    <img src="../assets/images/cover_00.jpg" alt />
                  </div>
                </el-col>
                <el-col :md="14" :xs="14" :sm="14">
                  <p class="sell_user_name">
                    <span>徐师傅</span>
                    <span>车辆检测员</span>
                  </p>
                  <p>
                    <el-button type="warning">在线咨询</el-button>
                  </p>
                </el-col>
              </el-row>
            </el-col>
            <el-col :md="14" class="hidden-xs-only hidden-sm-only">
              <el-row :gutter="10">
                <el-col :md="8">
                  <div class="right_item">
                    <span class="credit">信用值</span>
                  </div>
                </el-col>
                <el-col :md="8">
                  <div class="right_item">
                    <span>好评值</span>
                    <p class="star_five">
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                    </p>
                  </div>
                </el-col>
                <el-col :md="8">
                  <div class="right_item">
                    <span>举报</span>
                    <p class="star_five">
                      <i class="el-icon-s-flag"></i>
                    </p>
                  </div>
                </el-col>
              </el-row>
            </el-col>
          </div>
        </el-row>
        <el-row>
          <el-col :md="24">
            <div class="remark_top">
              <span class="remark">用户评价</span>
            </div>
            <ul>
              <li class="remark_item">
                <p class="remark_item_hd">
                  <span class="remark_user_box">
                    <span>
                      <img src="../assets/images/avator.jpg" alt />
                    </span>
                    <span class="u_name">李红艳</span>
                    <span>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                    </span>
                  </span>
                  <span class="remark_date">2020-12-30</span>
                </p>
                <p
                  class="remark_content"
                >李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol</p>
              </li>
              <li class="remark_item">
                <p class="remark_item_hd">
                  <span class="remark_user_box">
                    <span>
                      <img src="../assets/images/avator.jpg" alt />
                    </span>
                    <span class="u_name">李红艳</span>
                    <span>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                    </span>
                  </span>
                  <span class="remark_date">2020-12-30</span>
                </p>
                <p
                  class="remark_content"
                >李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol</p>
              </li>
              <li class="remark_item">
                <p class="remark_item_hd">
                  <span class="remark_user_box">
                    <span>
                      <img src="../assets/images/avator.jpg" alt />
                    </span>
                    <span class="u_name">李红艳</span>
                    <span>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                      <i class="el-icon-star-on"></i>
                    </span>
                  </span>
                  <span class="remark_date">2020-12-30</span>
                </p>
                <p
                  class="remark_content"
                >李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol李红艳haopiaol</p>
              </li>
            </ul>
            <div class="block">
              <span class="demonstration"></span>
              <el-pagination background layout="prev, pager, next" :total="50"></el-pagination>
            </div>
          </el-col>
        </el-row>
      </div>
      <!-- 车图描述 -->
      <CarNavTitle>车图描述</CarNavTitle>
      <div class="car_img_box">
        <el-row :gutter="20">
          <el-col :xs="24" :sm="24" :md="12">
            <div class="car_de_img">
              <img src="../assets/images/car_de1.jpg" alt />
            </div>
          </el-col>
          <el-col :xs="24" :sm="24" :md="12">
            <div class="car_de_img">
              <img src="../assets/images/car_de2.jpg" alt />
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :xs="24" :sm="24" :md="12">
            <div class="car_de_img">
              <img src="../assets/images/car_de1.jpg" alt />
            </div>
          </el-col>
          <el-col :xs="24" :sm="24" :md="12">
            <div class="car_de_img">
              <img src="../assets/images/car_de2.jpg" alt />
            </div>
          </el-col>
        </el-row>
      </div>
      <!-- 服务保障 -->
      <CarNavTitle>服务保障</CarNavTitle>
      <el-row>
        <el-col :md="24">
          <div class="server_bg">
            <img src="../assets/images/fwbz_1f13928.png" alt="">
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import CarNavTitle from "../components/CarNavTitle";
import ServerItem from "../components/ServerItem";
export default {
  name: "Detail",
  components: {
    CarNavTitle,
    ServerItem
  }
};
</script>

<style scoped>
@import "../../assets/css/detail.css";
.server_box:nth-child(2) {
  padding: 0 8px;
}


.block {
  margin: 5px 20px;
}
</style>
<style>
.block .el-pagination.is-background .el-pager li {
  background: none;
}
.block .el-pagination.is-background .el-pager li:not(.disabled).active{
  background-color: #fd7a3a;
  color: #fff;
}
.block .el-pagination.is-background .el-pager li:not(.disabled):hover {
    color: #fd7a3a;
}
</style>
