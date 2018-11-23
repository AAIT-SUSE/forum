<template>
<div>
  <v-toolbar app dark clipped-left>
    <v-toolbar-title v-text="title"></v-toolbar-title>
    <v-spacer></v-spacer>
    <v-tooltip bottom>
      <v-btn icon to="/notifications" slot="activator">
        <v-icon>textsms</v-icon>
      </v-btn>
      <span>消息与通知</span>
    </v-tooltip>
    <v-tooltip bottom>
      <v-btn icon to="" slot="activator">
        <v-icon>settings</v-icon>
      </v-btn>
      <span>个人设置</span>
    </v-tooltip>
    <v-tooltip bottom>
      <v-btn icon to="" slot="activator" @click="Logout()">
        <v-icon>exit_to_app</v-icon>
      </v-btn>
      <span>注销</span>
    </v-tooltip>
  </v-toolbar>
</div>
  
  
</template>

<script>
  import router from '../plugins/router/router';

  export default {
    name: 'Toolbar',
    data() {
      return {
        userThemeColor: 'warning',
        title: 'Envision - 因问',
        dialogInfo: false,
      }
    },
    methods: {
      Logout: function() {
        window.localStorage.clear();
        this.$emit('CheckLoginStatus');
        router.go(0);
      }
    }
  }
</script>