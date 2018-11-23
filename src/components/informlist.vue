<template>
<div float="right">
  <v-layout row>
    <v-flex>
      <v-card>
        <v-toolbar color="indigo darken-3" dark>
        
          <v-toolbar-title>通知公告</v-toolbar-title>

          <v-spacer></v-spacer>

          <v-btn icon>
            <v-icon>search</v-icon>
          </v-btn>

        </v-toolbar>
  
        <v-list two-line>
          <template v-for="(item, index) in items">
            <v-list-tile
              :key="item.title"
              avatar
              ripple
              @click="toggle(index)"
            >
              <v-list-tile-content>
                <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                <v-list-tile-sub-title class="text--primary">{{ item.headline }}</v-list-tile-sub-title>
                <v-list-tile-sub-title>{{ item.subtitle }}</v-list-tile-sub-title>
              </v-list-tile-content>

              <v-list-tile-action>
                <v-list-tile-action-text>{{ item.action }}</v-list-tile-action-text>
                <v-icon
                  v-if="selected.indexOf(index) < 0"
                  color="grey lighten-1"
                >
                  star_border
                </v-icon>

                <v-icon
                  v-else
                  color="yellow darken-2"
                >
                  star
                </v-icon>
              </v-list-tile-action>

            </v-list-tile>
            <v-divider
              v-if="index + 1 < items.length"
              :key="index"
            ></v-divider>
          </template>
        </v-list>
      </v-card>
    </v-flex>
  </v-layout>
</div>
</template>



<script>


export default {
  name:'inform',
   components: {
    },
    data () {
      return {
    
        selected: [2],
        items: [
          {
            action: 'April',
            headline: '换届大会',
            title: '。。。。',
            subtitle: "I'll be in your neighborhood doing errands this weekend. Do you want to hang out?"
          },
          {
            action: 'September ',
            headline: '招新公告',
            title: '。。。。',
            subtitle: "Wish I could come, but I'm out of town this weekend."
          },
          {
            action: 'September',
            headline: '成员大会',
            title: '。。。。',
            subtitle: 'Do you have Paris recommendations? Have you ever been?'
          },
          {
            action: 'October',
            headline: '学术交流会1',
            title: '。。。。',
            subtitle: 'Have any ideas about what we should get Heidi for her birthday?'
          },
          {
            action: 'October',
            headline: '学术交流会2',
            title: '。。。。',
            subtitle: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.'
          }
        ]
      }
    },

    methods: {
      toggle (index) {
        const i = this.selected.indexOf(index)

        if (i > -1) {
          this.selected.splice(i, 1)
        } else {
          this.selected.push(index)
        }
      }
    }
  }
</script>