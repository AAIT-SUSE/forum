<template>
  <v-card>
    <v-layout align-center justify-center style="height: 300px; background: url('https://pic4.zhimg.com/80/v2-c756e2f56c06f55893fbf5130b422402_r.jpg') no-repeat; background-size: conver; z-index: -99">
      <v-flex xs3>
        <v-img
          src="https://randomuser.me/api/portraits/men/85.jpg"
          height="125px"
          contain
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
                  积分可以通过热心帮助他人、对社区做出贡献、积极参加活动等途径获得
                  <br>
                  使用积分可以打赏他人的作品，或在商城兑换礼品
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
export default {
  name:"UserInfo",
  data() {
    return {
      username: 'Owen Tsai',
      userCredits: '666',
      userSignature: '这个人很懒，没有留下任何个性签名'
    }
  }
}
</script>
