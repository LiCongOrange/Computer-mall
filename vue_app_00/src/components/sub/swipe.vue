<template>
  <div class="app-swipe">
    <mt-swipe :auto="3000">
      <mt-swipe-item v-for="item in list" :key="item.id">
         <img :src="item.img_url" />
      </mt-swipe-item>
    </mt-swipe>
  </div>  
</template>
<script>
 export default {
   data(){
     return {
       //list:[]
     }
   },
   props:["list"] //接收父组件数据
 }
</script>
<style>
  .app-swipe .mint-swipe{ height:150px}
  .app-swipe .mint-swipe img{width:100%}
</style>