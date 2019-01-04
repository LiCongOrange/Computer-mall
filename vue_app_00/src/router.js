import Vue from 'vue'
import Router from 'vue-router'
import Test from "./components/Test.vue"
import list from "./components/listContainer.vue"
Vue.use(Router)
import Home from "./components/tabbar/HomeContainer.vue"
import NewsList from "./components/news/NewsList.vue"
import NewsInfo from "./components/news/NewsInfo.vue"
import GoodsList from "./components/goods/GoodsList.vue"
import GoodsInfo from "./components/goods/GoodsInfo.vue"
import Login from "./components/login/Login"
import Cart from "./components/tabbar/Cart"
import Search from "./components/tabbar/Search"
export default new Router({
  routes: [
    {path:'/',redirect:"/home"},
    {path:"/test",component:Test},
    {path:"/list",component:list},
    {path:"/home",component:Home},
    {path:"/newslist",component:NewsList},
    {path:"/newsinfo",component:NewsInfo},
    {path:"/goodslist",component:GoodsList},
    {path:"/goodsinfo/:id",component:GoodsInfo},
    {path:"/login",component:Login},
    {path:"/cart",component:Cart},
    {path:"/search",component:Search}
  ]
})
