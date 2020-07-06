import Vue from 'vue'
import Router from 'vue-router'

// 解决ElementUI导航栏中的vue-router在3.0版本以上重复点菜单报错问题
const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
// 首页
const Homepage = () =>
    import ('@/components/web/Homepage')

const Login = () =>
    import ('@/components/web/Login')
const Register = () =>
    import ('@/components/web/Register')

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
    routes: [{
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
            children: homeChild
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
    ]
})