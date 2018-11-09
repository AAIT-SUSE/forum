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
  </v-app>
</template>


<script>
  import HelloWorld from "./components/HelloWorld.vue"
  import SideMenu from './components/SideMenu.vue'
  import Toolbar from './components/Toolbar.vue'
  import Home from './views/home/Home.vue'

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
    methods: {}
  };

</script>
