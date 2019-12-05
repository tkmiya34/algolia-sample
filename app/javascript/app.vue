<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import UserIndex from 'user/index.vue'
import UserNew   from 'user/new.vue'
import PostIndex from 'post/index.vue'
import PostNew   from 'post/new.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
      component: UserIndex  },
    { path: '/new',
      name: 'UserNew',
      component: UserNew    }
  ]
})

Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
</style>
