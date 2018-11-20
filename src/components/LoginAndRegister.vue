<template>
  <div id="loginWindow" v-if="!isUserLogged">
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
            :rules="[rules.required, rules.email]"
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
          ></v-text-field>
          <v-text-field
            label="确认密码"
            v-model="confirmPassword"
            type="password"
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
          ></v-text-field>
          <v-text-field
            label="专业"
          ></v-text-field>
          <v-layout grid-list-md>
            <v-flex xs12 sm12 md6 lg6 xl6 class="mr-1">
              <v-select
                :items="years"
                label="年级"
              ></v-select>
            </v-flex>
            <v-flex xs12 sm12 md6 lg6 xl6 class="ml-1">
              <v-select
                :items="classes"
                :disabled="isTeacher"
                label="班级"
              ></v-select>
            </v-flex>
          </v-layout>
          <v-select
            :items="depts"
            label="所属部门"
          ></v-select>
          <span class="caption grey--text text--darken-1">
            为了验证你的身份，你需要填写以上信息。您稍后可以选择是否在您的个人面板中展示这些信息
          </span>
        </v-card-text>
      </v-window-item>

      <v-window-item :value="4">
        <v-card-text>
          <v-text-field
            label="Password"
            type="password"
          ></v-text-field>
          <v-text-field
            label="Confirm Password"
            type="password"
          ></v-text-field>
          <span class="caption grey--text text--darken-1">
            为你的账户创建一个密码。你需要使用此密码进行登录，请妥善保管。
          </span>
        </v-card-text>
      </v-window-item>


      <v-window-item :value="5">
        <div class="pa-3 text-xs-center">
          <h3 class="title font-weight-light mb-2">感谢您使用 Envision</h3>
          <span class="caption grey--text">您的账号已经创建成功，点击完成按钮载入应用</span>
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
      <v-spacer></v-spacer>
      <v-btn
        :disabled="!nextStepOk"
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
export default {
  data() {
    return {
      step: 1,
      email: '',
      password: '',
      confirmPassword: '',
      nextBtnText: '下一步',
      nextStepOk: false,
      years: ['2015级', '2016级', '2017级', '2018级', '教师'],
      classes: ['1班', '2班', '3班', '4班', '5班', '6班', '7班', '8班', '卓越班'],
      depts: ['会员', '理事会', '软件开发技术部', '机器人技术部', '嵌入式技术部', '办公室', '宣传策划部', '机器人技术部', '学习实践部', '退休办'],
      rules: {
        required: value => !!value || '此项必须填写',
        email: value => {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            return pattern.test(value) || '不合法的邮箱'
        },
      }
    }
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
  },
  methods: {
    NextStep: function() {
      if(this.step >= 4) {
        this.nextBtnText = '完成';
      }
      if(this.step >= 5) {
        this.step = 5;

      } else {
        this.step++;
      }
    }
  }
}
</script>
