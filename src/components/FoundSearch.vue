<template>
  <div>
    <v-toolbar color="gary" prominent light tabs>
      <v-text-field append-icon="mic" class="mx-3" flat label="搜索" prepend-inner-icon="search"  solo>
      </v-text-field>
      <v-tabs slot="extension" v-model="tab" left color="transparent" slider-color="warning" >
        <v-tab v-for="item in items" :key="item.message">
          {{ item.message}}
        </v-tab>
      </v-tabs>
    </v-toolbar>
    <v-tabs-items v-model="tab">
      <v-tab-item v-for="item in items" :key="item.message">
        <v-card flat>
          <FoundPost v-if="item.value=='Post'"></FoundPost>
          <FoundArticle v-if="item.value=='Article'"></FoundArticle>
        </v-card>
      </v-tab-item>
    </v-tabs-items>

  </div>
</template>

<script>
import FoundArticle from './found_search/FoundArticle'
import FoundPost from './found_search/FoundPost'

export default {
    name:'FoundSearch',
    components:{
      FoundArticle,
      FoundPost,
    },
    data() {
      return {
        tab:null,
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
    },
    methods: {}
}

</script>


<style>

</style>
