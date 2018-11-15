<template>
  <v-navigation-drawer persistent :mini-variant="miniVariant" clipped v-model="drawer" enable-resize-watcher fixed app dark>
    <v-list class="pa-1">
      <v-list-tile v-if="miniVariant" @click.stop="miniVariant = !miniVariant">
        <v-list-tile-action>
          <v-icon>chevron_right</v-icon>
        </v-list-tile-action>
      </v-list-tile>

      <v-list-tile avatar tag="div">
        <v-list-tile-avatar>
          <img :src=userAvatar>
        </v-list-tile-avatar>

        <v-list-tile-content>
          <v-list-tile-title>{{username}}</v-list-tile-title>
        </v-list-tile-content>

        <v-list-tile-action>
          <v-btn icon @click.stop="miniVariant = !miniVariant">
            <v-icon>chevron_left</v-icon>
          </v-btn>
        </v-list-tile-action>
      </v-list-tile>
    </v-list>

    <v-list class="pt-0">
      <v-divider light></v-divider>
      <v-list-tile v-for="item in items" :key="item.title" :to="item.link" class="white--text">
        <v-list-tile-action>
          <v-icon>{{item.icon}}</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
          <v-list-tile-title>{{item.title}}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-navigation-drawer>
</template>


<style scoped>  

</style>


<script>
export default {
  data() {
    return {
      drawer: true,
      miniVariant: true,
      name: 'SideMenu',
      username: 'Owen Tsai',
      userAvatar: 'https://randomuser.me/api/portraits/men/85.jpg',
      items: [
        {
          icon: "home",
          title: "首页",
          link: "/home"
        },
        {
          icon: "school",
          title: "学习",
          link: "/study"
        },
        {
          icon: "forum",
          title: "论坛",
          link: "/forum"
        },
        {
          icon: "public",
          title: "发现",
          link: "/Explore"
        },
        {
          icon: "account_circle",
          title: "个人中心",
          link: "/user",
        }
      ],
    }
  }
}
</script>
