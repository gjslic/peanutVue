<template>
  <el-row :gutter="20">
    <el-col :span="4">
      <div class="grid-content">
        <el-button type="primary" plain to="/AddLoginRegister">登录/注册</el-button>
      </div>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: ''
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  
</style>
