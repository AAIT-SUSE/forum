<template>
  <div>
    <v-card raised v-for="post in posts" :key="post" class="mb-4">
      <v-card-text v-if="post.content">
        {{ post.content }}
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
import axios from 'axios'
import globalData from '../plugins/GlobalData';

export default {
  data() {
    return {
      posts: [],
    }
  },
  methods: {
    GetMyPosts: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/GetFeedInfoUser/`,{
        'user_id': globalData.state.userId
      })
      .then(function(response){
        let data = response.data
        self.posts = data;
        for(let i = 0; i < data.length; i++) {
          self.posts[i].content = data[i].user_name + '说：' + data[i].content;
        }
      })
      .catch(function(error) {

      });
    }
  },
  mounted() {
    this.GetMyPosts();
  }
}
</script>
