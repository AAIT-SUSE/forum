<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl8 lg8 md8 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
         <inform-content></inform-content>
         </v-flex> 
      <v-flex xl4 lg4 md4 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <inform-list></inform-list>
        <alert-info></alert-info>
      </v-flex> 
    </v-layout>
  </v-container>   
</template>

<script>
import InformList from '@/components/InformList.vue'
import InformContent from '@/components/InformContent.vue'
import AlertInfo from '@/components/RightAlertInfo.vue'

export default {
  components:{
    InformList,
    InformContent,
    AlertInfo,
  }
}
</script>
