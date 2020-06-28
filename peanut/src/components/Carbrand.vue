<template>

<el-row>
    <el-col :span="18" :offset="3" id="carbrand_box">
        <div class="grid-content bg-purple">
            <el-col :xs="4" class="xs_box" style="width:700px"> 
                <div class="bg-purple-light">
                    <h1>品牌</h1>
                </div>
            </el-col>

             <el-col :xs="4" class="xs_box">
                <div class="bg-purple-light">
                    <h1>价格</h1>
                </div>
            </el-col>

             <el-col :xs="4" class="xs_box">
                <div class="bg-purple-light">
                    <h1>车型</h1>
                </div>
            </el-col>
        </div>
    </el-col>
</el-row>

</template>

<script>

export default {
    name:'Carbrand',
  

}
</script>

<style scoped>
#carbrand_box{
    height: 300px;
    background-color: bisque;
}
.grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
.xs_box{
    float: left;
    width: 300px;
}

</style>