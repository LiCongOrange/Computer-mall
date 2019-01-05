<template>
    <div class="app-home">
        <div class="d2">
            <form>
                <input type="text" name="keyword" value="" class="ipt"  placeholder="搜索从这里开始"/>
                <button type="submit"></button>
            </form>
        </div>
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
        height:190px;
        margin-bottom: 10px;
    }
    .app-home .mint-swipe img{
        width:100%;
        height:100%
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
        width:50px;
        height:50px;
    }
    .app-home .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
        font-size:13px;
    }
    .ipt{
        margin-bottom: 10px !important;
        width: 100% !important;
    height: 35px !important;
    padding-left: 10px !important;
    border: 2px solid #7BA7AB !important;
    border-radius: 5px !important;
    outline: none !important;
    
    color: #9E9C9C !important;
    }
    .d2 button:before {
    content: "\f105";
    font-family: FontAwesome;
    color: #F9F0DA;
    position: absolute;
    top: 3px;
    right: 8px;

    font-weight: bold;
}
form {
    position: relative;
    width: 100%;

}
.d2 button {
        height: 26px;
    width: 26px;
    position: absolute;
    top: 5px;
    right: 8px;
    background: #1b9bef;
    cursor: pointer;

}
</style>