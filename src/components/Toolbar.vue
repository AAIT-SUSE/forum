<template>
<div>
  <v-toolbar app dark clipped-left>
    <v-toolbar-title v-text="title"></v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn icon to="/user/mynews">
      <v-icon>textsms</v-icon>
    </v-btn>
    <v-btn icon>
      <v-icon>settings</v-icon>
    </v-btn>
    <v-btn icon @click="dialogInfo = true">
      <v-icon>info</v-icon>
    </v-btn>
  </v-toolbar>

  <v-dialog v-model="dialogInfo" max-width="450">
    <v-card>
      <v-card-title class="headline">关于 Envision</v-card-title>
      <v-divider></v-divider>
      <v-card-text>
        <v-container>
          <p>
            Envision - 因问，是人工智能技术协会官方应用。应用内集成招新、登记、活动报名、培训、技术交流、番茄学习、
            奖品兑换等多种功能，方便所在校区不同、课余时段不同、所在部门不同的协会成员们在足不出户的情况下就能完成部分
            学习、工作、和社团事务。
          </p>
          <p>
            Envision 现在由人工智能技术协会 ENVISION 团队负责开发与维护。本项目完全开源免费，也希望对此感兴趣的
            同学们可以积极加入到对项目的贡献中来。你可以点击这里的链接来:<a href="https://shang.qq.com/wpa/qunwpa?idkey=be460a1a06b05ea46997cd1a20bd1a15d3e4301ee28c1123da991e3495d1cfac">
            加入我们的项目开发群</a>、去<a href="https://github.com/AAIT-SUSE">我们的Github主页</a>上
            Star我们，或者<a href="#">在商城花费真实货币</a>支持Envision的开发与维护。
          </p>
          <p>
            点击这里的链接来<a href="#">查看主要开发者及贡献者列表</a>。感谢各位为Envision和人工智能技术协会做
            出的卓越贡献。
          </p>
        </v-container>
      </v-card-text>
      <v-divider></v-divider>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary darken-1" flat="flat" @click="dialogInfo = false" >
          关闭
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</div>
  
  
</template>

<script>
  export default {
    name: 'Toolbar',
    data() {
      return {
        userThemeColor: 'warning',
        title: 'Envision - 因问',
        dialogInfo: false,
      }
    },
  }
</script>