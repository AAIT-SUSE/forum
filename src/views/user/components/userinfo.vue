<template>
      <v-card>
        <v-img
          src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
          aspect-ratio="5.25"
          
        >
        </v-img>
        
        <v-card-title primary-title>
          <v-flex xs1>
            
            <v-avatar
              slot="activator"
              size="130px"
            >
              <img
                src="https://randomuser.me/api/portraits/men/85.jpg"
                alt="Avatar"
              >
            </v-avatar>
          </v-flex>
          <v-spacer></v-spacer>
          <v-spacer></v-spacer>
          <v-spacer></v-spacer>
          <v-spacer></v-spacer>
          <v-spacer></v-spacer>
          <v-flex xs8 >
            <div class="font-weight-medium display-1">Owen Tsai</div>
            
            
            <v-icon class="body-2" color="blue">favorite</v-icon>
            <el class ="font-weight-medium body-1">
               因问积分:
            </el>
            <el>666</el>
            <v-spacer></v-spacer>
            <v-icon class="body-2" color="grey">turned_in</v-icon>
            <el class ="font-weight-medium body-1">
               个性宣言:
            </el>
            <el>没啥本事，随便学学。</el>
          </v-flex>
          <v-flex>
            <v-card-actions>
              <v-btn flat color="orange" to="/userdata" exact block>更多资料</v-btn>
            </v-card-actions>
          </v-flex>
  
        </v-card-title>

        
      </v-card>
</template>

<script>
export default {
    name:"userinfo"
}
</script>
