import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Goods from '@/components/Goods'
import Chat from '@/components/Chat'
import Welcome from '@/components/Welcome'
import Users from '@/components/Users'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Welcome',
      component: Welcome
    },
    {
      path: '/goods',
      name: 'Goods',
      component: Goods
    },
    {
      path: '/chat',
      name: 'Chat',
      component: Chat
    },
    {
      path: '/users',
      name: 'Users',
      component: Users
    }
  ]
})
