<template>
<v-layout>
    <v-flex>
      <v-card flat v-for="card in cards" :key="card.title"> 
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
        <v-card-actions>
          <v-btn flat block color="orange">
            <v-badge right color="warning">
              <span  slot="badge">6</span>
            <v-icon >share</v-icon>
            </v-badge>
          </v-btn>
          <v-btn flat block color="orange">
            <v-badge right color="warning">
              <span  slot="badge">6</span>
            <v-icon >comment</v-icon>
            </v-badge>
          </v-btn>
          <v-btn flat block color="orange">
            <v-badge right color="warning">
              <span  slot="badge">6</span>
            <v-icon >favorite</v-icon>
            </v-badge>
          </v-btn>
        </v-card-actions>
        <v-spacer></v-spacer>
        </v-container>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
    name:'FoundPost',
    data() {
        return {
           cards:[
             {title:'第一篇帖子',content:'这是第一篇帖子的内容',src:'https://cdn.vuetifyjs.com/images/cards/desert.jpg'},
             {title:'第二篇帖子',content:'这是第二篇帖子的内容',src:'#'},
             {title:'第三篇帖子',content:'这是第三篇帖子的内容',src:'#'},
           ]
        }
    }
}
</script>