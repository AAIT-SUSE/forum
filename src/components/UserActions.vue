<template>
  <!-- User Actions -->
  <v-btn :color="btnColor" @click="onClickHandler(actName)">
    {{ actName }}
    <v-icon right dark>{{ actIcon }}</v-icon>
  </v-btn>
</template>

<script>
export default {
  props: {
    btnColor: String,
    actName: String,
    actIcon: String,
    onClickHandler: Function
  }
}
</script>
