<template>
  <h3>Register</h3>
  <div class="form-wrapper">
    <form @submit.prevent="submitForm">
      <div class="field">
        <label for="username">Username</label>
        <input type="text" name="username" v-model="username" />
      </div>
      <div class="field">
        <label for="password">Password</label>
        <input type="password" name="password" v-model="password" />
      </div>
      <div class="field">
        <button type="submit">Register</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Register",
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
        .post("/api/v1/users/", formData)
        .then((response) => {
          this.$router.push("/login");
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
