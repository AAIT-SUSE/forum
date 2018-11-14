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
        <centre order-sm1 order-xs1></centre> 
      </v-flex>
    </v-layout>
   </v-container>

</template>



<script>
import Userinfo from '@/components/UserInfo.vue'
import Centre from '@/components/Center.vue'
import Usertab from '@/components/UserTab.vue'
export default {
  name:'User',
  components:{
    Userinfo,
    Centre,
    Usertab,
  }
 
}

</script>


<style scoped>


</style>

