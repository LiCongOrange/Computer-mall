<template>
    <div class="app-home">
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="item in list" :key="item.id">
                <img :src="item.img_url" alt=""/>
            </mt-swipe-item>
        </mt-swipe>
        <ul class="mui-table-view mui-grid-view mui-grid-9">
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/newslist">
		                    <img src="../../img/menu1.png">
		                    <div class="mui-media-body">新闻资讯</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/goodslist">
		                    <img src="../../img/menu3.png">
		                    <div class="mui-media-body">商品</div></router-link></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
		                    <img src="../../img/menu2.png">
		                    <div class="mui-media-body">点餐</div></a></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
		                    <img src="../../img/menu4.png">
		                    <div class="mui-media-body">图片列表</div></a></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
		                    <img src="../../img/menu5.png">
		                    <div class="mui-media-body">成功</div></a></li>
		            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
		                    <img src="../../img/menu6.png">
		                    <div class="mui-media-body">列表</div></a></li>
		        </ul>    
    </div>
</template>
<script>
    export default {
        data () {
            return {
                list:[]
            }
        },
        methods:{
            getImage(){
                var url = "http://127.0.0.1:3000/imagelist";
                this.$http.get(url).then(result=>{
                    this.list = result.body;
                })
            }
        },
        created() {
            this.getImage();
        },
    }
</script>
<style>
    .app-home .mint-swipe{
        height:150px;
    }
    .app-home .mint-swipe img{
        width:100%;
    }
    /* 调整六宫格*/
    .app-home .mui-grid-view.mui-grid-9{
        background:#fff;
        border:0;
    }
    .app-home .mui-grid-view.mui-grid-9 li{
        border:0;
    }
    .app-home .mui-grid-view.mui-grid-9 img{
        width:60px;
        height:60px;
    }
    .app-home .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
        font-size:13px;
    }
</style>