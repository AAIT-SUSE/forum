<template>
  <div>
    <v-tabs
      slot="extension" v-model="tab" color="white" grow>
      <v-tabs-slider color="primary"></v-tabs-slider>
      <v-tab v-for="item in items" :key="item.message">
        {{ item.message }}
      </v-tab>
    </v-tabs>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="item in items" :key="item.message">
        <v-card flat style="margin-top:7px;">
          <MyCreations v-if="item.value=='MyCreations'"></MyCreations>
          <MyFavorites v-if="item.value=='MyFavorites'"></MyFavorites>
          <MyFocus v-if="item.value=='MyFocus'"></MyFocus>
          <MyAchievement v-if="item.value=='MyAchievement'"></MyAchievement>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>


<script>
import MyCreations from '@/components/MyCreations'
import MyFavorites from '@/components/MyFavorites'
import MyFocus from '@/components/MyFocus'
import MyAchievement from '@/components/MyAchievement'

export default {
  name:"UserTab",
  components:{
    MyCreations,
    MyFavorites,
    MyFocus,
    MyAchievement,
  },
  data () {
    return {
      tab: null,
      items: [
        {
          message:'我的创作',
          value:'MyCreations',
          
        },
        {
          message:'我的关注',
          value:'MyFocus'
        },
        {
          message:'我的收藏',
          value:'MyFavorites'
        },
        {
          message:'我的成就',
          value:'MyAchievement'
        },
           
      ],
    }
  }
}
    

</script>
