<template>
  <div class="app-newlist">
   <ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.id">
					<router-link :to="'/newsinfo?id='+item.id">
						<img class="mui-media-object mui-pull-left" :src="item.img_url">
						<div class="mui-media-body">
							{{item.title}}
							<p class='mui-ellipsis'>
                <span>{{item.ctime | datetimeFilter}}</span>
                <span>点击：{{item.point}} 次</span>
              </p>
						</div>
					</router-link>
				</li>
     </ul>
     <mt-button type="primary" size="large" @click="getMore">加载更多 </mt-button>
  </div>  
</template>
<script>
 export default {
   data(){
     return {
       list:[],
       pno:0,
       pageSize:7,
       pageCount:1
     }
   },
   methods:{
      getMore(){
        this.pno++;
        var hasMore = this.pno <= this.pageCount
        if(!hasMore){return}
        var url = "newslist?pno="+this.pno+"&pageSize="+this.pageSize
        this.$http.get(url).then(result=>{
          //this.list = result.body.data;
          var rows = this.list.concat(result.body.data);
          this.list = rows;
          this.pageCount = result.body.pageCount
        })
      }
   },
   created() {
     this.getMore();
   },
 }
</script>
<style>
.app-newlist .mui-table-view li 
.mui-ellipsis{
  display:flex;
  font-size:12px;
  color:#226aff;
  justify-content:space-between;
}
</style>