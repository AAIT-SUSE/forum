<template>
  <v-app>
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
    >
      <v-icon>keyboard_arrow_up</v-icon>
    </v-btn>
  </v-app>
</template>


<script>
  import HelloWorld from "./components/HelloWorld.vue"
  import SideMenu from './components/SideMenu.vue'
  import Toolbar from './components/Toolbar.vue'
  import Home from './views/Home.vue'

  export default {
    name: "App",
    components: {
      HelloWorld,
      SideMenu,
      Toolbar,
      Home
    },
    data() {
      return {
        title: "ENVISION - 因问",
      };
    },
    methods: {
      ScrollToTop: function() {
        alert("前端请安排人写一下滚动返回顶部的函数。目前这里直接回到页面顶部，没有动画效果，比较生硬");
        document.documentElement.scrollTop = 0;  
      }
    }
  };

</script>
