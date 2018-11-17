<template>
  <v-card>
    <v-toolbar dense color="light-blue" dark prominent tabs>
      <v-flex lg11>
        <v-tabs slot="extension" v-model="tab" left color="transparent" slider-color="red">
          <v-tab v-for="item in items" :key="item.name">
            {{ item.name }}
          </v-tab>
        </v-tabs>
      </v-flex>
      <v-flex lg1>
        <v-btn icon @click="ShowSearchInput()">
         <v-icon>search</v-icon>
       </v-btn>
      </v-flex>
    </v-toolbar>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="item in items" :key="item.name">
        <v-card flat>
          <GroupList v-if="item.value === 'GroupList'"></GroupList>
          <ForumList v-if="item.value === 'ForumList'"></ForumList>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </v-card>
</template>

<script>
import GroupList from '../components/GroupList.vue'
import ForumList from '../components/ForumList.vue'

export default {
  components:{
    GroupList,
    ForumList,
  },
  data() {
    return{
      tab:null,
      items:[
        {
          name:"小组",
          value:'GroupList'
        },
        {
          name:"论坛",
          value:'ForumList'
        }
      ]
    }
  },
}
</script>
