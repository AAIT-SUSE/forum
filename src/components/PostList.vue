<template>
  <v-layout>
    <v-flex>
      <v-card class="ma-2" raised v-for="post in posts" :key="post.feed_id">
        <v-img v-if="post.img"
          :src="post.img"
          aspect-ratio="2.75"
        ></v-img>

        <v-card-title primary-title>
          <div>
            {{ post.content }}
          </div>
        </v-card-title>

        <v-card-actions v-if="showCtrlBtns === true">
          <v-spacer></v-spacer>
          <v-btn 
            flat
            :color="post.isInFav ? 'success' : 'grey'"
            @click="post.isInFav = !post.isInFav"
          >
            <v-icon>star</v-icon>
          </v-btn>
          <v-btn 
            flat
            :color="post.isLiked ? 'red' : 'info'"
            @click="AddPostToFav(post.feed_id)"
          >
            <v-icon left>favorite</v-icon> {{ post.applaud }}
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import axios from 'axios'

export default {
  name:'PostList',
  data() {
    return {
      posts:[]
    }
  },
  methods: {
    AddPostToFav: function(feed_id) {
      this.posts[feed_id].isLiked = !this.posts[feed_id].isLiked;
      if(this.posts[feed_id].isLiked === false) {
        this.posts[feed_id].likes -= 1;
      } else {
        this.posts[feed_id].likes += 1;
      }
    }
  },
  PostListGet: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/FeedViewSet/`
      ).
      then(function(response) {
        self.posts=response.data;
      }).
      catch(function(error) {
        console.log(error);
      });
    }
  props: {
    showCtrlBtns: Boolean
  },
  mounted() {
    this.PostListGet();
  }
}
</script>
