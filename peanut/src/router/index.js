import Vue from 'vue'
import Router from 'vue-router'
<<<<<<< HEAD
=======
import Home from '@/components/Home'
import Goods from '@/components/Goods'
import Chat from '@/components/Chat'
import Welcome from '@/components/Welcome'
import Users from '@/components/Users'
import StaffManage from '@/components/StaffManage'
import Jurisdic from '@/components/Jurisdiction'
import Order from '@/components/Order'
import AdminRole from '@/components/AdminRole'
import AdminEcharts from '@/components/AdminEcharts'
import AdminNotice from '@/components/AdminNotice'
import AdminComplain from '@/components/AdminComplain'
>>>>>>> dfd19563cf830a90e5752582917e16b01ba524c8

// 解决ElementUI导航栏中的vue-router在3.0版本以上重复点菜单报错问题
const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
// 首页
const Homepage = () =>
    import ('@/components/web/Homepage')

const Login = () => import('@/components/web/Login')
const Register = () => import('@/components/web/Register')
const Retrieve = () => import('@/components/web/Retrieve')

const AddPersonalCenter = () =>
    import ('@/components/web/AddPersonalCenter')
const AddSellingCars = () =>
    import ('@/components/web/AddSellingCars')
    //买车页面
const BuyCar = () =>
    import ('@/components/web/BuyCar')
    //拍卖页面
const auction = () =>
    import ('@/components/web/auction')

const Home = () =>
    import ('@/components/admin/Home')
const AdminLogin = () =>
    import ('@/components/admin/AdminLogin')
    //浮动公告页面
const Ad = () =>
    import ('@/components/web/Ad')
import homeChild from './home'
Vue.use(Router)

export default new Router({
  routes: [
<<<<<<< HEAD
<<<<<<< HEAD
    { 
      path: '/', 
      name: 'Homepage', 
      component: Homepage 
    },
    
    
    {
      path: '/AdminLogin',
      name: 'AdminLogin',
      component: AdminLogin
    },
    {
      path: '/Login',
      name: 'Login',
      component: Login
    },
    {
      path: '/Register',
      name: 'Register',
      component: Register
    },
    {
      path: '/Retrieve',
      name: 'Retrieve',
      component: Retrieve
    },

    {
      path: '/AddPersonalCenter',
      name: 'AddPersonalCenter',
      component: AddPersonalCenter
    },
    {
      path: '/AddSellingCars',
      name: 'AddSellingCars',
      component: AddSellingCars
    },
    {
      path: '/home',
      name: 'Home',
      component: Home,
      children:homeChild 
    },
    { 
      path: '/BuyCar', 
      name: 'BuyCar', 
      component: BuyCar
    },
    { 
      path: '/auction', 
      name: 'auction', 
      component: auction 
    },
    {
      path: '/Ad',
      name: 'Ad',
      component: Ad
  }
=======
=======
>>>>>>> dfd19563cf830a90e5752582917e16b01ba524c8
    // {
    //   path: '/',
    //   name: 'Home',
    //   component: Home
    // },
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
    },
    {
      path: '/AdminRole',
      name: 'AdminRole',
      component: AdminRole
    },
    {
      path: '/AdminEcharts',
      name: 'AdminEcharts',
      component: AdminEcharts
    },
    {
      path: '/AdminNotice',
      name: 'AdminNotice',
      component: AdminNotice
    },
    {
      path: '/AdminComplain',
      name: 'AdminComplain',
      component: AdminComplain
    },
    {
      path: '/order',
      name: 'order',
      component: Order
    }
<<<<<<< HEAD
>>>>>>> dfd19563cf830a90e5752582917e16b01ba524c8
=======
>>>>>>> dfd19563cf830a90e5752582917e16b01ba524c8
  ]
})
