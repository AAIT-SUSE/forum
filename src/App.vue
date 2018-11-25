<template>
  <v-app style="background-color: white">
    <SideMenu v-if="isUserLogged"></SideMenu>

    <Toolbar v-if="isUserLogged"></Toolbar>
    
    <v-content>
      <v-layout v-if="isUserLogged">
        <router-view></router-view>
      </v-layout>
      <v-layout justify-center align-center fill-height v-if="!isUserLogged">
        <animated-bg></animated-bg>
        <login-panle style="z-index: 99" 
          v-if="currentPanel === 'login'" 
          :switchPanel="SwitchPanel"
          v-on:changeLoginStatus="ChangeLoginStatus"
        ></login-panle>
        <reg-panle style="z-index: 99" 
          v-if="currentPanel === 'reg'" 
          :switchPanel="SwitchPanel"
          v-on:changeLoginStatus="ChangeLoginStatus"
        ></reg-panle>
      </v-layout>
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
  import RegPanle from './components/Register.vue'
  import LoginPanle from './components/Login.vue'
  import router from './plugins/router/router.js'
  import AnimatedBg from './components/AnimatedBackground.vue'
  import globalData from './plugins/GlobalData'

  export default {
    name: "App",
    components: {
      SideMenu,
      Toolbar,
      LoginPanle,
      RegPanle,
      AnimatedBg
    },
    data() {
      return {
        toTopShow:false,
        title: "ENVISION - 因问",
        isUserLogged: false,
        currentPanel: 'login',
        currentBtnText: '没有账号？立即注册'
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
            _that.scrollTop -= 60
            //修改这里实现动画滚动效果
            document.body.scrollTop = document.documentElement.scrollTop = _that.scrollTop
            timer = requestAnimationFrame(fn)
          }else{
            cancelAnimationFrame(timer)
            _that.toTopShow = false
          }
        })
      },
      SwitchPanel: function(p) {
        this.currentPanel = p; 
      },
      CheckLoginState: function() {
        let storge = window.localStorage;
        if(storge.getItem('envision_username')) {
          this.isUserLogged = true;
          // router.push('/home');
          return true;
        } else {
          this.isUserLogged = false;
          return false;
        }
      },
      ChangeLoginStatus: function(userEmail, userId, userNickname) {
        this.isUserLogged = true;
        window.localStorage.setItem('envision_username', userEmail);
        window.localStorage.setItem('envision_userId', userId);
        window.localStorage.setItem('envision_nickname', userNickname);
        globalData.commit('SetUserId', userId);
        globalData.commit('SetNickname', userNickname);
        globalData.commit('SetEmail', userEmail);
        console.log("Login status is now changed. \nYour infos are: " + globalData.state.userId + "," + globalData.state.email + "," + globalData.state.nickname);
        router.push('/home');
      },
      InitUserProfile: function() {
        // 保存数据到全局变量
        let userId = window.localStorage.getItem('envision_userId');
        let nickname = window.localStorage.getItem('envision_nickname');
        let email = window.localStorage.getItem('envision_username');
        globalData.commit('SetUserId', userId);
        globalData.commit('SetNickname', nickname);
        globalData.commit('SetEmail', email);
      }
    },
    mounted() {
      // Check if there's valid data in client side
      if(this.CheckLoginState() === true) {
        this.InitUserProfile();
        router.push('/home');
      }
      this.$nextTick(function () {
        //修改事件监听
        window.addEventListener('scroll',this.handleScroll)
      });
      
      console.log(globalData.state.userId)
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
