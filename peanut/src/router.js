// 配置路由规则
// 	配置 不同的网页地址 ，加载不同的组件
import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
//组件模块

import Homepage from './Homepage';
 
Vue.use(Router)
 
export default new Router({
  routes: [
    { path: '/', name: 'Homepage', component: Homepage },
  ]
})		