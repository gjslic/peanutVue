<template>
    <div class="contanir">
        <h1>权限管理</h1>
        <el-table :data="tableData" style="width: 50%;float:left">
            <el-table-column
                prop="role_id"
                label="ID"
                width="180">
            </el-table-column>
            <el-table-column
                prop="role_name"
                label="角色"
                width="180">
            </el-table-column>
        </el-table>
        <el-tree :data="data" show-checkbox node-key="id"></el-tree>

    </div>
</template>
<script>
    export default {
        name: 'Jurisdic',
        data() {
            return {
                tableData: [],
                data: [{
                    id: 1,
                    label: '一级 2',
                    children: [{
                        id: 3,
                        label: '二级 2-1',
                        children: [{
                        id: 4,
                        label: '三级 3-1-1'
                        }, {
                        id: 5,
                        label: '三级 3-1-2',
                        disabled: true
                        }]
                    }, {
                        id: 2,
                        label: '二级 2-2',
                        disabled: true,
                        children: [{
                        id: 6,
                        label: '三级 3-2-1'
                        }, {
                        id: 7,
                        label: '三级 3-2-2',
                        disabled: true
                        }]
                    }]
                }],
                defaultProps: {
                    children: 'children',
                    label: 'label'
                }
            }
        },
        mounted () {
            let that = this;
            that.axios.post('http://localhost/th5/public/adminJurisdiction/Jurisdition/getJurisditionList',{
            }).then(res => {
                if(res.data.code == 1000){
                    that.tableData = res.data.list;
                   
                    for(let x of res.data.list){
                        let arr = x.menu_id.split(',');
                        let numArr = arr.map(Number); 
                        console.log(numArr)
                    }
                }
                console.log(res)
            }).catch(error =>{
                console.log(error)
            })
        }
    } 
</script>
<style scoped>
    .el-tree {
        position: relative;
        cursor: default;
        background: #FFF;
        color: #606266;
        width: 50%;
        float: left;
    }
</style>
