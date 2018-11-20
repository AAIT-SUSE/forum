<template>
  <div id="loginWindow">
    <v-card
      class="mx-auto"
      width="550px"
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
              v-model="email"
              type="text"
              :error-messages="emailErrors"
              @input="$v.email.$touch()"
              @blur="$v.email.$touch()"
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

export default {
  data() {
    return {
      email: '',
      password: '',
      nextBtnText: '登录',
    }
  },
  validations: {
    email: {
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
      if (!this.$v.email.$dirty) return errors;
      !this.$v.email.email && errors.push('邮箱格式不正确');
      !this.$v.email.required && errors.push('这是一个必填项目');
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
      this.$v.email.touch()
      this.$v.password.touch()
    }
  }
}
</script>
