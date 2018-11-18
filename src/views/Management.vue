<template>
  <v-container grid-list-md align-content-center>
    <v-toolbar>
      <v-tooltip bottom>
        <v-btn icon slot="activator" to="/admin" active-class="">
          <v-icon>arrow_back</v-icon>
        </v-btn>
        <span>返回到管理中心首页</span>
      </v-tooltip>

      <v-toolbar-title>{{topTitle}}</v-toolbar-title>
      <v-spacer></v-spacer>
      
      <v-tooltip bottom>
        <v-btn icon slot="activator" active-class="" @click="AddNewRow()">
          <v-icon>add</v-icon>
        </v-btn>
        <span>增加 1 项数据</span>
      </v-tooltip>
    </v-toolbar>

    <div>
      <v-data-table
        v-if="topTitle === '用户管理'"
        :headers="tableHeaders"
        :items="tableItems"
        class="elevation-2"
      >
        <template slot="items" slot-scope="props">
          <td>{{ props.item.name }}</td>
          <td class="text-xs-right">{{ props.item.calories }}</td>
          <td class="text-xs-right">{{ props.item.fat }}</td>
          <td class="text-xs-right">{{ props.item.carbs }}</td>
          <td class="text-xs-right">{{ props.item.protein }}</td>
          <td class="justify-center layout px-0">
            <v-icon
              small
              class="mr-2"
              @click="editItem(props.item)"
            >
              edit
            </v-icon>
            <v-icon
              small
              @click="deleteItem(props.item)"
            >
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

export default {
  data() {
    return {
      topTitle: '',
      navs: [
        {
          text: '管理后台',
          disabled: false,
          href: 'admin'
        },
      ],
      dialog: false,
      tableHeaders: [],
      tableItems: [],
      userHeaders: [
        { text: '用户id', value: 'uid' },
        { text: '用户名', value: 'username', sortable: false },
        { text: '专业', value: 'major', sortable: false },
        { text: '班级', value: 'class', sortable: false },
        { text: '身份', value: 'identity', sortable: false },
        { text: '所属部门', value: 'dept', sortable: false },
        { text: '积分', value: 'credits' },
        { text: '操作', value: 'actions', sortable: false }
      ],
      postHeaders: [
        { text: '帖子id', value: 'pid' },
        { text: '作者id', value: 'uid', sortable: false },
        { text: '作者名', value: 'username', sortable: false },
        { text: '赞同数', value: 'likes' },
        { text: '置顶权重', value: 'topLevel', sortable: false },
        { text: '操作', value: 'actions', sortable: false }
      ],
      articleHeaders: [
        { text: '作品id', value: 'aid' },
        { text: '作品名', value: 'articleName' },
        { text: '作者id', value: 'uid', sortable: false },
        { text: '作者名', value: 'username', sortable: false },
        { text: '赞同数', value: 'likes' },
        { text: '作品标签', value: 'tags', sortable: false },
        { text: '置顶权重', value: 'class', sortable: false },
        { text: '操作', value: 'actions', sortable: false }
      ],
      groupHeaders: [
        { text: '小组id', value: 'gid' },
        { text: '小组名', value: 'username' ,sortable: false, },
        { text: '负责人', value: 'major', sortable: false },
        { text: '成员数', value: 'class', sortable: false },
        { text: '威望值', value: 'identity', sortable: false },
        { text: '所属部门', value: 'dept', sortable: false },
        { text: '操作', value: 'actions', sortable: false }
      ],
      forumHeaders: [
        { text: '板块id', sortable: true, value: 'uid' },
        { text: '板块名称', sortable: false, value: 'username' },
        { text: '所属类别', value: 'major', sortable: false },
        { text: '主题数量', value: 'class', sortable: false },
        { text: '上次活跃时间', value: 'identity', sortable: false },
        { text: '操作', value: 'actions', sortable: false }
      ],
      desserts: [],
      editedIndex: -1,
      editedItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0
      },
      defaultItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0
      }
    }
  },
  mounted() {
    switch(this.$route.params.type) {
      case 'user':
        this.topTitle = '用户管理';
        this.tableHeaders = this.userHeaders;
        // this.tableItems GET via ajax
      break;

      case 'group':
        this.topTitle = '论坛与小组管理';
        // this.tableHeaders = groupHeaders;
        // this.tableItems GET via ajax
      break;

      case 'post':
        this.topTitle = '帖子与文章管理';
        // this.tableHeaders = postHeaders;
        // this.tableItems GET via ajax
      break;

      default:
        this.topTitle = '系统管理';
        // this.tableHeaders = systemHeaders;
        // this.tableItems GET via ajax
      break;
    }
  }
}
</script>
