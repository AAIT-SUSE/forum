<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <TodoListVue></TodoListVue>
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
            class="white--text"
            ></UserActions>
          </v-card-text>
        </v-card>
        <tbc-alert :class="eclass"></tbc-alert>
        <RightInfoPanel></RightInfoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import TodoListVue from '../components/TodoList.vue'
import UserActions from '../components/UserActions.vue'
import RightInfoPanel from '../components/RightInfoPanel.vue'
import TbcAlert from '../components/RightAlertInfo.vue'

export default {
  components: {
    TodoListVue,
    UserActions,
    RightInfoPanel,
    TbcAlert
  },
  data(){
    return {
      eclass: 'mx-5',
      userActions: [
        {
          name: '创建任务',
          icon: 'playlist_add',
          color: 'pink'
        },
        {
          name: '开始番茄',
          icon: 'alarm',
          color: 'pink'
        },
      ],
    }
  },
}
</script>
