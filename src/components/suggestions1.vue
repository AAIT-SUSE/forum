<template>
  <v-form v-model="valid">
    <v-text-field
      v-model="name"
      :rules="nameRules"
      :counter="10"
      label="Name"
      required
    ></v-text-field>
     <v-text-field
      v-model="id"
      :rules="idRules"
      label="ID"
      required
    ></v-text-field>
      <v-text-field
      v-model="major"
      :rules="majorRules"
      label="major"
      required
    ></v-text-field>
    <v-text-field
      v-model="email"
      :rules="emailRules"
      label="E-mail"
      required
    ></v-text-field>
  </v-form>
</template>


<script>
import suggestions from './suggestions.vue'
  export default {
    data: () => ({
      valid: false,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => v.length <= 10 || 'Name must be less than 10 characters'
      ],
      id: '',
      idRules: [
        v => !!v || 'Id is required',
         v => /.+@.+/.test(v) || 'ID must be valid'
      ],
      major: '',
      majorRules: [
        v => !!v || 'Major is required',
         v => /.+@.+/.test(v) || 'Major must be valid'
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid'
      ], 
      })
  }
</script>
