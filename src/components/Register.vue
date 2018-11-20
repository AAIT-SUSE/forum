<template>
  <div id="regWindow">
    <v-card
      class="mx-auto"
      width="550px"
      raised
      dark
    >
      <v-card-title class="title font-weight-regular justify-space-between">
        <span>{{ currentTitle }}</span>
        <v-avatar
          color="primary lighten-2"
          class="subheading white--text"
          size="34"
          v-text="step + '/5'"
        ></v-avatar>
      </v-card-title>

      <v-window v-model="step">
        <v-window-item :value="1">
          <v-card-text>
            <v-text-field
              label="你的邮箱"
              placeholder="example@gmail.com"
              v-model="email"
              :error-messages="emailErrors"
              @input="$v.email.$touch()"
              @blur="$v.email.$touch()"
            ></v-text-field>
            <span class="caption grey--text text--darken-1">
              你所填写的邮箱将作为您登录 Envision 所需要的账户名称。
            </span>
          </v-card-text>
        </v-window-item>

        <v-window-item :value="2">
          <v-card-text>
            <v-text-field
              label="密码"
              v-model="password"
              type="password"
              :error-messages="passwordErrors"
              @input="$v.password.$touch()"
              @blur="$v.password.$touch()"
            ></v-text-field>
            <v-text-field
              label="确认密码"
              v-model="confirmPassword"
              type="password"
              :error-messages="repeatPasswordErrors"
              @input="$v.confirmPassword.$touch()"
              @blur="$v.confirmPassword.$touch()"
            ></v-text-field>
            <span class="caption grey--text text--darken-1">
              为你的账户创建一个密码。你需要使用此密码进行登录，请妥善保管。
            </span>
          </v-card-text>
        </v-window-item>

        <v-window-item :value="3">
          <v-card-text>
            <v-text-field
              label="真实姓名"
              v-model="realname"
              :error-messages="realnameErrors"
              @input="$v.realname.$touch()"
              @blur="$v.realname.$touch()"
            ></v-text-field>
            <v-text-field
              label="专业"
              v-model="majors"
              :error-messages="majorsErrors"
              @input="$v.majors.$touch()"
              @blur="$v.majors.$touch()"
            ></v-text-field>
            <v-layout grid-list-md>
              <v-flex xs12 sm12 md6 lg6 xl6 class="mr-1">
                <v-select
                  :items="years"
                  label="年级"
                  :error-messages="yearsErrors"
                  @input="$v.years.$touch()"
                  @blur="$v.years.$touch()"
                ></v-select>
              </v-flex>
              <v-flex xs12 sm12 md6 lg6 xl6 class="ml-1">
                <v-select
                  :items="classes"
                  label="班级"
                  :error-messages="classesErrors"
                  @input="$v.classes.$touch()"
                  @blur="$v.classes.$touch()"
                ></v-select>
              </v-flex>
            </v-layout>
            <v-select
              :items="depts"
              label="所属部门"
              :error-messages="deptsErrors"
              @input="$v.depts.$touch()"
              @blur="$v.depts.$touch()"
            ></v-select>
            <span class="caption grey--text text--darken-1">
              为了验证你的身份，你需要填写以上信息。您稍后可以选择是否在您的个人面板中展示这些信息
            </span>
          </v-card-text>
        </v-window-item>

        <v-window-item :value="4">
          <v-card-text>
            <v-flex sm12 xs12 md12 lg12 xl12 justify-center align-center layout>
              <v-avatar size="130">
                <img :src="randomSrc" alt="avatar">
              </v-avatar>
            </v-flex>
            <br>
            <span class="caption grey--text text--darken-1">
              对头像不满意？点击下面的按钮随机更换一个。你可能需要等待几秒，图片才能完成载入。
            </span>
          </v-card-text>
        </v-window-item>


        <v-window-item :value="5">
          <div class="pa-3 text-xs-center">
            <h3 class="title font-weight-light mb-2">感谢您使用 Envision</h3>
            <span class="caption grey--text">您的账号已经创建成功，点击下一步载入应用</span>
          </div>
        </v-window-item>
      </v-window>

      <v-divider></v-divider>

      <v-card-actions>
        <v-btn
          :disabled="step === 1"
          flat
          @click="step--"
        >
          上一步
        </v-btn>
        <v-spacer v-if="step === 4 || step === 1"></v-spacer>
        <v-btn v-if="step === 4" color="error" @click="GetAvatar()">换一个头像</v-btn>
        <v-btn v-if="step === 1" outline color="white" @click="switchPanel('login')">已有账号，直接登录</v-btn>
        <v-spacer></v-spacer>
        <v-btn
          color="primary"
          depressed
          @click="NextStep()"
        >
          {{nextBtnText}}
        </v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
import { required, sameAs, minLength, email } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
      step: 1,
      randomSrc: 'https://api.adorable.io/avatars/130/abott@adorable.png',
      email: '',
      password: '',
      confirmPassword: '',
      majors: '',
      realname: '',
      nextBtnText: '下一步',
      years: ['2015级', '2016级', '2017级', '2018级', '教师'],
      classes: ['教研组', '1班', '2班', '3班', '4班', '5班', '6班', '7班', '8班', '卓越班'],
      depts: ['会员', '游客', '理事会', '软件开发技术部', '机器人技术部', '嵌入式技术部', '办公室', '宣传策划部', '机器人技术部', '学习实践部', '退休办'],
    }
  },
  validations: {
    email: {
      required,
      email
    },
    password: {
      required,
      minLength: minLength(6)
    },
    confirmPassword: {
      required,
      sameAsPassword: sameAs('password')
    },
    majors: {
      required
    },
    realname: {
      required
    },
    years: {
      required
    },
    classes: {
      required
    },
    depts: {
      required
    }
  },
  props: {
    switchPanel: Function,
  },
  computed: {
    currentTitle () {
      switch (this.step) {
        case 1: return '注册';
        case 2: return '创建密码';
        case 3: return '填写个人信息';
        case 4: return '选择一个头像';
        default: return '完成创建'
      }
    },
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
      !this.$v.password.minLength && errors.push('密码长度必须大于 6 个字符');
      !this.$v.password.required && errors.push('这是一个必填项目');
      return errors;
    },
    repeatPasswordErrors () {
      const errors = [];
      if (!this.$v.confirmPassword.$dirty) return errors;
      !this.$v.confirmPassword.sameAsPassword && errors.push('前后两次输入的密码不一致');
      !this.$v.confirmPassword.required && errors.push('这是一个必填项目');
      return errors;
    },
    realnameErrors () {
      const errors = [];
      if (!this.$v.realname.$dirty) return errors;
      !this.$v.realname.required && errors.push('这是一个必填项目');
      return errors;
    },
    majorsErrors () {
      const errors = [];
      if (!this.$v.realname.$dirty) return errors;
      !this.$v.realname.required && errors.push('这是一个必填项目');
      return errors;
    },
    yearsErrors () {
      const errors = []
      if (!this.$v.years.$dirty) return errors
      !this.$v.years.required && errors.push('这是一个必填项目')
      return errors
    },
    classesErrors () {
      const errors = []
      if (!this.$v.classes.$dirty) return errors
      !this.$v.classes.required && errors.push('这是一个必填项目')
      return errors
    },
    deptsErrors () {
      const errors = []
      if (!this.$v.depts.$dirty) return errors
      !this.$v.depts.required && errors.push('这是一个必填项目')
      return errors
    }

  },
  methods: {
    NextStep: function() {
      switch(this.step) {
        case 1: 
          this.$v.email.$touch()
          if(!this.$v.email.$invalid) {
            this.step++;
          }
        break;
        case 2: 
          this.$v.password.$touch()
          this.$v.confirmPassword.$touch()
          if(!this.$v.password.$invalid && !this.$v.confirmPassword.$invalid) {
            this.step++
          }
        break;
        case 3: 
          this.$v.realname.$touch()
          this.$v.majors.$touch()
          this.$v.years.$touch()
          this.$v.classes.$touch()
          this.$v.depts.$touch()
          if(!this.$v.realname.$invalid && !this.$v.majors.$invalid &&
             !this.$v.years.$invalid && !this.$v.classes.$invalid && !this.$v.depts.$invalid) {
            this.step++
          }
        break;
        case 4: 
          this.step++
        break;
        case 5: 
          this.SubmitRegisterForm();
        break;
      }
    },
    GetAvatar: function(){
      let randomHash = Math.random().toString(36).substr(2);
      this.randomSrc = 'https://api.adorable.io/avatars/130/' + randomHash;
    },
    SubmitRegisterForm: function() {

    }
  }
}
</script>
