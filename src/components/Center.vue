<template>
  <v-card>
    <v-list two-line subheader>
      <v-subheader>因问中心</v-subheader>
      <v-list-tile v-for="item in items" :key="item.title" avatar>
        <v-list-tile-avatar>
          <v-icon :class="[item.iconClass]">{{ item.icon }}</v-icon>
        </v-list-tile-avatar>

        <v-list-tile-content>
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          
        </v-list-tile-content>

        <v-list-tile-action>
          <v-btn icon ripple :to="item.link">
            <v-icon color="grey lighten-1">info</v-icon>
          </v-btn>
        </v-list-tile-action>
      </v-list-tile>
    </v-list>
  </v-card>
</template>

<script>
export default {
  name: 'Center',
   data () {
      return {
        items: [
          { icon: 'group_work', iconClass: 'grey lighten-1 white--text', title: '小组建设',link:"/centre/shop"},
          { icon: 'shop', iconClass: 'grey lighten-1 white--text', title: '积分商城', link:"/centre/shop"},
         
          { icon: 'mail', iconClass: 'grey lighten-1 white--text', title: '反馈与建议',link:"/centre/suggestions" },

        ],
      }
    }
 
}
</script>
