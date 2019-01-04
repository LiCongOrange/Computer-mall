<template>
    <div class="app-newinfo">
        <h3>{{info.title}}</h3>
        <textarea readonly>{{info.content}}</textarea>
        <div class="x">
        <h3>{{info.ctime | datetimeFilter}}</h3>
        <h3>点击：{{info.point}} 次</h3>
        </div>
        <comment-box :id="id"></comment-box>
    </div>
</template>
<script>
import comment from '../sub/comment.vue'
    export default {
        data(){
            return {info:{},id:this.$route.query.id}
        },
        created(){
            this.getNewsInfo();
        },
        methods:{
            getNewsInfo(){
                var id = this.$route.query.id;
                this.$http.get("newsinfo?id="+id).then(
                    result=>{
                        this.info = result.body.data[0];
                    })
            }
        },components:{
            "comment-box":comment
        }
    }
</script>
<style>
.app-newinfo .x{
  display:flex;
  font-size:12px;
  color:#226aff;
  justify-content:space-between;
}
</style>