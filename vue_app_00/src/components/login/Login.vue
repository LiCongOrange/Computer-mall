<template>
    <div class="app-login">
        <div class="mui-card">
				<div class="mui-card-header"><h3>用户登录</h3></div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						
                            用户名：<input type="text" value="" placeholder="请输入用户名" v-model="uname">
                            密码：<input type="password" calue="" placeholder="请输入密码" v-model="upwd">
                            <mt-button size="large" @click="handleLogin">登录</mt-button>
                        
					</div>
				</div>
				<div class="mui-card-footer">页脚</div>
			</div>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return {
                uname:"",
                upwd:""
            }
        },
        methods:{
            handleLogin(){
                var u = this.uname;
                var p = this.upwd;
                // var url = "login?uname="+u;
                // url+="&upwd="+p
                // this.$http.get(url).then(result=>{
                //    var obj = result.body;
                //    if(obj.code == -1){
                //        Toast(obj.msg);
                //    }else{
                //        this.$router.push("/home");
                //    }
                // });
                var url = "http://127.0.0.1:3000/";
                url +="login?uname="+u+"&upwd="+p;
                this.axios.get(url).then(result=>{
                    if(result.data.code == 1){
                        this.$router.push("/home");
                    }else{
                        Toast("用户名或密码有误")
                    }
                })
            }
        }
    }
</script>