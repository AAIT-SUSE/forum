<template>
  <div>
    <v-list-tile avatar @click="tileClickHandler(linkToPush)">
      <v-list-tile-avatar v-if="tileAvatar === true">
        <v-icon>{{ tileIcon }}</v-icon>
      </v-list-tile-avatar>

      <v-list-tile-content>
        <v-list-tile-title>{{ title }}</v-list-tile-title>
        <v-list-tile-sub-title
          :style="cssStyle"
          v-if="showSubtitle === true"
        >
          {{ subtitle }}
        </v-list-tile-sub-title>
        <v-list-tile-sub-title>{{ description }}</v-list-tile-sub-title>
      </v-list-tile-content>

      <v-list-tile-action>
        <v-list-tile-action-text>{{ dueTime }}</v-list-tile-action-text>
        <span>
          <span class="current-icons">
            <v-icon v-for="icon in icons" :key="icon">
              {{icon.iconName}}
            </v-icon>
          </span>
          <v-menu right bottom>
            <v-btn icon v-if="hasDropdownMenu === true" slot="activator">
              <v-icon>more_vert</v-icon>
            </v-btn>

            <v-list>
              <v-list-tile
                v-for="(item, i) in menuItems"
                :key="i"
                @click=";"
              >
                <v-list-tile-title>{{ item.name }}</v-list-tile-title>
              </v-list-tile>
            </v-list>
          </v-menu>
        </span>
      </v-list-tile-action>

    </v-list-tile>
  </div>
</template>

<script>
export default {
  name: 'ClickableListItem',
  props: {
    showSubtitle: Boolean,
    tileAvatar: Boolean,
    tileIcon: String,
    sbtitle: String,
    title: String,
    description: String,
    dueTime: String,
    hasDropdownMenu: Boolean,
    tileClickHandler: Function,
    linkToPush: String,
    icons: {
      iconName: String,
    },
    menuItems: {
      name: String,
    }
  },
}
</script>
