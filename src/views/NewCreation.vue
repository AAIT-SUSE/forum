<template>
  <v-container grid-list-md align-content-center>
    <v-layout row wrap>
      <v-flex xl7 lg7 md7 sm12 xs12 order-sm2 order-xs2 order-lg1 order-md1 order-xl1>
        <v-card style="min-height: 400px;">
          <quill-editor 
            v-model="addContent" 
            :options="editorOption"
            >
          </quill-editor>
        </v-card>
      </v-flex>
      <v-flex xl5 lg5 md5 sm12 xs12 order-sm1 order-xs1 order-lg2 order-md2 order-xl2>
        <v-card flat>
          <v-card-text 
            class="px-0 text-md-center text-sm-center text-xs-center text-lg-center text-xl-center"
          >
          <UserActions 
            v-for="act in userActions"
            :key="act.name"
            v-bind:btnColor="act.color"
            v-bind:actName="act.name"
            v-bind:actIcon="act.icon"
            ></UserActions>
          </v-card-text>
        </v-card>
        <right-info-panel></right-info-panel>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import UserActions from '@/components/UserActions.vue'
import RightInfoPanel from '@/components/RightInfoPanel.vue'
import { quillEditor } from 'vue-quill-editor'

export default {
  name: 'newCreation',
  components: {
    RightInfoPanel,
    UserActions,
    quillEditor 
  },
  data() {
    return {
      content: '<h1>Just show up</h1>',
      editorOption: {
        modules: {
          toolbar: [
            [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
            [{ 'align': [] }],
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block'],
            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
            [{ 'color': [] }],
            [{ 'font': [] }],
          ]
        },
      },
      userActions: [
        {
          name: '保存为草稿',
          icon: 'save',
          color: 'warning'
        },
        {
          name: '发布',
          icon: 'publish',
          color: 'warning'
        }
      ]
    }
  }
}
</script>

<style scoped>
  .quill-editor{
    border: none;
  }
</style>
