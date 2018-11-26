<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <UserFeed></UserFeed>
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
        <v-dialog v-model="dialogExplore" max-width="450">
          <v-card>
            <v-toolbar card color="blue-grey" dark>
              <v-toolbar-title>添加新动态</v-toolbar-title>
            </v-toolbar>
            <v-card-text>        
              <v-textarea solo no-resize v-model="contents"></v-textarea> 
            </v-card-text>  
              <v-card-actions>
                <v-spacer></v-spacer>
              <v-btn color="success" depressed @click="OnClickExplore()"> 发表</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogSuccess" max-width="250">
          <v-card color="success" dark>
            <v-card-text style="font-size:20px text-align:center">
              发布成功
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn depressed outline @click="OnClickSuccess()">确定</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogFalse" max-width="250">
          <v-card color="error" dark>
            <v-card-text style="font-size:20px">
              你发布的内容不能为空
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn depressed outline @click="dialogFalse = false">确定</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <infoPanel></infoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserActions from '../components/UserActions.vue';
import UserFeed from '../components/FeedPost.vue';
import InfoPanel from '../components/RightInfoPanel.vue';
import router from '@/plugins/router/router.js';
import axios from 'axios';
import globalData from '../plugins/GlobalData';

export default {
  components: {
    UserActions,
    UserFeed,
    InfoPanel,
  },
  data() {
    return {
      dialogInfo: false,
      dialogExplore: false,
      dialogSuccess: false,
      dialogFalse: false,
      contents: '',
      userActions: [
        {
          name: '新文章',
          icon: 'create',
          color: 'info',
        },
        {
          name: '新动态',
          icon: 'add_comment',
          color: 'info',
        },
        {
          name: '提问题',
          icon: 'help',
          color: 'info',
        },
      ],
    }
  },
  methods: {
    ExcuteUserAction: function(action) {
      switch(action) {
        case '新文章': 
          router.push('/newPost');
          break;
        case '新动态': 
          this.dialogExplore = true;
          break;
         default: 
          router.push('/user');
      }
    },
    OnClickExplore: function() {
      let self = this;
      if(self.contents != '') {
        axios.post(`/api/FeedViewSet/`,{
        "user_id": parseInt(globalData.state.userId),
        "user_name": globalData.state.nickname,
        "content": self.contents
        }).
        then(function(response) {
          self.dialogSuccess = true;
        }).
        catch(function(error) {
          console.log(error);
        });
      }else {
        self.dialogFalse = true;
      }
    },
    OnClickSuccess: function() {
      this.dialogSuccess = false;
      this.dialogExplore = false;
    }
  }
}
</script>
