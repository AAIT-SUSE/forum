<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <GroupedPanel
        ></GroupedPanel>
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
            ></UserActions>
          </v-card-text>
        </v-card>
        <RightInfoPanel></RightInfoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import GroupedPanel from '../components/GroupedPanel.vue'
import UserActions from '../components/UserActions.vue'
import RightInfoPanel from '../components/RightInfoPanel.vue'

export default {
  components: {
    GroupedPanel,
    UserActions,
    RightInfoPanel,
  },
  data(){
    return {
      userActions: [
        {
          name: '发表主题',
          icon: 'note_add',
          color: 'success'
        },
        {
          name: '加入小组',
          icon: 'group_add',
          color: 'success'
        },
      ],
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
