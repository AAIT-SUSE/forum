<template>
  <div>
        <Course></Course>
         <v-divider></v-divider>
         <Completeness></Completeness>
        <v-divider></v-divider>
        <Integralform></Integralform>  
  </div>
</template>
    
<script>
import Integralform from '@/components/Integralform.vue'
import Completeness from '@/components/Completeness.vue'
import Course from '@/components/Course.vue'

export default {
  name:'MyAchievement',
  components:{
    Integralform,
    Completeness,
    Course,
  },
}
</script>
