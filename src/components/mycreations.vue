<template>
  <v-card raised style="min-height: 400px;">


  </v-card>
</template>

<script>
import PostSearch from './PostSearch.vue'
import ClickableListItem from './ClickableListItem.vue'

export default {
  components: {
    PostSearch,
    ClickableListItem,
  },
  data() {
    return {
      categories: ['文章', '帖子', '直答']
    }
  }
}
</script>
