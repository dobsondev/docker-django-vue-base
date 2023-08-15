<template>
  <h3>Login</h3>
  <div class="form-wrapper">
    <form @submit.prevent="submitForm">
      <div class="field">
        <label for="username">Username</label>
        <input type="email" name="username" v-model="username" />
      </div>
      <div class="field">
        <label for="password">Password</label>
        <input type="password" name="password" v-model="password" />
      </div>
      <div class="field">
        <button type="submit">Login</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "LoginView",
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    submitForm(e) {
      const formData = {
        username: this.username,
        password: this.password,
      };

      axios
        .post("/api/v1/token/login", formData)
        .then((response) => {
          console.log(response);

          const token = response.data.auth_token;
          this.$store.commit("setToken", token);
          axios.defaults.headers.common["Authorization"] = "Token " + token;
          localStorage.setItem("token", token);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
