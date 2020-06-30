import Vue from 'vue'
import Router from 'vue-router'
const Home = () => import('@/components/admin/Home')
const AdminLogin = () => import('@/components/admin/AdminLogin')
import homeChild from './home'
Vue.use(Router)

export default new Router({
  routes: [
    
    
    {
      path: '/AdminLogin',
      name: 'AdminLogin',
      component: AdminLogin
    },
    
    {
      path: '/home',
      name: 'Home',
      component: Home,
      children:homeChild 
    },

  ]
})
