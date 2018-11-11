<template>
  <v-card raised style="min-height: 400px;">
    <v-toolbar color="pink" dark dense>
      <v-toolbar-side-icon></v-toolbar-side-icon>
      <v-toolbar-title>任务清单</v-toolbar-title>
      <v-spacer></v-spacer>

      <v-tooltip left>
        <v-btn icon slot="activator">
          <v-icon>add</v-icon>
        </v-btn>
        <span>添加一个新的分类</span>
      </v-tooltip>
      <v-tabs
        slot="extension"
        v-model="tab"
        color="pink"
        align-with-title
      >
        <v-tabs-slider color="white"></v-tabs-slider>

        <v-tab v-for="category in categories" :key="category">
          {{ category }}
        </v-tab>
      </v-tabs>
    </v-toolbar>

    <v-tabs-items v-model="tab">
      <v-tab-item v-for="category in categories" :key="category">
        <v-list two-line>
          <template v-for="(task, index) in tasks" v-if="task.category === categories.indexOf(category)">
            <v-list-tile
              :key="task.id"
              avatar
              @click="AddToPriority(index)"
            >
              <v-list-tile-content>
                <v-list-tile-title>{{ task.title }}</v-list-tile-title>
                <v-list-tile-sub-title
                  style="color: red"
                  v-if="priority.indexOf(index) >= 0"
                >
                  [ 重要任务 ]
                </v-list-tile-sub-title>
                <v-list-tile-sub-title>{{ task.description }}</v-list-tile-sub-title>
              </v-list-tile-content>

              <v-list-tile-action>
                <v-list-tile-action-text>{{ task.dueTime }}</v-list-tile-action-text>
                <span v-if="priority.indexOf(index) < 0">
                  <v-icon
                    color="grey lighten-1"
                  >
                    flag
                  </v-icon>
                </span>
                <span v-else>
                  <v-icon
                    color="red lighten-1"
                  >
                    flag
                  </v-icon>
                </span>
              </v-list-tile-action>

            </v-list-tile>
            <v-divider
              v-if="index + 1 < tasks.length"
              :key="index"
            ></v-divider>
          </template>
        </v-list>
      </v-tab-item>
    </v-tabs-items>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      tab: null,
      categories: [
        '重要', '全部', '学习', '任务', '待办', '其他'
      ],
      tasks: [
        {
          id: 0,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 1
        },
        {
          id: 1,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 1
        },
        {
          id: 2,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 2
        },
        {
          id: 3,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3
        },
        {
          id: 4,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3
        },
        {
          id: 5,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3
        }
      ],
      priority: [],
    }
  },
  methods: {
    AddToPriority: function(index) {
      let i = this.priority.indexOf(index)

      if(i > -1) {
        this.priority.splice(i, 1);
      } else {
        this.priority.push(index);
      }
    }
  }
}
</script>
