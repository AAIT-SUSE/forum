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
          </v-tooltip>
          <v-tooltip bottom>
            <v-btn color="error" flat slot="activator" @click="dialog = true">阅读</v-btn>
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
        <v-card-title class="headline">公告</v-card-title>

        <v-card-text>
          <p style="color: grey; font-size: small">Steve White</p>
          <p>「标题」会议</p>
          <p>
            「正文」宜宾校区A4 201教室，时间：下午1：50，请各位准时参加。
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
  name:'Announcements',
  data() {
    return {
      dialog: false,
      questions:[
        {
          id: 2,
          title: '公告',
          author: 'Steve White ',
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