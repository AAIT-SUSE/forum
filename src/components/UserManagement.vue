<template>
  <v-container align-content-center>
    <v-toolbar dark extended>
      <v-tooltip bottom>
        <v-btn icon slot="activator" to="/admin" active-class="">
          <v-icon>arrow_back</v-icon>
        </v-btn>
        <span>返回到管理中心首页</span>
      </v-tooltip>

      <v-toolbar-title>用户管理</v-toolbar-title>

      <v-text-field
        v-model="search"
        append-icon="search"
        label="搜索用户"
        hide-details
        slot="extension"
      ></v-text-field>
      <v-spacer></v-spacer>
      
      <v-tooltip bottom>
        <v-btn icon slot="activator" active-class="" @click="AddNewUser()">
          <v-icon>add</v-icon>
        </v-btn>
        <span>增加 1 项数据</span>
      </v-tooltip>

      <v-dialog v-model="dialog" max-width="500px">
        <v-card>
          <v-card-title>
            <span class="headline">编辑用户</span>
          </v-card-title>

          <v-card-text>
            <v-container grid-list-md>
              <v-layout wrap>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItem.nickname" label="昵称"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItem.realName" label="真实姓名"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItem.e_mail" label="邮箱"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="editedItem.credits" label="积分"></v-text-field>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click="dialog=false">取消更改</v-btn>
            <v-btn color="blue darken-1" flat @click="save">确认更改</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-toolbar>

    <div>
      <v-data-table
        :headers="userHeaders"
        :items="userList"
        class="elevation-2"
        :search="search"
        dark
        rows-per-page-text="每页数据条数"
        :rows-per-page-items="[10, 20, 50, {'text': '所有', 'value': -1}]"
      >
        <template slot="items" slot-scope="props">
          <td>{{ props.item.user_id }}</td>
          <td>{{ props.item.nickname }}</td>
          <td>{{ props.item.realName }}</td>
          <td>{{ props.item.e_mail }}</td>
          <td>{{ props.item.major }}</td>
          <td>{{ props.item._class }}</td>
          <td>{{ props.item.credits }}</td>
          <td class="justify-center layout px-0">
            <v-icon small class="mr-2" @click="EditUser(props.item)">
              edit
            </v-icon>
            <v-icon small @click="DeleteUser(props.item)">
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

export default {
  data() {
    return {
      dialog: false,
      userList: [],
      editedItem: {
        nickname: '',
        realName: '',
        e_mail: '',
        credits: 0,
      },
      search: '',
      userHeaders: [
        { text: '用户id', value: 'user_id' },
        { text: '用户名', value: 'nickname', sortable: false },
        { text: '真实姓名', value: 'realName', sortable: false },
        { text: '邮箱', value: 'e_mail', sortable: false },
        { text: '专业', value: 'major', sortable: false },
        { text: '年级与班级', value: '_class' },
        // { text: '身份', value: 'identity', sortable: false },
        // { text: '所属部门', value: 'dept', sortable: false },
        { text: '积分', value: 'credits' },
        { text: '操作', value: 'actions', sortable: false }
      ]
    }
  },
  methods: {
    GetAllUsers: function() {
      let self = this;
      axios.get(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/UserProfileViewSet/`)
      .then(function(response) {
        let data = response.data;
        let len = data.length;
        self.userList = data;
        for(let i = 0; i < len; i++) {
          self.userList[i].id = data[i].user_id;
          self.userList[i].nickname = data[i].nickname;
          self.userList[i].realName = data[i].really_name;
          self.userList[i].e_mail = data[i].e_mail;
          self.userList[i].major = data[i].major;
          self.userList[i]._class = data[i].age + data[i]._class;
          self.userList[i].credits = data[i].account['user_score'];
        }
        console.log(data);
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    EditUser: function(item) {
      this.editedIndex = this.userList.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },
    DeleteUser: function(item) {
      const index = this.userList.indexOf(item)
      confirm('你确认想要删除本条数据吗？该操作带来的后果无法撤销或恢复，请确认') && this.userList.splice(index, 1)
    }
  },
  mounted() {
    this.GetAllUsers();
  }
}
</script>
