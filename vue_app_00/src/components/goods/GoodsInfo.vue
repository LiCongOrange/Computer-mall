<template>
 <div class="app-goodsinfo">
    <!--轮播图卡片-->
    <div class="mui-card">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<swiper-box :list="list"></swiper-box>
					</div>
				</div>
		</div>
    <!--商品信息-->  
    <div class="mui-card">
				<div class="mui-card-header">
          商品名称
        </div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<p class="price">
              市场价:<del>2999.00</del>
              销售价:<span class="now">2111.00</span>
            </p>
            购买数量:
        <div class="mui-numbox">
				 	<button class="mui-btn mui-btn-numbox-minus" type="button" @click="goodSub">-</button>
					<input class="mui-input-numbox" type="number" value="1" v-model="val" readonly/>
					<button class="mui-btn mui-btn-numbox-plus" type="button" @click="goodAdd">+</button>
				</div>
					</div>
				</div>
				<div class="mui-card-footer">
          <mt-button type="primary" size="small">立即购买</mt-button>
          <mt-button type="danger" size="small"
           @click="addCart">加入购物车</mt-button>
        </div>
			</div>
    <!--商品参数-->     
 </div>
</template>
<script>
  //1:引入轮播图子组件 
  import swipe from "../sub/swipe.vue"
  import {Toast} from "mint-ui"
  //2:引入 mui.js库
  //import mui from  "../../lib/mui/js/mui.js"
  export default {
    created() {
      //console.log(this.$route.params.id);
      this.getImages();
    },
    data(){
       return {
         nid:this.$route.params.id,
         list:[],
         val:1
       }
    },
    methods:{
       addCart(){
         //1:获取参数 pid count uid
         var pid = this.$route.params.id; 
         var count = this.val;
         var uid = 3;
         //2:发送请求
         var url = "http://127.0.0.1:3000";
         url +="/addCart?pid="+pid+"&count=";
         url +=count+"&uid="+uid;
         this.axios.get(url).then(result=>{
            if(result.data.code == 1){
              this.$store.commit("increment",count);
              Toast("购物车添加成功");
            }else{
              Toast("购物车添加失败");
            }
         });
         //3:如果请示成功提示
       },
       goodSub(){
         if(this.val > 1){
            this.val--
         }
       },
       goodAdd(){
         if(this.val <=998){
            this.val++
         }
       },
       getImages(){
         var url = "http://127.0.0.1:3000/imagelist";
         this.axios.get(url).then(result=>{
             this.list = result.data; 
         })
       }
    },
     components:{
       "swiper-box":swipe
     }
  }

</script>
<style>
</style>