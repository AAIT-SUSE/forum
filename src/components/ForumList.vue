<template>
  <v-list two-line subheader>
    <div v-for="group in groups" :key="group.id">
      <v-subheader inset>
        {{ group.name }}
      </v-subheader>
      <v-list-tile v-for="item in group.items" :key="item.id" @click=";" avatar>
        <v-list-tile-avatar>
          <v-icon :class="[item.iconClass]">{{ item.icon }}</v-icon>
        </v-list-tile-avatar>
        <v-list-tile-content>
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          <v-list-tile-sub-title>{{ item.subtitle }}</v-list-tile-sub-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-btn icon ripple>
            <v-icon color="grey lighten-1">keyboard_arrow_right</v-icon>
          </v-btn>
        </v-list-tile-action>
      </v-list-tile>
      <v-divider inset v-if="groups.indexOf(group) < groups.length - 1"></v-divider>
    </div>
  </v-list>
</template>

<script>

export default {
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
