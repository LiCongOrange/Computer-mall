<template>
    <div class="app-goodslist">
        <div class="goods-item" v-for="item in list" :key="item.id">
            <img :src="item.img_url" @click="jumpDetail" :data-id="item.id">
            <h3 class="title">{{item.title}}</h3>
            <div class="info">
                <p class="price">
                    <span class="now">{{item.now}}</span>
                    <span class="old">{{item.old}}</span>
                </p>
                <p class="sell">
                    <span>热卖中</span>
                    <span>剩 1 件</span>
                </p>
            </div>
        </div>
    </div>

</template>
<script>
    export default {
        created() {
            this.getMore();
        },
        methods:{
            getMore(){
                var url = "goodslist";
                this.$http.get(url).then(result=>{
                    this.list = result.body;
                });
            },
            jumpDetail(even){
               var id = even.target.dataset.id;
               this.$router.push("/goodsinfo/"+id);
            }
        },
        data(){
            return {
                list:[],
            }
        }
    }
</script>
<style>
    .app-goodslist{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        padding:7px;
    }
    .app-goodslist .goods-item{
        width:49%;
        border:1px solid #ccc;
        box-shadow: 0 0 8px #ccc;
        margin:4px 0 ;
        padding:2px;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
        min-height:210x;
    }
    .app-goodslist .goods-item img{
        width:100%;
    }
    .app-goodslist .goods-item .now{
        color:red;
        font-weight:bold;
        font-size:16px;
    }
    .app-goodslist .goods-item .old{
        font-size:12px;
        text-decoration:line-through;
        margin-left:10px;
    }
</style>