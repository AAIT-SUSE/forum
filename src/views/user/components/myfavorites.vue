<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap> 
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
      <v-card>

        <v-list two-line subheader>
          <v-subheader inset>Folders</v-subheader>

          <v-list-tile
            v-for="item in items"
            :key="item.title"
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
              <v-btn icon ripple :to="item.link">
                <v-icon color="grey lighten-1">info</v-icon>
              </v-btn>
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
    name:'myfavorites',
    data () {
      return {
        items: [
          { icon: 'folder', iconClass: 'grey lighten-1 white--text', title: '照片', subtitle: 'Jan 9, 2018',link:'/user/myfavrites/my-fav-photos' },
          { icon: 'folder', iconClass: 'grey lighten-1 white--text', title: '帖子', subtitle: 'Jan 25, 2018',link:'/user/myfavrites/my-fav-posts' },
          { icon: 'folder', iconClass: 'grey lighten-1 white--text', title: '文章', subtitle: 'Jan 17, 2018',link:'/user/myfavrites/my-fav-articles' },
          { icon: 'folder', iconClass: 'grey lighten-1 white--text', title: '其他', subtitle: 'Jan 28, 2018' }
        ],
      }
    }
}
</script>
