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
            <div>负责人 | 
              {{ article.leader }}
            </div>
          </div>
        </v-card-title>

        <v-card-actions v-if="showCtrlBtns === true">
          <v-spacer></v-spacer>
          <v-btn color="info" flat>阅读</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name:'WorkList',
  data() {
    return {
      articles:[
        {
          id: 0,
          title: '任务二',
          leader: 'Jack Ma',
          isLiked: false,
          likes: 123,
        },
        {
          id: 1,
          title: '任务一',
          leader: 'Owen Tsai',
          img:'https://cdn.vuetifyjs.com/images/cards/desert.jpg',
          isLiked: false,
          likes: 46,
        },
        {
          id: 2,
          title: '任务三',
          leader: 'Steve White',
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