<template>
  <v-card>
    <v-toolbar color="light-blue" dark>
      <v-toolbar-title>{{ topTitle }}</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon @click="ShowSearchInput()">
        <v-icon>search</v-icon>
      </v-btn>
    </v-toolbar>

    <v-list two-line subheader>
      <div v-for="group in groups" :key="group.id">
        <v-subheader inset>
          {{ group.name }}
        </v-subheader>

        <v-list-tile
          v-for="item in group.items"
          :key="item.id"
          @click=";"
          avatar
        >
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
  </v-card>
</template>

<script>
export default {
  data () {
    return {
      topTitle: '论坛',
      groups: [
        {
          id: 0,
          name: '公告与新闻',
          items: [
            {id: 0, title: '公告', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'announcement'},
            {id: 1, title: '活动', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'local_activity'},
          ]
        },
        {
          id: 1,
          name: '公告与新闻',
          items: [
            {id: 3, title: '公告', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'folder'},
            {id: 4, title: '公告', subtitle: '无 最新消息', iconClass: 'info white--text', icon: 'folder'},
            {id: 5, title: '公告', subtitle: '无最新消息', iconClass: 'info white--text', icon: 'folder'},
          ]
        },
      ]
    }
  },
  methods: {
    ShowSearchInput: function() {

    },
    ItemHover: function() {
      console.log(this.$el);
    }
  }
}
</script>
