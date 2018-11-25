<template>
  <v-layout>
    <v-flex>
      <v-card raised v-for="article in articles" :key="article.article_id">
        <v-img v-if="article.img"
          :src="article.img"
          aspect-ratio="2.75"
        ></v-img>

        <v-card-title primary-title>
          <div>
            <h3 class="headline mb-0">{{ article.title }}</h3>
            <div>作者 | 
              {{ article.user_name }}
            </div>
            <div>
            {{article.article_time}}
            </div>
          </div>
        </v-card-title>

        <v-card-actions v-if="showCtrlBtns === true">
          <v-spacer></v-spacer>
          <v-tooltip bottom>
            <v-btn flat slot="activator" color="primary">
              <v-icon>favorite</v-icon>{{ article.applaud }}
            </v-btn>
            <span>“赞同”功能暂未上线，<br>你可以 @邓文义 并且让他快一点写代码</span>
          </v-tooltip>
          <v-btn color="info" flat :to="/article/ + article.article_id">阅读</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import axios from 'axios'
export default {
  name:'ArticleList',
  data() {
    return {
      articles:[]
    }
  },
  methods: {
    AddArticleToFav: function(article_id) {
      // this.articles[article_id].isLiked = !this.articles[article_id].isLiked;
      // if(this.articles[article_id].isLiked === false) {
      //   this.articles[article_id].likes -= 1;
      // } else {
      //   this.articles[article_id].likes += 1;
      // }
    },
    ArticleListGet: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/ArticleViewSet/`
      ).
      then(function(response) {
        console.log(response.data)
        self.articles=response.data;
      }).
      catch(function(error) {
        console.log(error);
      });
    }
  },
  props: {
    showCtrlBtns: Boolean
  },
  mounted() {
    this.ArticleListGet();
  }
}
</script>
