<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl8 lg6  md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
         <v-divider></v-divider>
         <informcontent></informcontent>
         </v-flex> 
      <v-flex xl8 lg6  md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
         <v-divider></v-divider>
        <informlist></informlist>  
      </v-flex> 
    </v-layout>
  </v-container>   
</template>

<script>
import informlist from './informlist.vue'
import informcontent from './informcontent.vue'

export default {
    name:'mynews',
    components:{
       informlist,
       informcontent,
    }
}
</script>
