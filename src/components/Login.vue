<template>
  <div id="loginWindow">
    <v-card
      max-width="400px"
      raised
      dark
    >
      <v-card-title class="title font-weight-regular justify-space-between">
        <span>登录 Envision</span>
      </v-card-title>

      <v-window>
        <v-window-item>
          <v-card-text>
            <v-text-field
              label="邮箱"
              v-model="username"
              type="text"
            ></v-text-field>
            <v-text-field
              label="密码"
              v-model="password"
              type="password"
            ></v-text-field>
            <span class="caption grey--text text--darken-1">
              输入正确的账号密码以登录 Envision. <a href="#" style="color: white">忘记密码？</a>
            </span>
          </v-card-text>
        </v-window-item>
      </v-window>

      <v-divider></v-divider>

      <v-card-actions>
        <v-btn outline color="white" @click="switchPanel('reg')">没有账号，切换注册</v-btn>
        <v-spacer></v-spacer>
        <v-btn
          color="primary"
          depressed
          @click="SubmitLoginForm()"
        >
          {{nextBtnText}}
        </v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
import axios from 'axios'
import globalData from '../plugins/GlobalData';

export default {
  data() {
    return {
      username: '',
      password: '',
      nextBtnText: '登录',
    }
  },
  props: {
    switchPanel: Function,
  },
  methods: {
    SubmitLoginForm: function() {
      let self = this;
      let username = this.username;
      axios.post(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/login/`, {
        'e_mail': username,
        'password': self.password,
      }).
      then(function(response) {
        self.$emit('changeLoginStatus', username);
        globalData.commit('SetUserId', response.data.id);
        console.log(globalData.state.userId)
      }).
      catch(function(error) {
        console.log(error);
      });
    }
  },
}
</script>
