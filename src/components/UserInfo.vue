<template>
  <v-card>
    <v-img
      src="https://cdn.vuetifyjs.com/images/cards/docks.jpg" aspect-ratio="5.25">
    </v-img>
    
    <v-card-title primary-title class="pt-0">
      <v-flex xs1>
        <v-avatar slot="activator" size="120px" style="top: -60px;">
          <img src="https://randomuser.me/api/portraits/men/85.jpg" alt="Avatar">
        </v-avatar>
      </v-flex>
      <v-spacer></v-spacer>
      <v-flex xs8>
        Owen Tsai
      </v-flex>
      <v-flex>
        <v-card-actions>
          <v-btn flat color="orange" to="/userdata" exact block>更多资料</v-btn>
        </v-card-actions>
      </v-flex>
    </v-card-title>
  </v-card>
</template>

<script>
export default {
    name:"UserInfo"
}
</script>

