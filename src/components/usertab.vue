<template>
  <div>
    <v-tabs
      slot="extension" v-model="tab" color="warning" grow>
      <v-tabs color="error"></v-tabs>
      <v-tab v-for="item in items" :key="item.message">
        {{ item.message }}
      </v-tab>
    </v-tabs>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="item in items" :key="item.value">
        <v-card flat>
          <!-- <MyCreations v-if="item.value=='MyCreations'"></MyCreations>
          <MyFavorites v-if="item.value=='MyFavorites'"></MyFavorites>
          <MyFocus v-if="item.value=='MyFocus'"></MyFocus> -->
          <!-- <MyAchievements v-if="item.value=='MyAchievements'"></MyAchievements> -->
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>


<script>
import MyCreations from './MyCreations.vue'
import MyFocus from './MyFocus.vue'
import MyFavorites from './MyFavorites.vue'
import MyAchievements from './MyAchievements.vue'

export default {
  components: {
    MyCreations,
    MyFocus,
    MyFavorites,
    MyAchievements,
  },
  data () {
    return {
      tab: null,
      items: [
        {
          message: '我的文章',
          value: 'MyArticles',
        },
        {
          message: '我的帖子',
          value: 'MyPosts',
        },
        {
          message: '我的直答',
          value: 'MyQAs'
        },
        {
          message:'我的收藏',
          value:'MyFavorites'
        },
        {
          message:'我的成就',
          value:'MyAchievements'
        },
      ],
    }
  }
}
    

</script>
