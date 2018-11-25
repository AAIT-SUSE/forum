<template>
  <v-layout>
    <v-flex>
      <v-card class="" raised v-for="feed in feeds" :key="feed.feed_id">
        <v-img v-if="feed.img"
          :src="feed.img"
          aspect-ratio="2.75"
        ></v-img>

        <v-card-title primary-title>
          <div>
            {{ feed.content }}
          </div>
        </v-card-title>

        <v-card-actions v-if="showCtrlBtns === true">
          <v-spacer></v-spacer>
          <v-btn 
            flat
            :color="feed.isInFav ? 'success' : 'grey'"
            @click="feed.isInFav = !feed.isInFav"
          >
            <v-icon>star</v-icon>
          </v-btn>
          <v-btn 
            flat
            :color="feed.isLiked ? 'red' : 'info'"
            @click="AddFeedToFav(feed.feed_id)"
          >
            <v-icon>favorite</v-icon>{{ feed.applaud }}
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import axios from 'axios'

export default {
  name:'FeedList',
  data() {
    return {
      feeds:[]
    }
  },
  methods: {
    AddFeedToFav: function(feed_id) {
      this.feeds[feed_id].isLiked = !this.feeds[feed_id].isLiked;
      if(this.feeds[feed_id].isLiked === false) {
        this.feeds[feed_id].likes -= 1;
      } else {
        this.feeds[feed_id].likes += 1;
      }
    },
    FeedListGet: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/FeedViewSet/`
      ).
      then(function(response) {
        self.feeds=response.data;
      }).
      catch(function(error) {
        console.log(error);
      });
    },
  },
  props: {
    showCtrlBtns: Boolean
  },
  mounted() {
    this.FeedListGet();
  }
}
</script>
