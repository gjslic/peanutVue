import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '../components/HelloWorld'
import AddLoginRegister from '../components/AddLoginRegister'
import AddPersonalCenter from '../components/AddPersonalCenter'
import AddSellingCars from '../components/AddSellingCars'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/AddLoginRegister',
      name: 'AddLoginRegister',
      component: AddLoginRegister
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
    }
  ]
})
