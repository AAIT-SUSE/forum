<template>
   <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl7 lg12 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <userinfo></userinfo> 
      </v-flex>
      <v-flex xl8 lg8 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <usertab></usertab>
      </v-flex>
      <v-flex xl6 lg4 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <profile-action-panel order-sm1 order-xs1></profile-action-panel> 
      </v-flex>
    </v-layout>
   </v-container>

</template>



<script>
import userinfo from '@/components/UserInfo.vue'
import ProfileActionPanel from '@/components/ProfileActionPanel.vue'
import usertab from '@/components/usertab.vue'
export default {
  name:'User',
  components:{
    userinfo,
    ProfileActionPanel,
    usertab,
  }
 
}

</script>


<style scoped>


</style>

