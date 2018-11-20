<template>
  <div>
    <v-layout row wrap>
      <v-flex xs4>
        <v-card color="blue" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">用户管理</div>
            <div>新增、删除、查找或编辑任何一位用户的信息，包括用户名、班级姓名和其他非隐私信息。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark @click="PushRouterTo('user')">管理用户</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs4>
        <v-card color="blue darken-1" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">文章管理</div>
            <div>删除、查找或编辑任何一位用户的文章。同时，也可以调整权重标记，将某文章置顶。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark @click="PushRouterTo('article')">管理文章</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs4>
        <v-card color="blue darken-2" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">主题管理</div>
            <div>删除、查找或编辑任何一位用户的发帖。同时，也可以调整权重标记，将某主题置顶。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark @click="PushRouterTo('post')">管理帖子</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs4>
        <v-card color="green darken-1" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">论坛管理</div>
            <div>新增、删除、查找或编辑论坛的版块名称和图标。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark @click="PushRouterTo('forum')">管理论坛</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs4>
        <v-card color="green darken-2" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">成就授予</div>
            <div>授予某位用户以奖杯、勋章等成就，或者剥夺某位用户的成就。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark @click="PushRouterTo('achievement')">授予成就</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs4>
        <v-card color="green darken-3" class="white--text mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">动态管理</div>
            <div>查找、删除或编辑任何一位用户发表的动态。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat dark @click="PushRouterTo('feed')">管理动态</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
    <v-layout row wrap>
      <v-flex xs4>
        <v-card color="yellow darken-1" class="mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">商城管理</div>
            <div>新增、删除、查找或编辑 Envision 商城中可供兑换的物品。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat @click="PushRouterTo('shop')">管理商城</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex xs4>
        <v-card color="yellow darken-2" class="mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">小组管理</div>
            <div>新增、删除、查找或编辑小组的名称和图标。可以设置小组的管理员。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat @click="PushRouterTo('group')">管理小组</v-btn>
          </v-card-actions>
        </v-card>

      </v-flex>
      <v-flex xs4>
        <v-card color="yellow darken-3" class="mr-2 mb-2">
          <v-card-title primary-title>
            <div class="headline">信息系统</div>
            <div>向某位或者某些用户发送站内私信，或者在站内群发通知、公告等。</div>
          </v-card-title>
          <v-card-actions>
            <v-btn flat @click="PushRouterTo('system')">信息系统</v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
import router from '@/plugins/router/router.js'

export default {
  methods: {
    PushRouterTo: function(val) {
      router.push('/admin/' + val);
    }
  }
}
</script>
