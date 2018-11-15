<template>
  <v-app> 
    <v-layout row justify-center>
      <v-btn slot="activator" outline round color="#4FC3F7" @click="Dialog1 = true">登 录</v-btn>
      <v-btn slot="activator" outline round color="#69F0AE" @click="Dialog2 = true">注 册</v-btn>
      <v-dialog v-model="Dialog1" persistent max-width="600px">
        <v-card class="mx-auto">
          <v-toolbar color="deep-purple accent-4" cards dark flat>
            <v-card-title>
              <span class="headline">登 录</span>
            </v-card-title>
          </v-toolbar>
          <v-form ref="form" v-model="Form1" class="pa-3 pt-4">
            <v-text-field v-model="Username1" box color="deep-purple"  label="用户名" ></v-text-field>
            <v-text-field v-model="Password1" box  color="deep-purple"  label="密码" type="password"></v-text-field>
            <v-radio-group row v-model="radioGroup">
              <v-radio v-for="item in items" :key="item" :label="`${item.name}`" :value=item.value></v-radio>
            </v-radio-group>
          </v-form>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="deep-purple accent-4" flat @click.native="Dialog1 = false">确 认</v-btn>
            <v-btn color="deep-purple accent-4" flat @click.native="Dialog1 = false">取 消</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      
      <v-dialog v-model="Dialog2" persistent max-width="600px">        
        <v-card class="mx-auto">
          <v-toolbar color="deep-purple accent-4" cards dark flat>
            <v-card-title>
              <span class="headline">注 册</span>
            </v-card-title>
          </v-toolbar>
          <v-form ref="form" v-model="Form2" class="pa-3 pt-4">
            <v-text-field v-model="Username2" :rules="[rules.required]" box color="deep-purple" label="用户名">
            </v-text-field>    
            <v-text-field  v-model="Password2"  :rules="[rules.password, rules.length(6),rules.required]" box
             color="deep-purple" counter="6"  label="密码" style="min-height: 96px" type="password">
            </v-text-field>
            <v-text-field  v-model="Conpassword"  :rules="[rules.password, rules.length(6),rules.required]" box
             color="deep-purple" counter="6"  label="确认密码" style="min-height: 96px" type="password">
            </v-text-field>
            <v-text-field v-model="Email" :rules="[rules.email,rules.required]" box color="deep-purple" label="电子邮箱" type="email">
            </v-text-field>
            <v-text-field v-model="Major" :rules="[rules.required]" box color="deep-purple" label="专业">
            </v-text-field>
            <v-text-field v-model="Class" :rules="[rules.required]" box color="deep-purple" label="班级(例如:20184)" type="number">
            </v-text-field>
            <v-text-field v-model="Realname" :rules="[rules.required]" box color="deep-purple" label="真实姓名">
            </v-text-field>
            <v-text-field  v-model="Qqnum" :rules="[rules.required]" box color="deep-purple" label="QQ账号">
            </v-text-field>      
            <v-checkbox v-model="Agreement" :rules="[rules.required]" color="deep-purple">
              <template slot="label">
                 I agree to the&nbsp;
                <a href="#" @click.stop.prevent="Dialog = true">《Envision》</a>*
              </template>
            </v-checkbox>
          </v-form>
          <v-divider></v-divider>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn slot="activator" flat color="deep-purple accent-4" :disabled="!Form" :loading="IsLoading" depressed>确 认</v-btn>
            <v-btn slot="activator" flat color="deep-purple accent-4" @click.native="Dialog2 = false">取 消</v-btn>
          </v-card-actions>
          <v-dialog v-model="Dialog" absolute max-width="400" persistent>
            <v-card>
              <v-card-title class="headline grey lighten-3">Legal</v-card-title>
              <v-card-text>
                人工智能技术协会Envision
              </v-card-text>
              <v-divider></v-divider>
              <v-card-actions>
                <v-btn flat @click="Agreement = false, Dialog = false"> No</v-btn>
                <v-spacer></v-spacer>
                <v-btn class="white--text" color="deep-purple accent-4" @click="Agreement = true, Dialog = false"> Yes</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-card>
      </v-dialog>
    </v-layout>
  </v-app>
</template>

<script>

export default {
    name:'LoginSignUp',
    data: () => ({
      Dialog1: false,
      Dialog2:false,
      Form1: false,
      Username1:undefined,
      Password1: undefined,
      Agreement: false,
      Dialog: false,
      Email: undefined,
      Form2: false,
      IsLoading: false,
      Password2: undefined,
      Conpassword:undefined,
      Username2:undefined,
      Major:undefined,
      Class:undefined,
      Realname:undefined,
      Qqnum:undefined,
       items:[
          {
              name:"管理员",
              value:"1"
          },
          {
              name:"会员",
              value:"2"
          },
          {
              name:"游客",
              value:"3"
          }
      ],

      rules: {
        email: v => (v || '').match(/@/) || 'Please enter a valid email',
        length: len => v => (v || '').length >= len || `Invalid character length, required ${len}`,
        password: v => (v || '').match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/) ||
          'Password must contain an upper case letter, a numeric character, and a special character',
        required: v => !!v || 'This field is required'
      }
    })
}
</script>