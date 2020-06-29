import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Goods from '@/components/Goods'
import AdminRole from '@/components/AdminRole'
import AdminEcharts from '@/components/AdminEcharts'
import AdminNotice from '@/components/AdminNotice'
<<<<<<< HEAD
=======
import AdminComplain from '@/components/AdminComplain'
>>>>>>> master

Vue.use(Router)

export default new Router({
    routes: [
        // {
        //     path: '/',
        //     name: 'Home',
        //     component: Home
        // },
        {
            path: '/goods',
            name: 'Goods',
            component: Goods
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
<<<<<<< HEAD
=======
        {
            path: '/AdminComplain',
            name: 'AdminComplain',
            component: AdminComplain
        },
>>>>>>> master
    ]
})