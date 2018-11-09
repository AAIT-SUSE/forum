<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <course></course>
         <v-divider></v-divider>
         <completeness></completeness>
        <v-divider></v-divider>
        <integralform></integralform>  
      </v-flex> 
    </v-layout>
  </v-container>   
</template>
    
<script>
import integralform from './integralform.vue'
import completeness from './completeness.vue'
import course from './course.vue'

export default {
    name:'myachievement',
    components:{
        integralform,
        completeness,
        course
    },
}
</script>
