<template>
  <v-container grid-list-md align-content-center>
    <GroupedPanelList :groups='groups'></GroupedPanelList>
  </v-container>
</template>

<script>
import GroupedPanelList from '../components/GroupedPanelList.vue'

export default {
    components:{
      GroupedPanelList,
    },
  data(){
    return {
      groups: [
        {
          id: 0,
          name: '公告 / 新闻',
          items: [
            {id: 0, title: '公告', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'announcement'},
            {id: 1, title: '活动与新闻', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'local_activity'},
          ]
        },
        {
          id: 1,
          name: '技术交流',
          items: [
            {id: 3, title: 'C / C++', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'code'},
            {id: 4, title: 'Unity 游戏开发', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'videogame_asset'},
            {id: 5, title: 'Web 开发', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'web'},
          ]
        },
      ]
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
