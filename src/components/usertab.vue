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
          <PostList v-if="item.value === 'Post'" :showCtrlBtns="false"></PostList>
          <ArticleList v-if="item.value === 'Article'" :showCtrlBtns="false"></ArticleList>
          <direct-answer-list v-if="item.value === 'Answer'"></direct-answer-list>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>


<script>
import ArticleList from './ArticleList.vue'
import PostList from './PostList.vue'
import DirectAnswerList from './DirectAnswerList.vue'

export default {
  components: {
    ArticleList,
    PostList,
    DirectAnswerList
  },
  data () {
    return {
      tab: null,
      items: [
        {
          message: '我的文章',
          value: 'Article',
        },
        {
          message: '我的帖子',
          value: 'Post',
        },
        {
          message: '我的直答',
          value: 'Answer'
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
