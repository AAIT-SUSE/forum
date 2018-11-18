<template>
  <v-container>
    <div>
      <v-alert
        v-model="greetings"
        dismissible
        type="info"
        transition="scale-transition"
      >
        <p>管理员 {{username}} , 您好。</p>
        <p>欢迎来到 Envision 管理中心。你将会在这里完成对整个应用的管理与维护。你可以点击
          <a href="#" style="color: white">查看帮助</a> 获取帮助信息
        ，来使你更快熟悉管理工作，或者浏览此页面，寻找更多你可能感兴趣的东西。</p>
      </v-alert>
    </div>

    <v-layout>
      <v-flex xs8>
        <celled-panel></celled-panel>
      </v-flex>
      <v-flex xs4>
        <v-card color="warning darken">
          <v-card-title primary-title>
            <div class="headline">通知事项</div>
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text style="min-height: 300px;">
            没有通知或事项
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn flat dark>立即查看</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import RightInfoPanel from '@/components/RightInfoPanel.vue'
import CelledPanel from '@/components/CelledPanel.vue'


export default {
  components: {
    RightInfoPanel,
    CelledPanel,
  },
  data(){
    return {
      username: 'Owen Tsai',
      greetings: true,
    }
  },
}
</script>
