<template>
  <v-card
    color="grey lighten-4"
    flat
    height="00px"
  >
    <v-toolbar color="grey darken-1" dark>
      <v-toolbar-side-icon></v-toolbar-side-icon>

      <v-menu :nudge-width="100">
        <v-toolbar-title slot="activator">
          <span>消息管理</span>
          <v-icon dark>arrow_drop_down</v-icon>
        </v-toolbar-title>

        <v-list>
          <v-list-tile
            v-for="item in items1"
            :key="item"
            @click=""
          >
            <v-list-tile-title v-text="item"></v-list-tile-title>
          </v-list-tile>
        </v-list>
      </v-menu>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>search</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>more_vert</v-icon>
      </v-btn>
    </v-toolbar>
    <v-cards >
          <v-list two-line>
            <template v-for="(item, index) in items.slice(0, 12)">
        
              <v-divider v-if="item.divider" :inset="item.inset" :key="index"></v-divider>
              <v-list-tile v-else :key="item.title" avatar @click="">
                <v-list-tile-content>
                  <v-list-tile-title v-html="item.title"></v-list-tile-title>
                  <v-flex x16 lg6 md6 xs12 sm12 offset-sm12>
                  <v-btn icon>
                  <v-icon right>publish</v-icon>
                  <v-icon right>border_color</v-icon>
                  <v-icon right>delete_fsweep</v-icon> 
                </v-btn>
                 </v-flex> 
                </v-list-tile-content>
              </v-list-tile>
            </template>
          </v-list>
        </v-cards>
  </v-card>        
</template>


<script>
  export default {
    name:"messagedata",
    data: () => ({
      items1: [
         '文章', '帖子'
      ],
      items: [
        { title: '文章1'},
        { divider: true, inset: true },
        { title: '文章2'},
        { divider: true, inset: true },
        { title: '文章3'},
        { divider: true, inset: true },
        { title: '文章4'},
        { divider: true, inset: true },
        { title: '文章5'}
      ]
    })
  }
</script>