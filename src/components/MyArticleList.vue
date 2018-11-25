<template>
  <v-layout>
    <v-flex>
      <v-card class="ma-2" raised v-for="article in articles" :key="article">
        <v-card-title primary-title>
          <div>
            <h3 class="headline mb-0">{{ article.title }}</h3>
            <div>作者 {{ article.user_name }}, 发表于 {{ article.article_time }}
            </div>
          </div>
        </v-card-title>

        <v-card-actions v-if="showCtrlBtns === true">
          <v-spacer></v-spacer>
          <v-btn 
            flat
            :color="article.isLiked ? 'red' : 'info'"
            @click="AddArticleToFav()"
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
import axios from 'axios'
import globalData from '../plugins/GlobalData';
export default {
  name:'ArticleList',
  data() {
    return {
      articles:[],
    }
  },
  methods: {
    AddArticleToFav: function() {
      //TODO
    },
    GetMyArticles: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/GetArticleInfoUser/`,{
        'user_id': globalData.state.userId
      })
      .then(function(response){
        console.log(response.data);
        self.articles = response.data;
      })
      .catch(function(error) {

      });
    }
  },
  props: {
    showCtrlBtns: Boolean
  },
  mounted() {
    this.GetMyArticles();
  }
}
</script>
