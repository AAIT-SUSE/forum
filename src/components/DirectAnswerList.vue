<template>
  <v-layout>
    <v-flex>
      <v-card class="ma-2" raised v-for="question in questions" :key="question.id">
        <v-img v-if="question.img"
          :src="question.img"
          aspect-ratio="2.75"
        ></v-img>

        <v-card-title primary-title>
          <div>
            <h3 class="headline mb-0">{{ question.title }}</h3>
            <div>
              {{ question.author }}
            </div>
          </div>
        </v-card-title>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-tooltip bottom>
            <v-btn 
              flat
              color="error"
              slot="activator"
            >
              <v-icon left>thumb_up_alt</v-icon> {{ question.likes }}
            </v-btn>
            <span>{{question.totalRead}}人看过此条回答，{{question.likes}}人认为很有帮助</span>
          </v-tooltip>
          <v-tooltip bottom>
            <v-btn color="error" flat slot="activator" @click="dialog = true">阅读</v-btn>
            <span>阅读答案需要消耗 10 积分</span>
          </v-tooltip>
          <v-tooltip bottom>
            <v-btn color="success" flat>回答该问题</v-btn>
            <span>回答该问题</span>
          </v-tooltip>
        </v-card-actions>
      </v-card>
    </v-flex>

    <v-dialog
      v-model="dialog"
      max-width="450"
    >
      <v-card>
        <v-card-title class="headline">什么是直答？</v-card-title>

        <v-card-text>
          <p style="color: grey; font-size: small">此问题由 Steve White 向 Owen Tsai 提问</p>
          <p>「直答」是 Envision 即将上线的新型问答模式。</p>
          <p>
            「直答」允许用户提出一个问题，并就这个问题向任何一名另外的 Envision 用户请求帮助。每提出 1 个问题，
            提问者需要消耗 1 「直答券」。「直答券」可以在商城中花费积分购买，也可通过其他活动途径获得。
          </p>
          <p>
            任何用户在「直答」中提出的问题都是公开的，其他人可以花费一定数量的积分作为“悬赏金额”，来查看某个问题的解答。
            问题的悬赏金额由答题者自行设置。
          </p>
          <p>
            当提问者指定的答题人拒绝回答问题，或问题提出24小时解答者仍然未解答时，此问题视作未提出，
            提问者的「直答券」将不会消耗。同时，请注意：「直答券」是一种昂贵的物品，
            <span style="color: red">请珍惜你的提问机会，培养独立解决问题的习惯和能力</span>
          </p>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn
            color="green darken-1"
            flat="flat"
            @click="dialog = false"
          >
            关闭
          </v-btn>

        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-layout>
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
      questions:[
        {
          id: 2,
          title: '什么是直答？',
          author: '由 Steve White 向 Owen Tsai 提问',
          isLiked: false,
          likes: 0,
          totalRead: 3,
          modal: 'dialog'
        },
      ]
    }
  },
  methods: {
    AddArticleToFav: function(id) {
      this.articles[id].isLiked = !this.articles[id].isLiked;
      if(this.articles[id].isLiked === false) {
        this.articles[id].likes -= 1;
      } else {
        this.articles[id].likes += 1;
      }
    }
  }
}
</script>