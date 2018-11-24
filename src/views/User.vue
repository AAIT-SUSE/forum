<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl7 lg12 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <userinfo></userinfo> 
      </v-flex>
      <v-flex xl8 lg8 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <user-tab></user-tab>
      </v-flex>
      <v-flex xl6 lg4 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <v-card>
          <v-toolbar dense dark color="light-blue">
            <v-toolbar-title>快捷面板</v-toolbar-title>
          </v-toolbar>
          <v-list>
            <clickable-list-item v-for="act in actions" :key="act.title"
              :title="act.title"
              :tileIcon="act.icon"
              :tileAvatar="true"
              :tileClickHandler="PushRouterTo"
              :linkToPush="act.link"
            ></clickable-list-item>
          </v-list>
        </v-card>
        <tbc-alert></tbc-alert>
      </v-flex>
    </v-layout>
  </v-container>

</template>



<script>
import router from '@/plugins/router/router.js'
import userinfo from '@/components/UserInfo.vue'
import UserTab from '@/components/UserTab.vue'
import ClickableListItem from '@/components/ClickableListItem'
import TbcAlert from '../components/RightAlertInfo.vue'

export default {
  name:'User',
  components:{
    userinfo,
    UserTab,
    ClickableListItem,
    TbcAlert
  },
  data() {
    return {
      actions: [
        {
          title: '小组建设',
          icon: 'group_work',
          link: '/comingSoon'
        },
        {
          title: '积分商城',
          icon: 'shopping_cart',
          link: '/comingSoon'
        },
        {
          title: '意见与反馈',
          icon: 'mail',
          link: '/comingSoon'
        },
        {
          title: '管理中心',
          icon: 'assignment',
          link: '/admin'
        }
      ]
    }
  },
  methods: {
    PushRouterTo: function(link) {
      router.push(link);
    }
  }
 
}

</script>


<style scoped>


</style>