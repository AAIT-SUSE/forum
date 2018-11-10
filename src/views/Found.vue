<template>
  <v-container grid-list-md align-content-center>
    <v-flex>
      <div style="margin-top:45px" >
        <FoundSearch></FoundSearch>
      </div>
    </v-flex>
  </v-container>
</template>



<script>
import FoundSearch from './components/FoundSearch.vue'

export default {
  name:'Found',
  components:{
    FoundSearch,
  }
 
}

</script>


<style scoped>


</style>