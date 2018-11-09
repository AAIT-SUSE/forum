<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>     
      <v-flex xl7 lg8 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
      <v-card>
        <v-subheader>因问历程</v-subheader>
        <v-timeline align-top>
          <v-timeline-item
            v-for="(item, i) in itemss"
            :color="item.color"
            :icon="item.icon"
            :key="i"
            fill-dot
          >
            <v-card
              :color="item.color"
              dark
            >
              <v-card-title class="title">{{ item.title }}</v-card-title>
              <v-card-text class="white text--primary">
                <p>{{ item.text }}</p>
                <v-btn
                  :color="item.color"
                  class="mx-0"
                  outline
                >
                  点赞因问
                </v-btn>
              </v-card-text>
            </v-card>
          </v-timeline-item>
        </v-timeline>
      </v-card>
    </v-flex>
    <v-flex xl7 lg4 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
      <v-card>
        <v-subheader>基本资料</v-subheader>
        <v-list subheader>
          <v-list-tile
            v-for="item in items"
            :key="item.title"
            avatar
            @click=""
          >

            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
              <v-list-tile-sub-title>{{ item.subtitle }}</v-list-tile-sub-title>
            </v-list-tile-content>
            <v-list-tile-action>
              <v-icon :color="item.active ? 'teal' : 'grey'">{{ item.icon }}</v-icon>
            </v-list-tile-action>
          </v-list-tile>
          
        </v-list>
      </v-card>
      </v-flex>
  </v-layout>
  </v-container>
</template>

<script>
export default {
    name:"userdata",
      data () {
      return {
        items: [
          { active: true, title: '头像', icon:'chevron_right'},
          { active: true, title: '昵称',subtitle:'Owen Tsai',icon:'chevron_right'},
          { active: true, title: '因问账号',subtitle:'YS111'},
          { active: true, title: '设置邮箱',icon:'chevron_right',subtitle:'OwenTsai@163.com'},
        ],
         itemss: [
        {
          title:'因问的开始',
          color: 'red lighten-2',
          icon: 'person',
          text:'2018年10月23日，你加入了因问学习'
        },
        {
          title:'在因问',
          color: 'purple darken-1',
          icon: 'book',
          text:'2018年10月24日，你在因问成长'
        },
        {
           title:'在因问',
          color: 'green lighten-1',
          icon: 'group',
          text:'2018年10月25日，你在因问收获朋友'
        },
        {
          title:'在因问',
          color: 'indigo',
          icon: 'star',
          text:'2018年10月26日，你们在因问起飞'
        }
      ],
      }
    }
}
</script>


<style scoped>

</style>
