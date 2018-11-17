<template>
  <v-list two-line subheader>
    <div v-for="group in groups" :key="group.id">
      <v-subheader inset>
        {{ group.name }}
      </v-subheader>
      <v-list-tile v-for="item in group.items" :key="item.id" @click=";" avatar>
        <v-list-tile-avatar>
          <v-icon :class="[item.iconClass]">{{ item.icon }}</v-icon>
        </v-list-tile-avatar>
        <v-list-tile-content>
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          <v-list-tile-sub-title>{{ item.subtitle }}</v-list-tile-sub-title>
        </v-list-tile-content>
        <v-list-tile-action>
          <v-btn icon ripple>
            <v-icon color="grey lighten-1">keyboard_arrow_right</v-icon>
          </v-btn>
        </v-list-tile-action>
      </v-list-tile>
      <v-divider inset v-if="groups.indexOf(group) < groups.length - 1"></v-divider>
    </div>
  </v-list> 
</template>

<script>
export default {
  props: {
    groups: {
      id: Number,
      name: String,
      items: {
        id: Number,
        title: String,
        subtitle: String,
        iconClass: String,
        icon: String,
      }
    }
  },
}
</script>
