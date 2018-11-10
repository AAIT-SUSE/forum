<template>
  <div>
    <v-toolbar color="warning" prominent tabs>
      <v-text-field append-icon="mic" class="mx-3" flat 
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
          <PostList v-if="item.value === 'Post'"></PostList>
          <ArticleList v-if="item.value === 'Article'"></ArticleList>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>

<script>
import ArticleList from '@/components/ArticleList'
import PostList from '@/components/PostList'

export default {
  name:'PostSearch',
  components:{
    ArticleList,
    PostList,
  },
  data() {
    return {
      tab:null,
      tabView: true,
      searchPlaceholder: '搜索文章或帖子',
      items: [
        {
          message: "帖子",
          value:'Post'
        },
        {
          message: "文章",
          value:'Article'
        }
      ]
    };
  }
}

</script>