<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <v-card>
          <v-card-title primary-title>
            <div>
              <h3 class="headline mb-0">{{ title }}</h3>
              <div>作者 {{ author }} , 发表于 {{ time }}</div>
            </div>
          </v-card-title>
          <v-card-text v-html="content"></v-card-text>
        </v-card>
      </v-flex>
      <v-flex xl5 lg5 md5 sm12 xs12 order-sm1 order-xs1 order-lg2 order-md2 order-xl2>
        <v-card flat>
          <v-card-text 
            class="px-0 text-md-center text-sm-center text-xs-center text-lg-center text-xl-center"
          >
          <UserActions
            v-for="act in userActions"
            :key="act.name"
            v-bind:btnColor="act.color"
            v-bind:actName="act.name"
            v-bind:actIcon="act.icon"
            :onClickHandler="ExcuteUserAction"
            ></UserActions>
          </v-card-text>
        </v-card>
        <infoPanel></infoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserActions from '../components/UserActions.vue';
import InfoPanel from '../components/RightInfoPanel.vue';
import router from '@/plugins/router/router.js'
import axios from 'axios'

export default {
  components: {
    UserActions,
    InfoPanel,
  },
  data() {
    return {
      title: '',
      author: '',
      content: '',
      time: '',
      userActions: [
        {
          name: '赞同',
          icon: 'thumb_up',
          color: 'warning',
        },
        {
          name: '收藏',
          icon: 'turned_in',
          color: 'warning',
        },
        {
          name: '返回',
          icon: 'undo',
          color: 'warning',
        },
      ],
    }
  },
  methods: {
    ExcuteUserAction: function(action) {
      switch(action) {
        case '赞同': 
          // do nothing
          break;
        case '收藏': 
          // do nothing
          break;
        default: 
          router.go(-1);
          break;
      }
    },
    GetArticleContent: function() {
      // console.log(this.$route.params.id)
      let aid = this.$route.params.id;
      let self = this;
      axios.get(`/api/ArticleViewSet/${aid}/`)
      .then(function(response) {
        self.content = response.data.content;
        self.author = response.data.user_name;
        self.title = response.data.title;
        self.time = response.data.article_time;
      })
      .catch(function(error) {
        alert('获取文章出现错误。请将以下内容发送给 @蔡仲晨 进行分析：\n' + error);
      });
    }
  },
  mounted() {
    this.GetArticleContent();
  }
}
</script>
