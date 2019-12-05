<template>
  <div id="app">
    <input v-model="search_text" placeholder="edit me">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Birtday</th>
        </tr>
        <tr v-for="u in post" :key="u.id">
          <td>{{ u.id }}</td>
          <td>{{ u.name }}</td>
          <td>{{ u.email }}</td>
          <td>{{ u.birth_date }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import algoliasearch from 'algoliasearch';

export default {
  data: function () {
    return {
      users: [],
      search_text: '',
      index: null
    }
  },
  mounted () {
    let self = this;
    // Algolia APIクライアントを初期化
    let searchClient = algoliasearch(
      'U0PLXSOPWY',
      '00532e57f151384d590bff6d62711cee'
    )
    // 使用するindexを指定
    self.index = searchClient.initIndex('User');
    this.searchUser()
  },
  watch: {
    search_text: function () {
      this.searchUser()
    }
  },
  watch: {
    search_text: function () {
      this.searchUser()
    }
  },
  methods: {
    searchUser: function () {
      let self = this;
      // ここでAlgoliaのAPIへ検索リクエストを投げています
      // searchメソッドの第一引数が検索文字列です。
      // 試しに "art" で検索してみます
      self.index.search(self.search_text, (err, { hits } = {}) => {
        // 検索結果をデータバインドしているusersに格納
        self.users = hits;
      });
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
