<template>
    <div>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
            <el-menu-item class="peanut">花生二手车</el-menu-item>
            <el-submenu index="1" class="Personal_bar">
                <template slot="title">我的信息</template>
                <el-menu-item index="1-1">账号</el-menu-item>
                <el-menu-item index="1-2">退出</el-menu-item>
            </el-submenu>
            <el-menu-item index="2" class="Personal_bar">买车</el-menu-item>
            <el-menu-item index="3" class="Personal_bar">卖车</el-menu-item>
            <el-menu-item index="4" class="Personal_bar">首页</el-menu-item>
        </el-menu>
    </div>
</template>

<script>

export default {
    name: 'PersonalHead',
    data() {
        return {
            activeIndex: '1',
            activeIndex2: '1'
        };
    },
    methods: {
            handleSelect(key, keyPath) {
            console.log(key, keyPath);
        }
    }
}
</script>

<style scoped>
.Personal_bar{
    float: right;
}
</style>