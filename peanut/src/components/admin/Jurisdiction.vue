<template>
  <div class="contanir">
    <el-breadcrumb separator-class="el-icon-arrow-right" style="font-size:20px">
      <el-breadcrumb-item>Peanut后台</el-breadcrumb-item>
      <el-breadcrumb-item>权限管理</el-breadcrumb-item>
    </el-breadcrumb>
    <el-row :gutter="24">
      <el-col :span="5" :offset="3" class="topInfo"><h4>角色菜单</h4></el-col>
      <el-col :span="1" class="topInfo">
        <el-tooltip class="item" effect="dark" content="点击查看所有权限" placement="top">
          <el-button type="primary" circle @click="getJurisditionList('权限列表')" icon="el-icon-view"></el-button>
        </el-tooltip>
      </el-col>
      <el-col :span="11" :offset="1" class="topInfo"><h4>{{jurTitle}}</h4></el-col>
    </el-row>
    <el-table :data="tableData" highlight-current-row border :header-cell-style="{background:'skyblue',color:'white',fontSize:'18px'}" style="width: 50%;float:left;border-radius:10px">
      <el-table-column align="center" prop="id" label="ID"></el-table-column>
      <el-table-column align="center" prop="role_name" label="角色"></el-table-column>
      <el-table-column align="center" label="权限配置">
        <template slot-scope="scope">
          <el-tooltip class="item" effect="dark" content="点击查看当前拥有权限" placement="top">
            <el-button icon="el-icon-search" @click="getJurisdition(scope.row)" circle></el-button>
          </el-tooltip>
          <el-tooltip class="item" effect="light" content="点击修改权限" placement="top">
            <el-button type="primary" v-if="scope.row.role_name == '超级管理员'" disabled @click="getNowJurisdition(scope.row)" icon="el-icon-edit" circle></el-button>
            <el-button type="primary" v-else  @click="getNowJurisdition(scope.row)" icon="el-icon-edit" circle></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="jurTitle" destroy-on-close :visible.sync="editJurDialog" z-index="1" width="50%" :before-close="handleClose">
      <template >
        <tree-transfer 
          :title="transferTitle"
          :from_data='editJurData'
          :to_data='editJurVal'
          :defaultProps="{label:'label'}" 
          :mode='mode'
          @addBtn='editHaveJur' 
          @removeBtn='editHaveJur'
          :button_text="btnText"
          filter
          openAll>
        </tree-transfer>
      </template>
      <span slot="footer" class="dialog-footer">
        <el-button @click="editJurDialog = false">取 消</el-button>
        <el-button type="primary" @click="editJurisdition">确 定</el-button>
      </span>

    </el-dialog>
    <el-tree :data="menuData" :props="defaultProps"></el-tree>
    
  </div>
</template>
<script>
  import treeTransfer from 'el-tree-transfer'
  export default {
    name: 'Jurisdiction',
    components:{ 
      treeTransfer,
    },
    data() {
      return {
        url: 'http://localhost/th5/public/admin_jurisdiction/Jurisdition/',
        tableData: [], // 左侧菜单容器
        menuData: [], // 右侧权限列表容器
        allMenuArr: [], // 初始菜单
        editJurDialog: false,
        haveJur: [],
        editJurData: [], // 穿梭框左侧容器
        editJurVal: [],  // 穿梭框右侧容器
        nowRoleId: '',   // 当前选中角色id
        transferTitle:['所有权限','现有权限'],
        defaultProps: {
          children: 'children',
          label: 'label'
        },
        btnText:['配置','移除'],
        jurTitle: '', // 权限列表标题
        currentRow:'', //当前选中行
        selectIndex: '', // 当前选中行下标
        mode: "transfer", // transfer addressList
      }
    },
    mounted () {
      let that = this;
      that.getJurisditionList('权限列表')
    },
    methods : {
      /**
       * [ 获取所有权限列表]
       */
      getJurisditionList(title){
        this.loadBack();
        this.jurTitle = title;
        this.$fetch(this.url+'getRoleList',{
        }).then(res => {
          if(res.code == 1){
            this.tableData = res.data.roleList;
            this.allMenuArr.push(res.data.jurList);
            this.menuData = [];
            this.getTree(res.data.jurList,this.menuData);
          }
        }).catch(error =>{
          console.log(error)
        })
      },
      /**
       * [getJurisdition 查看角色拥有权限列表]
       */
      getJurisdition (row) {
        var promise = new Promise((resolve,reject)=>{
          this.$fetch(this.url+'getJurisditionList',{nowId:row.id})
          .then((res)=>{
            if(res.data){
              let jurArr = res.data[0].menu_id;
              let newArr = jurArr.split(',');
              resolve(newArr.map(Number));
            }else{
              this.menuData = [];
              this.jurTitle = '暂无权限，请配置权限'
            }
          })
          .catch((err)=>{
            console.log(err)
          })
        });
        promise.then((res)=>{
          this.$fetch(this.url+'getJurisditionTree',{'idArr': JSON.stringify(res)})
          .then((response)=>{
            //只有当url1请求到数据后才会调用url2，否则等待
            if(response.code == 1){
              this.jurTitle = row.role_name+'权限';
              this.menuData = [];
              this.getTree(response.data,this.menuData);
            }else{
                alert(response.msg)
            }
          })
          .catch((err)=>{
            console.log(err)
          })
        })
      },
      /**
       * [getTree 树状结构生成]
       */
      getTree(jurArr,menuArr){
        for(let item in jurArr){
          if(jurArr[item].fid == 0){
            // 一级菜单
            let firstArr = {
              'id': jurArr[item].id,
              'label':  jurArr[item].label,
              children:[]
            };
            for (let x in jurArr){
              if(jurArr[x].fid == jurArr[item].id){
                // 一级菜单对应的二级菜单
                firstArr.children.push({
                  'id': jurArr[x].id,
                  'label':  jurArr[x].label
                })
              }
            }
            menuArr.push(firstArr)
          }
        }
      },
      /**
       * [getNowJurisdition 穿梭框获取当前角色权限]
       */
      getNowJurisdition (row) {
          this.loadBack();
          let menuArr = this.allMenuArr[0];
          this.nowRoleId = row.id;
          this.$fetch(this.url+'getJurisditionList',{nowId:row.id})
          .then(res => {
             this.editJurDialog = true;
            if(res.data){
              let nowJurArr = res.data[0].menu_id;
              let newArr = nowJurArr.split(',');
              let jurArr = newArr.map(Number);
              this.editJurVal = [];
              this.editJurData = [];
              
              let primaryArr  = {};
              // 左侧未配置权限列表渲染
              for(let item in menuArr){
                if(menuArr[item].fid == 0){
                  primaryArr = {
                    'id': menuArr[item].id,
                    'label': menuArr[item].label,
                    'disabled': menuArr[item].id == 1,
                    'pid': menuArr[item].fid,
                    children:[]
                  };
                  let flag = 0;
                  for(let i = 0;i < jurArr.length;i++){
                    if(jurArr[i]== menuArr[item].id){
                      flag = 1;
                    }
                  }
                  if(flag==1){
                    this.editJurVal.push(primaryArr);
                  }else{
                    this.editJurData.push(primaryArr);
                  }
                  for (let x in menuArr){
                    if(menuArr[item].id == menuArr[x].fid){
                      primaryArr.children.push({
                        'id': menuArr[x].id,
                        'label':  menuArr[x].label,
                        'pid': menuArr[x].fid,
                      })
                    }
                  }
                }

              }
            }
          }).catch(err => {   
            console.log(err)
          });
      },
      /**
       * [changeMode 切换穿梭框模式] 
       */ 
      changeMode() {
        if (this.mode == "transfer") {
          this.mode = "addressList";
        } else {
          this.mode = "transfer";
        }
      },
      /**
       * [addJur 穿梭框添加]
       */
      editHaveJur(fromData,toData,obj){
        let nowJur = [];
        this.haveJur = [];
        for(let x of toData){
          if(x.children.length > 0 && x.children instanceof Array){
            for(let v of x.children){
              nowJur.push(x.id,v.id)
            }
          }else{
            nowJur.push(x.id)
          }
        }
        this.haveJur.push(...nowJur);
      },
      /**
       * [handleClose 修改弹框关闭事件]
       */
      handleClose(done) {
        this.$confirm('是否保留更改？')
        .then(_ => {
          this.editJurisdition()
          done();
        })
        .catch(_ => {
          done();
        });
      },
      /**
       * [editJurisdition 修改角色权限]
       */
      editJurisdition(fromData,toData,obj){
        let staffJur = this.haveJur;
        this.$fetch(this.url+'editJurisdition',{'nowJurArr': JSON.stringify(staffJur),'nowRoleId': this.nowRoleId})
        .then(res => {
          let msgType = '';
          if(res.code == 1){
            msgType = 'success'
          }else{
            msgType = 'error'
          }
          this.editJurDialog = false;
          this.$message({
            showClose: true,
            message: res.msg,
            type: msgType
          });
        }).catch(err => {
          console.log(err)
        })
      },
      /**
       * [loadBack 事件触发延时]
       */
      loadBack() {
        const loading = this.$loading({
          lock: true,
          text: '客官稍等，马上就好',
          spinner: 'el-icon-loading',
          background: 'rgba(0, 0, 0, 0.7)'
        });
        setTimeout(() => {
          loading.close();
        }, 2000);
      },
    }
  } 
</script>
<style scoped>
  .topInfo{
    text-align:center;
    margin-top:20px;
    margin-bottom:20px;
    color:skyblue
  }
  .el-tree {
    position: relative;
    cursor: default;
    float: left;
    margin-left: 100px;
    border-radius: 10%;
  }
</style>
