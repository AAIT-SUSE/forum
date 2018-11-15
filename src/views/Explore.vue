<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <PostSearch></PostSearch>
      </v-flex>
      <v-flex xl5 lg5 md5 sm12 xs12 order-sm1 order-xs1 order-lg2 order-md2 order-xl2>
        <v-card flat>
          <v-card-text 
            class="px-0 text-md-center text-sm-center text-xs-center text-lg-center text-xl-center"
          >
          <UserActions 
            v-for="act in userActions"
            :key="act"
            v-bind:btnColor="act.color"
            v-bind:actName="act.name"
            v-bind:actIcon="act.icon"
            ></UserActions>
          </v-card-text>
        </v-card>
        <infoPanel></infoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>



<script>
import PostSearch from '@/components/PostSearch.vue'
import UserActions from '@/components/UserActions.vue'
import InfoPanel from '@/components/RightInfoPanel.vue'

export default {
  name:'Explore',
  components:{
    PostSearch,
    UserActions,
    InfoPanel
  },
  data() {
    return {
      userActions: [
        {
          name: '新文章',
          icon: 'create',
          color: 'info'
        },
        {
          name: '新动态',
          icon: 'add_comment',
          color: 'info'
        },
        {
          name: '提问题',
          icon: 'help',
          color: 'info'
        },
      ],
    }
  }
}

</script>
