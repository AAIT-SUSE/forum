import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const globalData = new Vuex.Store({
  state: {
    userId: '',
    nickname: '',
    email: '',
    userAvatar: '',
  },
  mutations: {
    SetUserId: function(state, val) {
      state.userId = val;
    },
    SetNickname: function(state, val) {
      state.nickname = val;
    },
    SetEmail: function(state, val) {
      state.email = val;
    },
    SetAvatar: function(state, val) {
      state.userAvatar = val;
    }
  }
})

export default globalData