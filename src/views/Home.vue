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
        <infoPanel></infoPanel>
      </v-flex>
      
      <v-dialog v-model="dialogInfo" max-width="450">
        <v-card>
          <v-toolbar card color="blue-grey" dark>
            <v-toolbar-title>新动态</v-toolbar-title>
          </v-toolbar>
        
            <v-card-text>
              
              <v-textarea
                box
                label="内容"
                value=""
              ></v-textarea>
        
              <v-divider class="my-2"></v-divider>
        
              <v-item-group multiple>
                <v-subheader>标签</v-subheader>
                <v-item
                  v-for="n in 8"
                  :key="n"
                >
                  <v-chip
                    slot-scope="{ active, toggle }"
                    :selected="active"
                    @click="toggle"
                  >
                    Tag {{ n }}
                  </v-chip>
                </v-item>
              </v-item-group>
            </v-card-text>
        
            <v-divider></v-divider>
        
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="success" depressed>发表</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-layout>
    <v-dialog v-model="dialogInfo" max-width="450">
      <v-card>
        <v-toolbar card color="blue-grey" dark>
          <v-toolbar-title>新动态</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-textarea box label="内容" value=""></v-textarea>
            <v-divider class="my-2"></v-divider>
            <v-item-group multiple>
              <v-subheader>标签</v-subheader>
              <v-item v-for="n in 8" :key="n">
                <v-chip slot-scope="{ active, toggle }" :selected="active" @click="toggle">
                  Tag {{ n }}
                </v-chip>
              </v-item>
            </v-item-group>
          </v-card-text>
      
          <v-divider></v-divider>
      
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="success"
              depressed
            >发表</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import UserActions from '../components/UserActions.vue';
import UserFeed from '../components/FeedPost.vue';
import InfoPanel from '../components/RightInfoPanel.vue';
import router from '@/plugins/router/router.js'

export default {
  components: {
    UserActions,
    UserFeed,
    InfoPanel,
  },
  data() {
    return {
      dialogInfo: false,
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
          this.dialogInfo = true;
          break;
         default: 
          router.push('/user');
      }
    }
  }
}
</script>
