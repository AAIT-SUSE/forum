<template>
  <div style="margin-top:60px">
    <v-layout row>
    <v-flex xs12 sm6 offset-sm3>
      <v-card>
        <v-list subheader>
          <v-subheader>系统通知</v-subheader>
          <v-list-tile
            v-for="item in items"
            :key="item.title"
            avatar
   
          >
            <v-list-tile-avatar>
              <img :src="item.avatar">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <v-icon :color="item.active ? 'teal' : 'grey'">chat_bubble</v-icon>
            </v-list-tile-action>
          </v-list-tile>
          
        </v-list>

        <v-divider></v-divider>

        <v-list subheader>
          <v-subheader>关注我</v-subheader>

          <v-list-tile
            v-for="item in items2"
            :key="item.title"
            avatar
     
          >
            <v-list-tile-avatar>
              <img :src="item.avatar">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
            </v-list-tile-content>

             <v-list-tile-action>
              <v-btn color="red" small>关注</v-btn>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>

        <v-divider></v-divider>
        <v-list subheader>
          <v-subheader>回复我</v-subheader>
          <v-list-tile
            v-for="item in items"
            :key="item.title"
            avatar
   
          >
            <v-list-tile-avatar>
              <img :src="item.avatar">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <v-icon :color="item.active ? 'teal' : 'grey'">chat_bubble</v-icon>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>

      </v-card>
    </v-flex>
  </v-layout>
  </div>
</template>

<script>
export default {
    name:'shop',
    data () {
      return {
        items: [
          { active: true, title: 'Jason Oner', avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg' },
          { active: true, title: 'Ranee Carlson', avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg' },
          { title: 'Cindy Baker', avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' },
          { title: 'Ali Connors', avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg' }
        ],
        items2: [
          { title: 'Travis Howard', avatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg' }
        ]
      }
    }
}
</script>
