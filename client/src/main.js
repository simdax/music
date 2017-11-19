// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import io from 'vue-socket.io'
import config from './config'
Vue.use(io, `${config.host}:${config.port}`)
Vue.config.productionTip = false

//import osc from 'osc-js'
//console.log(new osc)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
