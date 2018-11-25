<template>
  <v-container align-content-center>
    <v-toolbar dark extended>
      <v-tooltip bottom>
        <v-btn icon slot="activator" to="/admin" active-class="">
          <v-icon>arrow_back</v-icon>
        </v-btn>
        <span>返回到管理中心首页</span>
      </v-tooltip>

      <v-toolbar-title>文章管理</v-toolbar-title>

      <v-text-field
        v-model="search"
        append-icon="search"
        label="搜索文章"
        hide-details
        slot="extension"
      ></v-text-field>
      <v-spacer></v-spacer>
      
      <v-tooltip bottom>
        <v-btn icon slot="activator" active-class="">
          <v-icon>add</v-icon>
        </v-btn>
        <span>增加 1 项数据</span>
      </v-tooltip>

      <v-dialog
        v-model="dialog"
        max-width="420"
        persistent
      >
        <v-card>
          <v-card-title class="headline">删除文章?</v-card-title>

          <v-card-text>
            <p>你即将删除id为 {{deleteId}}，标题为 {{deleteTitle}}，作者为 {{deleteAuthor}} 的文章。</p>
            <p>这个操作无法撤销或恢复，这篇文章将从 Envision 移除。你确认要删除文章吗？</p>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn
              color="green darken-1"
              flat="flat"
              @click="dialog = false"
            >
              取消
            </v-btn>

            <v-btn
              color="error darken-2"
              flat="flat"
              @click="dialog = false; DeleteArticle(deleteId)"
            >
              确认
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-toolbar>

    <div>
      <v-data-table
        :headers="articleHeaders"
        :items="articleList"
        class="elevation-2"
        :search="search"
        dark
        rows-per-page-text="每页数据条数"
        :rows-per-page-items="[10, 20, 50, {'text': '所有', 'value': -1}]"
      >
        <template slot="items" slot-scope="props">
          <td>{{ props.item.aid }}</td>
          <td>{{ props.item.title }}</td>
          <td>{{ props.item.uid }}</td>
          <td>{{ props.item.author }}</td>
          <td>{{ props.item.time }}</td>
          <td>{{ props.item.likes }}</td>
          <td>{{ props.item.type }}</td>
          <td class="justify-center layout px-0">
            <v-icon small class="mr-2">
              remove_red_eye
            </v-icon>
            <v-icon small @click="OpenConfirmWindow(props.item)">
              delete
            </v-icon>
          </td>
        </template>
        <template slot="no-data">
          <div style="text-align: center; font-weight: bold; padding: 30px;">暂无数据</div>
        </template>
      </v-data-table>
    </div>
  </v-container>
</template>

<script>
import axios from 'axios'
import router from '@/plugins/router/router.js'

export default {
  data() {
    return {
      dialog: false,
      articleList: [],
      search: '',
      deleteId: -1,
      deleteTitle: '',
      deleteAuthor: '',
      articleHeaders: [
        { text: '文章id', value: 'aid' },
        { text: '标题', value: 'title', sortable: false },
        { text: '作者id', value: 'uid' },
        { text: '作者', value: 'user_name', sortable: false },
        { text: '发表时间', value: 'time' },
        { text: '赞同数', value: 'likes' },
        { text: '文章类别', value: 'type' },
        { text: '操作', value: 'actions', sortable: false }
      ]
    }
  },
  methods: {
    GetAllArticles: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/ArticleViewSet/`)
      .then(function(response) {
        let data = response.data;
        let len = data.length;
        self.articleList = data;
        for(let i = 0; i < len; i++) {
          self.articleList[i].aid = data[i].article_id;
          self.articleList[i].uid = data[i].user_id;
          self.articleList[i].author = data[i].user_name;
          self.articleList[i].time = data[i].article_time;
          self.articleList[i].title = data[i].title;
          self.articleList[i].type = data[i].article_board_id;
          self.articleList[i].likes = data[i].applaud;
        }
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    OpenConfirmWindow: function(item) {
      this.deleteId = item.aid;
      this.deleteTitle = item.title;
      this.deleteAuthor = item.author;
      this.dialog = true;
    },
    DeleteArticle: function(aid) {
      if(aid === -1) return;
      let self = this;
      axios.delete(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/ArticleViewSet/${this.deleteId}/`,)
      .then(function(response) {
        console.log(response);
        self.deleteId = -1;
        self.deleteTitle = '';
        self.deleteAuthor = '';
        self.GetAllArticles();
      })
      .catch(function(error) {
        console.log(error);
      });

      this.dialog = false;
    }
  },
  mounted() {
    this.GetAllArticles();
  }
}
</script>
