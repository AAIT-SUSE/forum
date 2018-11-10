<template>
<v-layout>
    <v-flex>
      <v-card v-for="card in cards" :key="card.title" class="mb-4">
        <v-container fluid grid-list-lg>
          <v-img :src="card.src" v-if="card.src!='#'" aspect-ratio="2.75"></v-img>
          <v-card-title primary-title>
            <div>
              <h3 class="headline mb-0">{{card.title}}</h3>
              <div>
                {{card.content}}
              </div>
            </div>
          </v-card-title>
        </v-container>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
    name:'FoundArticle',
    data() {
        return {
           cards:[
             {title:'第一篇文章',content:'这是第一篇文章的内容',src:'https://cdn.vuetifyjs.com/images/cards/desert.jpg'},
             {title:'第二篇文章',content:'这是第二篇文章的内容',src:'#'},
             {title:'第三篇文章',content:'这是第三篇文章的内容',src:'#'},
           ]
        }
    }
}
</script>