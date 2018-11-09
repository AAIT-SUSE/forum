<template>
  <v-card flat>
    <v-card-text 
      class="px-0 text-md-center text-sm-center text-xs-center text-lg-center text-xl-center"
    >
      <!-- User Actions -->
      <v-btn v-for="act in userActions" :key="act.name" :color="act.color">
        {{ act.name }}
        <v-icon right dark>{{ act.icon }}</v-icon>
      </v-btn>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      userActions: [
        {
          name: '新文章',
          icon: 'create',
          color: 'info'
        },
        {
          name: '新动态',
          icon: 'add_comment',
          color: 'info'
        },
        {
          name: '提问题',
          icon: 'help',
          color: 'info'
        },
      ],
    }
  }
}
</script>
