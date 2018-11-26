<template>
  <v-container align-content-center>
    <v-toolbar dark extended>
      <v-tooltip bottom>
        <v-btn icon slot="activator" to="/admin" active-class="">
          <v-icon>arrow_back</v-icon>
        </v-btn>
        <span>返回到管理中心首页</span>
      </v-tooltip>

      <v-toolbar-title>动态管理</v-toolbar-title>

      <v-text-field
        v-model="search"
        append-icon="search"
        label="搜索动态"
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
          <v-card-title class="headline">删除动态?</v-card-title>

          <v-card-text>
            <p>你即将删除id为 {{deleteId}}，作者为 {{deleteAuthor}} 的动态。</p>
            <p>这个操作无法撤销或恢复，这篇动态将从 Envision 移除。你确认要删除动态吗？</p>
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
              @click="dialog = false; DeleteFeed(deleteId)"
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
        :items="feedList"
        class="elevation-2"
        :search="search"
        dark
        rows-per-page-text="每页数据条数"
        :rows-per-page-items="[10, 20, 50, {'text': '所有', 'value': -1}]"
      >
        <template slot="items" slot-scope="props">
          <td>{{ props.item.feed_id }}</td>
          <td>{{ props.item.user_id }}</td>
          <td>{{ props.item.user_name }}</td>
          <td>{{ props.item.likes }}</td>
          <td>{{ props.item.content }}</td>
          <td class="justify-center layout px-0">
            <v-icon small class="mr-2" @click=";">
              edit
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
      feedList: [],
      search: '',
      deleteId: -1,
      deleteAuthor: '',
      articleHeaders: [
        { text: '动态id', value: 'feed_id' },
        { text: '作者id', value: 'user_id' },
        { text: '作者', value: 'user_name', sortable: false },
        { text: '赞同数', value: 'applaud' },
        { text: '内容', value: 'content' },
        { text: '操作', value: 'actions', sortable: false }
      ]
    }
  },
  methods: {
    GetAllFeeds: function() {
      let self = this;
      axios.get(`/api/FeedViewSet/`)
      .then(function(response) {
        self.feedList = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    OpenConfirmWindow: function(item) {
      this.deleteId = item.feed_id;
      this.deleteAuthor = item.user_name;
      this.dialog = true;
    },
    DeleteFeed: function(feed_id) {
      if(feed_id === -1) return;
      let self = this;
      axios.delete(`/api/FeedViewSet/${this.deleteId}/`,)
      .then(function(response) {
        console.log(response);
        self.deleteId = -1;
        self.deleteAuthor = '';
        self.GetAllFeeds();
      })
      .catch(function(error) {
        console.log(error);
      });

      this.dialog = false;
    }
  },
  mounted() {
    this.GetAllFeeds();
  }
}
</script>
