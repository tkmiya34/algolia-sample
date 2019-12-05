<template>
  <form @submit.prevent="createuser">
    <div>
      <label>Name</label>
      <input v-model="user.name" type="text">
    </div>
    <div>
      <label>Email</label>
      <input v-model="user.email" type="text">
    </div>
    <div>
      <label>Birtday</label>
      <input v-model="user.birth_date" type="date">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      user: {
        name: '',
        email: '',
        birth_date: '',
      },
      error: ''
    }
  },
  methods: {
    createuser: function() {
      let self = this;

      axios
        .post('/api/users', this.user)
        .then(response => {
          let u = response.data;
          this.$router.push({ name: 'UserShow', params: { id: u.id } });
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
}
</script>
