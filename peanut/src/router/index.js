import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Goods from '@/components/Goods'
import StaffManage from '@/components/StaffManage'
import Jurisdic from '@/components/Jurisdiction'
import Order from '@/components/Order'

Vue.use(Router)

export default new Router({
  routes: [
    // {
    //   path: '/',
    //   name: 'Home',
    //   component: Home
    // },
    {
      path: '/goods',
      name: 'Goods',
      component: Goods
    },
    {
      path: '/staffManage',
      name: 'staffManage',
      component: StaffManage
    },
    {
      path: '/jurisdic',
      name: 'jurisdic',
      component: Jurisdic
    },
    {
      path: '/order',
      name: 'order',
      component: Order
    }
  ]
})
