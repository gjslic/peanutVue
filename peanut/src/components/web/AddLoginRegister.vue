<template>
    <div>
        <el-tabs v-model="activeName" @tab-click="handleClick">
            <!-- 登录 -->
            <el-tab-pane label="登录" name="second">
                <Login/>
            </el-tab-pane>
            <!-- 注册 -->
            <el-tab-pane label="注册" name="first">
                <Register/>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>

import Login from './Login'

import Register from './Register'

export default {
    name: 'AddLoginRegister',
    components: {
        Login,
        Register
    },
    data(){
        return {
            activeName: 'second'
        }
    },
    methods: {
      handleClick(tab, event) {
        console.log(tab, event);
      }
    }
}
</script>

<style>

</style>