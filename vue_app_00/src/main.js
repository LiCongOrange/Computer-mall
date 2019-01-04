import Vue from 'vue'
import App from './App.vue'
import router from './router'

import'mint-ui/lib/style.css'

Vue.config.productionTip = false
//5: 设置请求的根路径 

// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

//0.1 Vuex
import Vuex from "vuex"
Vue.use(Vuex)
var store = new Vuex.Store({
  state:{
    cartCount:0  
  },
  mutations:{
    increment(state,count){
       state.cartCount+=count
      },
    substract(state){ state.cartCount--},
    clear(state){ state.cartCount = 0}
  },
  getters:{
    optCartCount:function(state){
      return state.cartCount;
    }
  }
})
  


//1:引入mint-ui Header组件
import {Header,Swipe,SwipeItem} from "mint-ui"
//2:注册Header组件
Vue.component(Header.name,Header);
//3:注册Swipe/SwipeItem组件
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
import MintUI from "mint-ui";
Vue.use(MintUI)
//4:引入vue-resource 库
import VueResource from "vue-resource";
//5:注册vue-resource 库
Vue.use(VueResource)
//6:配置vue-resource常见属性
//6.1:设置请求服务器根目录
Vue.http.options.root = "http://127.0.0.1:3000/";
//6.2:全局设置post 时候表单 //application/x-www-form-urlencoded
//将提交数据进行转码操作 
Vue.http.options.emulateJSON = true;
//6.3
Vue.http.options.withCredentials = true;

//axios库
import axios from "axios"
axios.defaults.withCredentials = true;
Vue.prototype.axios=axios;


Vue.filter("datetimeFilter",function(val){
  var date = new Date(val);
  var y = date.getFullYear();
  var m = date.getMonth()+1;
  var d = date.getDate();
  var h = date.getHours();
  var mi =date.getMinutes();
  var s = date.getSeconds();
  m<10&&(m="0"+m);
  d<10&&(d="0"+d);
  return `${y}-${m}-${d} ${h}:${mi}:${s}`
})


new Vue({
  router,
  render: h => h(App),
  store
}).$mount('#app')
