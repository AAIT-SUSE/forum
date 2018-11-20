<template>
  <div>
    <v-toolbar color="warning" prominent tabs>
      <v-text-field class="mx-3" flat 
        :label="searchPlaceholder" 
        prepend-inner-icon="search" solo
      >
      </v-text-field>
      <v-tabs slot="extension" v-model="tab" left color="transparent" slider-color="red">
        <v-tab v-for="item in items" :key="item.message">
          {{ item.message }}
        </v-tab>
      </v-tabs>
    </v-toolbar>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="item in items" :key="item.message">
        <v-card flat>
          <Announcements v-if="item.value === 'Announcements'" :showCtrlBtns="true"></Announcements>
          <Worklist v-if="item.value === 'Worklist'" :showCtrlBtns="true"></Worklist>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>

<script>
import Worklist from '@/components/Worklist'
import Announcements from '@/components/Announcements'

export default {
  name:'Groupwork',
  components:{
    Worklist,
    Announcements
  },
  data() {
    return {
      tab:null,
      tabView: true,
      searchPlaceholder: '搜索任务或公告',
      items: [
        {
          message: "任务",
          value:'Worklist'
        },
        {
          message: "公告",
          value: 'Announcements'
        }
      ]
    };
  }
}

</script>