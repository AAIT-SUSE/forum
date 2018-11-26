<template>
  <v-list two-line subheader>
    <div v-for="group in groups" :key="group.group_id">
      <v-list-tile @click=";" avatar>
        <v-list-tile-avatar>
          <v-icon :class="[group.iconClass]">{{ group.icon }}</v-icon>
        </v-list-tile-avatar>
        <v-list-tile-content>
          <v-list-tile-title>
            {{ group.group_name }}
            <font size="0.5px">|创建时间:{{group.creat_time}}</font>
          </v-list-tile-title>
          <v-list-tile-sub-title>{{ group.description }}</v-list-tile-sub-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-btn icon ripple>
            <v-icon color="grey lighten-1">keyboard_arrow_right</v-icon>
          </v-btn>
        </v-list-tile-action>
      </v-list-tile>
    </div>
  </v-list>
</template>

<script>
import axios from 'axios'

export default {
  data(){
    return {
      groups: [
        {
          group_id: 0,
          group_name: 'C / C++',
          description: '无最新消息',
          iconClass: 'info white--text',
          icon: 'code',
          creat_time: '2018-11-25'
        },
        {
          group_id: 1,
          group_name: 'Unity 游戏开发',
          description: '无最新消息',
          iconClass: 'info white--text',
          icon: 'videogame_asset',
          creat_time: '2018-11-24'
        },
        {
          group_id: 2,
          group_name: 'Web 开发',
          description: '无最新消息',
          iconClass: 'info white--text',
          icon: 'web',
          creat_time: '2018-11-23'
        },
      ]
    }
  },
  // methods: {
  //   GroupListGet: function() {
  //     let self = this;
  //     axios.get(`http://www.aait-suse.cn/api/GroupViewSet/`
  //     ).
  //     then(function(response) {
  //       //console.log(response.data)
  //       self.items = response.data;
  //     }).
  //     catch(function(error) {
  //       console.log(error);
  //     })
  //   }
  // },
  // mounted() {
  //   this.GroupListGet();
  // }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
