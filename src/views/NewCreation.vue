<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <v-card style="min-height: 400px;">
          <v-text-field
            label="文章标题"
            outline
            v-model="articleTitle"
          ></v-text-field>
          <quill-editor 
            v-model="editorContent" 
            :options="editorOption"
            >
          </quill-editor>
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
        <right-info-panel></right-info-panel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserActions from '@/components/UserActions.vue'
import RightInfoPanel from '@/components/RightInfoPanel.vue'
import { quillEditor } from 'vue-quill-editor'
import axios from 'axios'

export default {
  name: 'newCreation',
  components: {
    RightInfoPanel,
    UserActions,
    quillEditor 
  },
  data() {
    return {
      articleTitle: '',
      editorContent: '<h1 class="ql-align-center">欢迎使用 Envision 记录你的灵感</h1><p class="ql-align-center"><br></p><blockquote>欢迎使用Envision-QuillEditor富文本编辑器，以下是一个简单的示例。</blockquote><p><br></p><p>这是一段默认文本，你可以对这段默认文本进行编辑。</p><p><br></p><p>文本编辑器支持各种<span style="color: rgb(230, 0, 0);">颜色</span>和基本的<strong>文字处理</strong>与<u>排版功能</u>，可以满足<em>发表文章  </em><s>和发表文章</s>的基本需求。</p><p><br></p><p>本富文本编辑器基于<span class="ql-font-monospace">Quill Editor开发，能够和vue框架完美结合。甚至可以插入代码：</span></p><p><br></p><pre class="ql-syntax" spellcheck="false">using System;\nusing UnityEditor;\n\npublic class Player : Character {\n    private int HP;\n    \n    public DamageHealth(int amount) {\n        HP -= amount;\n        if(HP &lt;= 0) {\n            Die();\n        }\n    }\n}\n</pre><p><br></p><ul><li>代码高亮正在逐步完善，并在下一版本更新。Envision-QuillEditor首个版本代码高亮支持C, Cpp, C sharp, JavaScript(ES6), Typescript, PHP, Unity-C#语法的高亮。</li></ul><p><br></p><p>欢迎来我们的Github页https://github.com/AAIT-SUSE/forum，查看源代码，并对Star、Fork我们的项目！</p>',
      editorOption: {
        modules: {
          toolbar: [
            [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
            [{ 'align': [] }],
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block'],
            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
            [{ 'color': [] }],
            [{ 'font': [] }],
          ]
        },
      },
      userActions: [
        {
          name: '保存为草稿',
          icon: 'save',
          color: 'warning'
        },
        {
          name: '发布',
          icon: 'publish',
          color: 'warning'
        }
      ]
    }
  },
  methods: {
    ArticleListPost: function() {
      let self = this;
      let myDate = new Date();
      axios.post(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/ArticleViewSet/`, {
        'user_id': globalData.state.userId,
        // 'user_id': 12,
        'user_name': globalData.state.nickname,
        'article_time': myDate.toLocaleString('chinese', {hour12: false}),
        'title': self.articleTitle,
        'is_valid': 1,
        'content': self.editorContent,
        // 'article_board_id': 'default',
      }).
      catch(function(error) {
        console.log(error);
      });
    },
    SaveAsDraft: function() {
      let self = this;
      let myDate = new Date();
      axios.post(`${'https://cors-anywhere.herokuapp.com/'}http://www.aait-suse.cn/api/ArticleViewSet/`, {
        'user_id': globalData.state.userId,
        // 'user_id': 12,
        'user_name': globalData.state.nickname,
        'article_time': myDate.toLocaleString('chinese', {hour12: false}),
        'title': self.articleTitle,
        'is_valid': 0,
        'content': self.editorContent,
        // 'article_board_id': 'default',
      }).
      catch(function(error) {
        console.log(error);
      });
    },
    ExcuteUserAction: function(action) {
      switch(action) {
        case '发布': 
          this.ArticleListPost();
        break;
        case '保存为草稿': 
          this.SaveAsDraft();
        break;
      }
    }
  },
}
</script>


<style scoped>
  .quill-editor{
    border: none;
  }
</style>
