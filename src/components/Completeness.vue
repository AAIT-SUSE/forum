<template>
  <v-card>
    <v-subheader>周完成率</v-subheader>
    <div class="text-xs-center">
      <v-progress-circular
      :rotate="-90"
      :size="100"
      :width="15"
      :value="value"
      color="primary"
      >
      {{ value + '%' }}
      </v-progress-circular>
    </div>
    <v-divider></v-divider>
    <v-subheader>月完成率</v-subheader>
    <div class="text-xs-center">
      <v-progress-circular
      :rotate="-90"
      :size="100"
      :width="15"
      :value="value"
      color="blue"
      >
      {{ value + '%' }}
      </v-progress-circular>
    </div>
  </v-card>
</template>

<script>
export default {
  name:'Completeness',
  data () {
    return {
      interval: {},
      value: 0
    }
  },
  beforeDestroy () {
    clearInterval(this.interval)
  },
  mounted () {
    this.interval = setInterval(() => {
      if (this.value === 100) {
        return (this.value = 0)
      }
      this.value += 1
    }, 1000)
  }
}
</script>

<style scoped>
  .v-progress-circular
    {margin: 1rem}
</style>