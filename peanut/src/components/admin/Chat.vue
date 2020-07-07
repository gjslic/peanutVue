// 聊天组件
<template>
  <div class="chat_box">
    <div class="chat_title"></div>
    <div class="chat_main">
      <div class="chat_list">
        <ul>
          <li class="list_item">
            <img class="user_img" src="../../assets/images/avator.jpg" alt="">
            <span class="user_name">用户1</span>
          </li>
        </ul>
        <div class="chat_item">
          <div class="info_box">
            <ul>
              <li>
                <div class="img_box">
                  <img class="user_img" src="../../assets/images/avator.jpg" alt="">
                  
                </div>
                <span class="user_chat_name">
                  小兰
                  <span>2020-05-15 22:34:40</span>
                </span>
                <div class="chat_text">你慢慢说，别急……</div>
              </li>
              <li class="info_item_my">
                <div class="img_box">
                  <img class="user_img" src="../../assets/images/avator.jpg" alt="">
                  
                </div>
                <span class="user_chat_name">
                  <span>2020-05-15 22:34:40</span>
                  小兰
                </span>
                <div class="chat_text">你慢慢说，别急……</div>
              </li>
            </ul>
          </div>
          <div class="input_box">
            <div class="input_top">
              <i class="el-icon-picture-outline-round"></i>
            </div>
            <div class="input_info"></div>
            <div class="input_button">
              <input type="button" value="发送" class="chatBtn">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
  @import '../../assets/css/chat.css';
  
</style>
<script>
  export default {
    name: 'Chat',
    
  }
</script>
