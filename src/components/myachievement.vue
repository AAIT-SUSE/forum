<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <Course></Course>
         <v-divider></v-divider>
         <Completeness></Completeness>
        <v-divider></v-divider>
        <Integralform></Integralform>  
      </v-flex> 
    </v-layout>
  </v-container>   
</template>
    
<script>
import Integralform from './Integralform.vue'
import Completeness from './Completeness.vue'
import Course from './Course.vue'

export default {
  name:'myachievement',
  components:{
    Integralform,
    Completeness,
    Course
  },
}
</script>
