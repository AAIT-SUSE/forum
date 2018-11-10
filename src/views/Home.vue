<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <UserFeed></UserFeed>
      </v-flex>
      <v-flex xl5 lg5 md5 sm12 xs12 order-sm1 order-xs1 order-lg2 order-md2 order-xl2>
        <UserActions></UserActions>
        <infoPanel></infoPanel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserActions from '../components/UserActions.vue';
import UserFeed from '../components/FeedPost.vue';
import InfoPanel from '../components/RightInfoPanel.vue';

export default {
  components: {
    UserActions,
    UserFeed,
    InfoPanel,
  },
}
</script>
