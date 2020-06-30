import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '../components/HelloWorld'
//买车页面
import BuyCar from '../components/BuyCar'
//拍卖页面
import auction from '../components/auction'

auction
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    { path: '/BuyCar', name: 'BuyCar', component: BuyCar },
    { path: '/auction', name: 'auction', component: auction },
  ]
})