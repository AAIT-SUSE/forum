<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <UserFeed></UserFeed>
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
        <infoPanel></infoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserActions from '../components/UserActions.vue';
import UserFeed from '../components/FeedPost.vue';
import InfoPanel from '../components/RightInfoPanel.vue';
import router from '@/plugins/router/router.js'

export default {
  components: {
    UserActions,
    UserFeed,
    InfoPanel,
  },
  data() {
    return {
      userActions: [
        {
          name: '新文章',
          icon: 'create',
          color: 'info',
        },
        {
          name: '新动态',
          icon: 'add_comment',
          color: 'info',
        },
        {
          name: '提问题',
          icon: 'help',
          color: 'info',
        },
      ],
    }
  },
  methods: {
    ExcuteUserAction: function(action) {
      switch(action) {
        case '新文章': 
          router.push('/newPost');
          break;
        default: 
          router.push('/user');
      }
    }
  }
}
</script>
