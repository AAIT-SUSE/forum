<template>
  <v-layout>
    <v-flex>
      <v-card class="ma-2" raised v-for="post in posts" :key="post.id">
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
            @click="AddPostToFav(post.id)"
          >
            <v-icon left>favorite</v-icon> {{ post.likes }}
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name:'PostList',
  data() {
    return {
      posts:[
        {
          id: 0,
          author: 'Owen Tsai',
          content: '这是澳大利亚袋鼠谷(Kangaroo Valley)的美丽景色。正要日落的时候，太阳从地平线照射过来。\n远处可能有动物，我没看清。',
          img:'https://cdn.vuetifyjs.com/images/cards/desert.jpg',
          isLiked: false,
          likes: 46,
          isInFav: false,
        },
        {
          id: 1,
          author: 'Jack Ma',
          content: '双十一给我送了钱的，请点个赞让我知道一下！',
          isLiked: false,
          likes: 123,
          isInFav: false,
        },
        {
          id: 2,
          author: 'Tony Owens',
          content: '多行文本测试\n这是一段很长的文字这是一段很长的文字这是一段很长的文字这是一段很长的文字这是一段很长的文字这是一段很长的文字这是一段很长的文字这是一段很长的文字',
          isLiked: false,
          likes: 0,
          isInFav: false,
        },
      ]
    }
  },
  methods: {
    AddPostToFav: function(id) {
      this.posts[id].isLiked = !this.posts[id].isLiked;
      if(this.posts[id].isLiked === false) {
        this.posts[id].likes -= 1;
      } else {
        this.posts[id].likes += 1;
      }
    }
  },
  props: {
    showCtrlBtns: Boolean
  }
}
</script>