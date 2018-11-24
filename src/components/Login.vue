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
              :error-messages="emailErrors"
              @input="$v.username.$touch()"
              @blur="$v.username.$touch()"
            ></v-text-field>
            <v-text-field
              label="密码"
              v-model="password"
              type="password"
              :error-messages="passwordErrors"
              @input="$v.password.$touch()"
              @blur="$v.password.$touch()"
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
import { required, email } from 'vuelidate/lib/validators'
import axios from 'axios'

export default {
  data() {
    return {
      username: '',
      password: '',
      nextBtnText: '登录',
    }
  },
  validations: {
    username: {
      required,
      email
    },
    password: {
      required,
    },
  },
  props: {
    switchPanel: Function,
  },
  computed: {
    emailErrors () {
      const errors = [];
      if (!this.$v.username.$dirty) return errors;
      !this.$v.username.email && errors.push('邮箱格式不正确');
      !this.$v.username.required && errors.push('这是一个必填项目');
      return errors;
    },
    passwordErrors () {
      const errors = [];
      if (!this.$v.password.$dirty) return errors;
      !this.$v.password.required && errors.push('这是一个必填项目');
      return errors;
    }
  },
  methods: {
    SubmitLoginForm: function() {
      this.$v.username.$touch();
      this.$v.password.$touch();
      let self = this;
      axios.post(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/login/`, {
        'e_mail': this.username,
        'password': this.password,
      }).
      then(function(response) {
        self.$emit('changeLoginStatus', this.username);//[response.data]
      }).
      catch(function(error) {
        console.log(error);
      });
    }
  }
}
</script>
