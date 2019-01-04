<!--src/components/sub/comment.vue-->
<template>
  <div class="app-comment">
    <h3>评论子组件</h3>
    <!--发表评论区域-->
    <textarea placeholder="请吐槽最多120个字" maxlength="120" v-model="msg"></textarea>
    <mt-button size="large" @click="postComment">发表评论</mt-button>
    <!--显示评论区域-->  
    <div class="cmt-list">
      <div class="cmt-item" v-for="(item,i) in list" :key="item.id">
          <div class="cmt-info">
            第 {{i+1}} 楼: 用户名:{{item.user_name}}
            发表时间:{{item.ctime | datetimeFilter}}
            <div class="cmt-body">
                {{item.content}}
            </div>
          </div>
      </div>
    </div>
    <mt-button size="large" @click="getMore">加载更多</mt-button>  
  </div>
</template>
<script>
  //单独引入mini-ui 组件Toast 其它组件不用
  import {Toast} from "mint-ui"
  //如果在当前组件使用不用注册
  export default {
    created() {
        this.getMore();
    },
    methods:{
       postComment(){
         //1:获取用户输入内容,新闻编号,用户名
         var msg = this.msg;//评论内容
         var nid = this.id; //父元素传递新闻编号
         //var user_name = "匿名";
         //2:判断如果评论内容为空
         var size = msg.trim().length;
         //3:提示评论内容不能为空
         if(size==0){
           Toast("评论内容不能为空");
           return; //停止函数执行
         }
         //4:发送post请求
        //  var url = "addComment";
        //  var obj = {nid:nid,user_name:user_name,
        //  content:msg};
        //  //5:成功提示评论发表成功
        //  this.$http.post(url,obj).then(result=>{
        //    var obj = result.body;
        //    //6:提示发表成功
        //    if(obj.code == 1){
        //      Toast("评论发表成功");
        //     //7:显示最新一页数据
        //      this.pno =  0;
        //      this.list = [];
        //      this.getMore();
        //    }else{
        //      Toast("评论发表失败");
        //    }
        //  })
        var url = "http://127.0.0.1:3000/addComment";
        var param = `nid=${nid}&content=${msg}`;
        this.axios.post(url,param).then(result=>{
            if(result.data.code == 1){
                Toast("评论成功");
                this.pno = 0;
                this.list = [];
                this.getMore();
            }else{
                Toast("评论发表失败");
            }
        })
       },
       getMore(){
        //1:发送请求获取评论列表 nid
        var nid = this.id; //新闻id
        this.pno++;        //页码自增 初始0
        var pno = this.pno;//当前页码
        var pageSize = this.pageSize;//页大小
        var url = "getcomment?pno="+pno;
        url +="&nid="+nid+"&pageSize="+pageSize;
        this.$http.get(url).then(result=>{
          //将查询结追加list数组 14:19
          var rows = this.list.concat(result.body.data);
          this.list = rows;
        });
        //2:追加 list
        //3:在模板中创建循环显示当前评//论列表
        //4:楼层 1 2 3 4
        //5:在模板中添加 "加载更多"按钮
        //6:点击事件
       }
    },
    data(){
      return {
        list:[],     //当前页内容
        pno:0,       //页码
        pageSize:7,  //页大小
        pageCount:1, //总页数
        msg:""       //评论内容双向绑定
      }
    },
    props:["id"]
  }
</script>
<style>
  .app-comment h3{
    font-size:18px;   /*标题*/
  }
  .app-comment textarea{/*评论组件多行文本框*/
    font-size:14px;   /*字体小一些*/
    height:68px;      /*高度*/
    margin:0;
  }
  .app-comment .cmt-list{/*显示评论列表*/
    margin:5px 0;
  }
  .app-comment .cmt-list .cmt-item{
    border:1px solid #aaa;/*评论项*/
    margin-top:15px;
  }
  .app-comment .cmt-list .cmt-info{
    line-height:30px;    /*评论内容*/
    background:#ccc;
  }
</style>