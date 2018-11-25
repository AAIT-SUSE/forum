<template>
  <v-layout>
    <v-flex>
      <v-card class="ma-2" raised v-for="article in articles" :key="article.id">
        <v-img v-if="article.img"
          :src="article.img"
          aspect-ratio="2.75"
        ></v-img>

        <v-card-title primary-title>
          <div>
            <h3 class="headline mb-0">{{ article.title }}</h3>
            <div>作者 | 
              {{ article.author }}
            </div>
          </div>
        </v-card-title>

        <v-card-actions v-if="showCtrlBtns === true">
          <v-spacer></v-spacer>
          <v-btn 
            flat
            :color="article.isLiked ? 'red' : 'info'"
            @click="AddArticleToFav(article.id)"
          >
            <v-icon left>favorite</v-icon> {{ article.likes }}
          </v-btn>
          <v-btn color="info" flat>阅读</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name:'ArticleList',
  data() {
    return {
      articles:[
        {
          id: 0,
          title: '第二篇文章',
          author: 'Jack Ma',
          isLiked: false,
          likes: 123,
        },
        {
          id: 1,
          title: '第一篇文章',
          author: 'Owen Tsai',
          img:'https://cdn.vuetifyjs.com/images/cards/desert.jpg',
          isLiked: false,
          likes: 46,
        },
        {
          id: 2,
          title: '第三篇文章',
          author: 'Steve White',
          isLiked: false,
          likes: 0,
        },
      ]
    }
  },
  methods: {
    AddArticleToFav: function(id) {
      this.articles[id].isLiked = !this.articles[id].isLiked;
      if(this.articles[id].isLiked === false) {
        this.articles[id].likes -= 1;
      } else {
        this.articles[id].likes += 1;
      }
    }
  },
  props: {
    showCtrlBtns: Boolean
  }
}
</script>