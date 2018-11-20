<template>
  <v-card>
    <v-toolbar
      card
      color="pink"
      dark
    >
      <v-toolbar-title>Suggestions</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-icon>send</v-icon>
    </v-toolbar>
    <v-form>
      <v-autocomplete
        v-model="selected"
        :items="['Owen Tsai','Envision团队']"
        chips
        label="To"
        full-width
        hide-details
        hide-no-data
        hide-selected
        multiple
        single-line
      ></v-autocomplete>
      <v-divider></v-divider>
      <v-text-field
        label="title"
        value=""
        single-line
        full-width
        hide-details
      ></v-text-field>
      <v-divider></v-divider>
      <v-textarea
        v-model="title"
        label="Message"
        counter
        maxlength="600"
        full-width
        single-line
      ></v-textarea>
    </v-form>
  </v-card>
</template>



<script>
  export default {
    data () {
      return {
        selected: [''],
        items: ['Owen Tsai','Envision团队' ],
        title: '   '
      }
    }
  }
</script>