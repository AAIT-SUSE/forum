<template>
  <div>
    <v-toolbar color="warning" tabs>
      <v-text-field
        class="mx-3"
        flat
        label="搜索功能暂不可用"
        prepend-inner-icon="search"
        solo-inverted
      ></v-text-field>
      <v-tabs slot="extension" v-model="tab" left color="transparent" slider-color="red">
        <v-tab v-for="item in items" :key="item.message">
          {{ item.message }}
        </v-tab>
      </v-tabs>
    </v-toolbar>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="item in items" :key="item.message">
        <FeedList v-if="item.value === 'Feed'" :showCtrlBtns="true"></FeedList>
        <ArticleList v-if="item.value === 'Article'" :showCtrlBtns="true"></ArticleList>
        <direct-answer-list v-if="item.value === 'Answer'"></direct-answer-list>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>

<script>
import ArticleList from '@/components/ArticleList'
import FeedList from '@/components/FeedList'
import DirectAnswerList from "@/components/DirectAnswerList";

export default {
  name:'PostSearch',
  components:{
    ArticleList,
    FeedList,
    DirectAnswerList
  },
  data() {
    return {
      tab:null,
      searchPlaceholder: '搜索功能暂不可用',
      items: [
        {
          message: "动态",
          value:'Feed'
        },
        {
          message: "文章",
          value:'Article'
        },
        {
          message: "直答",
          value: 'Answer'
        }
      ]
    };
  }
}

</script>