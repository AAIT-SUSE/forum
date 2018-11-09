<template>
  <div>
    <v-card raised v-for="post in posts" :key="post.id" class="mb-4">
      <v-img v-if="post.img"
        :src="post.img"
        aspect-ratio="2.75"
      ></v-img>
      <v-card-title primary-title v-if="post.title">
        <h3 class="headline mb-0">{{ post.title }}</h3>
      </v-card-title>
      <v-card-text v-if="post.content">
        {{ post.content }}
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      posts: [
        {
          id: 0,
          title: '第一篇文章',
          img: 'https://cdn.vuetifyjs.com/images/cards/desert.jpg',
          content: 'just some random text here'
        },
        {
          id: 1,
          title: '第二篇文章没有图',
          content: 'just some random text here',
        },
        {
          id: 2,
          title: '第三篇文章没有字',
          img: 'https://cdn.vuetifyjs.com/images/cards/sunshine.jpg',
        },
      ]
    }
  }
}
</script>
