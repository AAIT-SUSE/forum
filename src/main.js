import '@babel/polyfill'
import Vue from 'vue'
import './plugins/vuetify'
import App from './App.vue'
import router from './plugins/router/router'
//Vue.config.productionTip = false

import VueQuillEditor from 'vue-quill-editor'
// require styles 引入样式
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

import Vuelidate from 'vuelidate'
import axios from 'axios'


Vue.use(Vuelidate)
// 富文本编辑器
Vue.use(VueQuillEditor)

// Vue.use(axios)


new Vue({
  router,
  render: h => h(App)
}).$mount('#app');