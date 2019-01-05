<template>
  <div class="app-search">
<div class="mui-card">
<div class="mui-card-header">
 <input type="text" name="keyword" value="" v-model="keyword" placeholder="关键字"/>
</div>
<div class="mui-card-header">
<input type="number" name="low" v-model="low" placeholder="价格下限"/>
</div> 
<div class="mui-card-header">
<input type="number" name="high" v-model="high" placeholder="价格上限"/>
</div>
<div class="mui-card-header">
 <mt-button type="danger" @click="handleSearch">搜索</mt-button>
</div>                 
<div class="mui-card-content">
	<div class="mui-card-content-inner">
		 <ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.lid">
					<a href="javascript:;">
						<img class="mui-media-object mui-pull-left">
						<div class="mui-media-body">
							 {{item.lname}}
							<p class='mui-ellipsis'>
                 {{item.price}}
              </p>
						</div>
					</a>
				</li>
        </ul>


	</div>
</div>
				<div class="mui-card-footer">
        </div>
			</div>
  </div>  
</template>
<script>
 export default {
    data(){
      return {
        keyword:"",
        low:"",
        high:"",
        list:[]
      }
    },
    methods:{
      handleSearch(){
      //1:获取三个参数
       var kw = this.keyword;
       var low = this.low;
       var high = this.high;
       if(low == ""){
         low = 0;
       }
       if(high == ""){
         high = 2100000000;
       }
       //5:发送ajax
       var url = "http://127.0.0.1:3000/";
       url +="search?keyword="+kw;
       url +="&low="+low;
       url +="&high="+high;
       this.axios.get(url).then(result=>{
         this.list = result.data.data;
       })
      }
    }
 }  
</script>
<style>
</style>