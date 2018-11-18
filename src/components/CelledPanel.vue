<template>
  <div>
    <v-layout row wrap>
      <v-flex xs6>
        <v-card color="blue-grey darken-2" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">用户操作</div>
            <div>新增、删除、查找或编辑任何一位用户的信息，包括用户名、班级姓名和其他非隐私信息。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark>管理用户</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs6>
        <v-card color="blue-grey darken-2" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">文章和帖子操作</div>
            <div>删除、查找或编辑任何一位用户的文章和发帖。同时，也可以调整权重和标记，将某文章置顶。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark>管理文章和帖子</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs6>
        <v-card color="blue-grey darken-2" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">论坛和小组操作</div>
            <div>新增、删除、查找或编辑论坛的版块名称和图标、小组的名称和图标。可以设置论坛与小组的管理员。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark>管理论坛和小组</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs6>
        <v-card color="blue-grey darken-2" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">系统操作</div>
            <div>管理商城的商品，授予用户成就或勋章，发布站内信，以及其他与系统本身相关的管理选项。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark>管理系统</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
export default {
  
}
</script>
