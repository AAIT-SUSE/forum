<template>
     <div>

      <v-tabs
        slot="extension"
        v-model="tab"
        color="white"
        grow
      >
        <v-tabs-slider color="yellow"></v-tabs-slider>

        <v-tab
          v-for="item in items"
          :key="item"
        >
          {{ item }}
        </v-tab>
      </v-tabs>

    <v-tabs-items v-model="tab">
      <v-tab-item
        v-for="item in tabcontent"
        :key="item"
      >

      </v-tab-item>
    </v-tabs-items>
  </div>
</template>


<script>
export default {
  data () {
    return {
      tab: null,
      items: [
        '我的创作', '我的关注', '我的收藏', '我的成就',
      ],
      tabcontent: [
          
      ],
    }
  }
}
    

</script>
