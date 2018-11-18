<template>
  <v-app style="background-color: white">
    <SideMenu></SideMenu>

    <Toolbar></Toolbar>
    
    <v-content>
      <router-view></router-view>

    </v-content>
  
    <v-footer app dark>
      <span>&nbsp;&nbsp;&nbsp;
          Created With <v-icon color="red">favorite</v-icon> By Envision Team @ AAIT
      </span>
    </v-footer>
    <v-btn
      dark
      fab
      bottom
      right
      color="error"
      fixed
      @click="ScrollToTop()"
      v-show="toTopShow" 
    >
      <v-icon>keyboard_arrow_up</v-icon>
    </v-btn>
  </v-app>
</template>


<script>
  import SideMenu from './components/SideMenu.vue'
  import Toolbar from './components/Toolbar.vue'
  import Home from './views/Home.vue'

  export default {
    name: "App",
    components: {
      SideMenu,
      Toolbar,
      Home
    },
    data() {
      return {
        toTopShow:false,
        title: "ENVISION - 因问",
      };
    },
    methods: {
      handleScroll() {
        //修改相对滚动条位置
        this.scrollTop =  window.pageYOffset || document.body.scrollTop
        if(this.scrollTop > 100){
          this.toTopShow = true
        }else{
          this.toTopShow = false
        }
      },
      ScrollToTop() {
        let timer = null
        let _that = this
        //使用requestAnimationFrame代替setInterval
        cancelAnimationFrame(timer)
        timer = requestAnimationFrame(function fn() {
          if(_that.scrollTop > 0){
            _that.scrollTop -= 30
            //修改这里实现动画滚动效果
            document.body.scrollTop = document.documentElement.scrollTop = _that.scrollTop
            timer = requestAnimationFrame(fn)
          }else{
            cancelAnimationFrame(timer)
            _that.toTopShow = false
          }
        })
      }
    },
    mounted() {
      this.$nextTick(function () {
        //修改事件监听
        window.addEventListener('scroll',this.handleScroll)
      })
    },
    destroyed() {
      window.removeEventListener('scroll',this.handleScroll)
    }
  };

</script>

<style scoped>
body{
  background-color: white;
}
</style>
