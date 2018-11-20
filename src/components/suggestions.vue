<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xs12 sm6 offset-sm3>
         
         <suggestions1></suggestions1>
         </v-flex> 
      <v-flex xs12 sm6 offset-sm3>
       
        <suggestions2></suggestions2>  
      </v-flex> 
    </v-layout>
  </v-container>   
</template>

<script>
import suggestions1 from './suggestions1.vue'
import suggestions2 from './suggestions2.vue'

export default {
    name:'suggestions',
    components:{
       suggestions1,
       suggestions2 ,
    }
}
</script>