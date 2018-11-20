<template>
  <div :class="extraClass">
    <v-alert
      :value="true"
      type="error"
    >
      <b>请注意：</b>本页面的部分功能暂时没有完成/没有上线/没有完善，可能导致此页面不会按照您预想的或者其本身所预期的那样正常工作。我们会在随后修正这里的功能，并移除这条警告信息。
    </v-alert>
  </div>
</template>

<script>
export default {
  name: 'tbcAlert',
  props: {
    extraClass: String
  }
}
</script>
