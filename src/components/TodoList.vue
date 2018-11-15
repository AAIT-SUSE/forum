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
        <v-list three-line>
          <template v-for="(task, index) in tasks" 
            v-if="task.category === categories.indexOf(category)"
          >
            <ClickableListItem
              :key="task.id"
              :showSubtitle="priority.indexOf(index) >= 0"
              :subtitle="'[ 重要任务 ]'"
              :title="task.title"
              :description="task.description"
              :dueTime="task.dueTime"
              :icons="task.currentIcons"
              hasDropdownMenu
              :menuItems="menuItems"
            ></ClickableListItem>
            <v-divider :key="task"></v-divider>
          </template>
        </v-list>
      </v-tab-item>
    </v-tabs-items>
  </v-card>
</template>

<script>
import ClickableListItem from './ClickableListItem.vue'

export default {
  components: {
    ClickableListItem
  },
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
          description: '完成高等数学第8章的课后练习题完成高等数学第8章的课后练习题完成高等数学第8章的课后练习题完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 1,
          currentIcons: [],
        },
        {
          id: 1,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 1,
          currentIcons: [],
        },
        {
          id: 2,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 2,
          currentIcons: [],
        },
        {
          id: 3,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3,
          currentIcons: [],
        },
        {
          id: 4,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3,
          currentIcons: [],
        },
        {
          id: 5,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3,
          currentIcons: [],
        },
        {
          id: 6,
          title: '高等数学练习',
          description: '完成高等数学第8章的课后练习题',
          dueTime: '11月12日',
          category: 3,
          currentIcons: [],
        }
      ],
      priority: [],
      menuItems: [
        {name: '标记/取消星标'},
        {name: '完成该任务'},
        {name: '删除该任务'},
      ]
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
