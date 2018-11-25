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
          title: '我们在人工智能前沿论坛',
          img: 'https://raw.githubusercontent.com/AAIT-SUSE/forum/master/src/assets/img/1541430949292.jpeg',
          content: '人工智能四川省重点实验室成功举办“2018年人工智能前沿论坛”。四川理工学院校长庹先国、中国航天科技集团有限公司一院十二所所长马卫华、四川省科技厅副巡视员李粟璇分别致辞祝贺。论坛设置了“航天智能技术”、“人工智能及其应用”、“酿造智能关键技术”等为主题的三个分论坛。来自全国各地科研院所和高校的专家、学者围绕“人工智能前沿研究”的主题，共同探讨了人工智能的基础科学问题和关键技术，分析展望了未来人工智能技术的应用和发展。通过本次论坛有利于促进新一代人工智能技术在经济社会转型升级中的创新引擎作用，推动人工智能、大数据、物联网等新经济产业的加快发展。'
        },
        {
          id: 1,
          title: '精品活动',
          content: '人工智能技术协会开展学术交流会活动',
        },
        {
          id: 2,
          title: '四川省大学生机器人大赛',
          img: 'https://raw.githubusercontent.com/AAIT-SUSE/forum/master/src/assets/img/1f76593f744b542.jpg',
        },
      ]
    }
  }
}
</script>