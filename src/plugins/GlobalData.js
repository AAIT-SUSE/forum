import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const globalData = new Vuex.Store({
  state: {
    userId: '',
  },
  mutations: {
    SetUserId: function(state, val) {
      state.userId = val;
    }
  }
})

export default globalData