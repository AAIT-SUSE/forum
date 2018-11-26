<template>
  <div>
    <v-toolbar app dark clipped-left>
      <v-toolbar-title v-text="title"></v-toolbar-title>
      <v-spacer></v-spacer>
      <div v-if="showToolbarActions === true">
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
          <v-btn icon to="" slot="activator" @click="dialog = true">
            <v-icon>exit_to_app</v-icon>
          </v-btn>
          <span>注销</span>
        </v-tooltip>
      </div>
    </v-toolbar>

    <v-dialog v-model="dialog" max-width="300">
      <v-card>
        <v-card-title class="headline">确认注销？</v-card-title>

        <v-card-text>
          注销后，你将结束当前会话。同时，Envision 将会要求你重新登录。
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" @click="dialog = false">
            取消
          </v-btn>
          <v-btn color="error darken-1" @click="dialog = false; Logout();">
            确认
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
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
        dialog: false,
      }
    },
    methods: {
      Logout: function() {
        window.localStorage.clear();
        this.$emit('CheckLoginStatus');
        router.go(0);
      }
    },
    props: {
      showToolbarActions: Boolean
    }
  }
</script>