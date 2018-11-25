<template>
  <v-card>
    <v-layout align-center justify-center style="
      height: 300px; 
      background-image: url('https://raw.githubusercontent.com/AAIT-SUSE/forum/master/src/assets/img/profile-bg.jpg');
      background-repeat: no-repeat;
      background-size: conver; 
      z-index: -99
    ">
      <v-flex xs3>
        <v-img
          :src='userAvatar'
          height="125px"
          contain
          style="border-radius: 100%;"
        ></v-img>
      </v-flex>
      <v-flex xs9>
        <v-card-title primary-title class="white--text">
          <div>
            <div class="headline">{{ username }}</div>
            <div>
              <v-icon></v-icon>
              {{ userSignature }}
            </div>
            <br>
            <div>
              <v-tooltip right>
                <v-chip color="white" slot="activator">
                  <v-avatar>
                    <v-icon color="primary">local_offer</v-icon>
                  </v-avatar>
                  {{ userCredits }} 积分
                </v-chip>
                <span>
                  积分可以通过以下途径获得: <br>
                  <li>热心帮助他人</li>
                  <li>对社区做出贡献</li>
                  <li>积极参加活动</li>
                  <li>参与其他活动、赛事等</li>
                  <br>
                  使用积分可以提出"直答"问题，或在商城兑换礼品
                </span>
              </v-tooltip>
            </div>
          </div>
        </v-card-title>
      </v-flex>
    </v-layout>
  </v-card>
</template>

<script>
import axios from 'axios'
import globalData from '../plugins/GlobalData';

export default {
  name:"UserInfo",
  data() {
    return {
      username: 'Owen Tsai',
      userCredits: '666',
      userSignature: 'Envision 项目发起人',
      userAvatar: 'https://randomuser.me/api/portraits/men/85.jpg'
    }
  },
  methods: {
    GetUserInfo: function(){
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/UserProfileViewSet/${globalData.state.userId}/`)
      .then(function (response){
        self.username = response.data.nickname;
        self.userCredits = 0,
        self.userAvatar = 'https://api.adorable.io/avatars/150/' + response.data.user_logo;
        self.userSignature = response.data.major + response.data.age + response.data._class;
      })
      .catch(function (error){
        console.log(error);
      });
    }
  },
  mounted() {
    this.GetUserInfo();
  }
}
</script>
