<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <Groupwork></Groupwork>
      </v-flex>
      <v-flex xl5 lg5 md5 sm12 xs12 order-sm1 order-xs1 order-lg2 order-md2 order-xl2>
        <Groupmembers></Groupmembers>
      </v-flex>
    </v-layout>
  </v-container>
</template>



<script>
import Groupwork from '@/components/Groupwork.vue'
import Groupmembers from '@/components/Groupmembers.vue'

export default {
  name:'Explore',
  components:{
    Groupwork,
    Groupmembers
  },
}

</script>
