<template>
  <div class="authenticated" v-if="this.$store.state.isAuthenticated">
    Authenicated
  </div>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link to="/login">Login</router-link> |
    <router-link to="/register">Register</router-link>
    <span class="logout" v-if="this.$store.state.isAuthenticated">
      | <a @click="logout">Logout</a>
    </span>
  </nav>
  <router-view />
</template>

<script>
import axios from "axios";

export default {
  name: "App",
  beforeCreate() {
    this.$store.commit("initializeStore");

    const token = this.$store.state.token;

    if (token) {
      axios.defaults.headers.common["Authorization"] = "Token " + token;
    } else {
      axios.defaults.headers.common["Authorization"] = "";
    }
  },
  methods: {
    logout(e) {
      this.$store.commit("removeToken");
      axios.defaults.headers.common["Authorization"] = "";
      localStorage.removeItem("token");
    },
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 1rem;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }

  span.logout a {
    cursor: pointer;
    text-decoration: underline;
  }
}

.form-wrapper {
  display: flex;
  justify-content: center;
}

form {
  padding: 1rem;
  text-align: left;
  width: 50%;

  .field {
    margin-bottom: 1rem;

    label {
      display: block;
      width: 100%;
    }

    input {
      display: block;
      width: 100%;
      padding: 0.25rem;
    }
  }
}

.authenticated {
  background-color: green;
  color: #fff;
}
</style>
