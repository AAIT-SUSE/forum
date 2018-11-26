<template>
  <div id="regWindow">
    <v-card
      max-width="400px"
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
            <v-text-field
              label="你的昵称"
              v-model="nickname"
              :error-messages="nicknameErrors"
              @input="$v.nickname.$touch()"
              @blur="$v.nickname.$touch()"
            ></v-text-field>
            <span class="caption grey--text text--darken-1">
              你所填写的邮箱将作为您登录 Envision 所需要的账户名称，你为自己选取的昵称将作为你在Envision社区中使用的虚拟名字
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
            <v-text-field
              label="QQ号码"
              v-model="qqNumber"
              :error-messages="qqNumberErrors"
              @input="$v.qqNumber.$touch()"
              @blur="$v.qqNumber.$touch()"
            ></v-text-field>
            <v-layout grid-list-md>
              <v-flex xs12 sm12 md6 lg6 xl6 class="mr-1">
                <v-select
                  :items="years"
                  v-model="year"
                  label="年级"
                  :error-messages="yearsErrors"
                  @input="$v.year.$touch()"
                  @blur="$v.year.$touch()"
                ></v-select>
              </v-flex>
              <v-flex xs12 sm12 md6 lg6 xl6 class="ml-1">
                <v-select
                  :items="classes"
                  v-model="uClass"
                  label="班级"
                  :error-messages="classesErrors"
                  @input="$v.uClass.$touch()"
                  @blur="$v.uClass.$touch()"
                ></v-select>
              </v-flex>
            </v-layout>
            <v-select
              :items="depts"
              v-model="dept"
              label="所属部门"
              :error-messages="deptsErrors"
              @input="$v.dept.$touch()"
              @blur="$v.dept.$touch()"
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
              对头像不满意？点击下面的按钮随机更换一个。你可能需要等待几秒，图片才能载入。<br>
              若要保存头像到本地，在头像上单击鼠标右键，选择“图片另存为”。
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
    <v-dialog v-model="errorDialog" max-width="400">
      <v-card>
        <v-card-title class="headline">未知错误</v-card-title>

        <v-card-text>
          <p>发生了未知错误。很抱歉，我们并不知道发生了什么。</p>
          <p>请你将这个页面截图，或者将下面的代码发送给@蔡仲晨 和 @邓文义进行分析。</p>
          <p>{{errorInfomation}}</p>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="primary darken-2" @click="errorDialog = false">好</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { required, sameAs, minLength, email, maxLength } from 'vuelidate/lib/validators'
import axios from 'axios'
import globalData from '../plugins/GlobalData';

export default {
  data() {
    return {
      step: 1,
      randomHash: '',
      randomSrc: '',
      email: '',
      password: '',
      confirmPassword: '',
      majors: '',
      realname: '',
      nickname: '',
      nextBtnText: '下一步',
      years: ['2015级', '2016级', '2017级', '2018级', '教师'],
      year: '',
      uClass: '',
      dept: '',
      qqNumber: '',
      classes: ['教研组', '1班', '2班', '3班', '4班', '5班', '6班', '7班', '8班', '卓越班'],
      depts: ['会员', '游客', '理事会', '软件开发技术部', '机器人技术部', '嵌入式技术部', '办公室', '宣传策划部', '机器人技术部', '学习实践部', '退休办'],
      errorInfomation: '',
      errorDialog: false,
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
    nickname: {
      required,
      maxLength: maxLength(10)
    },
    year: {
      required
    },
    uClass: {
      required
    },
    qqNumber:{
      required
    },
    dept: {
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
    qqNumberErrors () {
      const errors = [];
      if (!this.$v.qqNumber.$dirty) return errors;
      !this.$v.qqNumber.required && errors.push('这是一个必填项目');
      return errors;
    },
    nicknameErrors () {
      const errors = [];
      if (!this.$v.nickname.$dirty) return errors;
      !this.$v.nickname.maxLength && errors.push('昵称不能超过 10 汉字或字符');
      !this.$v.nickname.required && errors.push('这是一个必填项目');
      return errors;
    },
    majorsErrors () {
      const errors = [];
      if (!this.$v.majors.$dirty) return errors;
      !this.$v.majors.required && errors.push('这是一个必填项目');
      return errors;
    },
    yearsErrors () {
      const errors = []
      if (!this.$v.year.$dirty) return errors
      !this.$v.year.required && errors.push('这是一个必填项目')
      return errors
    },
    classesErrors () {
      const errors = []
      if (!this.$v.uClass.$dirty) return errors
      !this.$v.uClass.required && errors.push('这是一个必填项目')
      return errors
    },
    deptsErrors () {
      const errors = []
      if (!this.$v.dept.$dirty) return errors
      !this.$v.dept.required && errors.push('这是一个必填项目')
      return errors
    }

  },
  methods: {
    NextStep: function() {
      switch(this.step) {
        case 1: 
          this.$v.email.$touch()
          if(!this.$v.email.$invalid && !this.$v.nickname.$invalid) {
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
          this.$v.year.$touch()
          this.$v.uClass.$touch()
          this.$v.dept.$touch()
          if(!this.$v.realname.$invalid && !this.$v.majors.$invalid && !this.$v.qqNumber.$invalid &&
             !this.$v.year.$invalid && !this.$v.uClass.$invalid && !this.$v.dept.$invalid) {
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
      this.randomHash = Math.random().toString(36).substr(2);
      this.randomSrc = 'https://api.adorable.io/avatars/150/' + this.randomHash;
    },
    SubmitRegisterForm: function() {
      let self = this;
      axios.post(`/register/`, {
        'e_mail': self.email,
        'password': self.password,
        'confirm_password': self.confirmPassword,
        'major': self.majors,
        '_class': self.uClass,
        'really_name': self.realname,
        'nickname': self.nickname,
        'QQ_number': self.qqNumber,
        'age': self.year,
        'department': self.dept,
        'user_logo': self.randomHash
      }).
      then(function(response) {
        console.log(response.data)
        self.$emit('changeLoginStatus', self.email, response.data.id, self.nickname, response.data.avatar);
      }).
      catch(function(error) {
        self.errorDialog = true;
        self.errorInfomation = error;
      });
    }
  },
  mounted() {
    // Generate random avater for new users
    this.GetAvatar();
  }
}
</script>
