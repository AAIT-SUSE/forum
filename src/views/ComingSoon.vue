<template>
    <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <v-img :aspect-ratio="16/9" src="http://www.actoralcare.com/media/comingSoonBanner.jpg">
          <v-layout pa-2 column contain fill-height class="lightbox white--text">
            <v-spacer></v-spacer>
            <v-flex shrink style="text-align: right">
              <div class="subheading">【功能不可用】</div>
              <div class="body-1">你试图查看的功能还未上线，记得以后回来看看哦！</div>
            </v-flex>
          </v-layout>
        </v-img>
      </v-flex>
      <v-flex xl5 lg5 md5 sm12 xs12 order-sm1 order-xs1 order-lg2 order-md2 order-xl2>
        <v-card flat>
          <v-card-text 
            class="px-0 text-md-center text-sm-center text-xs-center text-lg-center text-xl-center"
          >
          <UserActions 
            v-for="act in userActions"
            :key="act.name"
            v-bind:btnColor="act.color"
            v-bind:actName="act.name"
            v-bind:actIcon="act.icon"
            :onClickHandler="ExcuteUserAction"
            ></UserActions>
          </v-card-text>
        </v-card>
        <RightInfoPanel></RightInfoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>


<script>
import UserActions from '../components/UserActions.vue'
import RightInfoPanel from '../components/RightInfoPanel.vue'
import router from '@/plugins/router/router.js'

export default {
  components: {
    UserActions,
    RightInfoPanel,
  },
  methods: {
    ExcuteUserAction: function() {
      router.go(-1);
    }
  },
  data(){
    return {
      userActions: [
        {
          name: '返回上一页面',
          icon: 'undo',
          color: 'error'
        }
      ],
    }
  },
}
</script>
