<template>
  <v-card>
    <v-subheader>因问积分</v-subheader>
    <v-data-table
      :headers="headers"
      :items="desserts"
      :loading="true"
      class="elevation-1"
      >
      <v-progress-linear slot="progress" color="blue" indeterminate></v-progress-linear>
      <template slot="items" slot-scope="props">
      <td>{{ props.item.name }}</td>
      <td class="text-xs-right">{{ props.item.get }}</td>
      <td class="text-xs-right">{{ props.item.expend }}</td>
      <td class="text-xs-right">{{ props.item.sum }}</td>
      <td class="text-xs-right">{{ props.item.iron }}</td>
      </template>
    </v-data-table>
  </v-card>
</template>

<script>
export default {
    name:"Integralform",
    data () {
      return {
        headers: [
          {
            text: '本月积分',
            align: 'left',
            sortable: false,
            value: 'name'
          },
          { text: '获得', value: 'get' },
          { text: '消耗', value: 'expend' },
          { text: '共计', value: 'sum' },
          { text: '淨增', value: 'iron' }
        ],
        desserts: [
          {
            value: false,
            name: '20181020',
            get: 159,
            expend: 6.0,
            sum: 24,
            iron: '11'
          },
          {
            value: false,
            name: '20181019',
            get: 237,
            expend: 9.0,
            sum: 37,
            iron: '12'
          },
          {
            value: false,
            name: '20181018',
            get: 262,
            expend: 16.0,
            sum: 23,
            iron: '73'
          },
          {
            value: false,
            name: '20181017',
            get: 305,
            expend: 3.7,
            sum: 67,
            iron: '84'
          },
          {
            value: false,
            name: '20181016',
            get: 356,
            expend: 16.0,
            sum: 49,
            iron: '164'
          },
          {
            value: false,
            name: '20181015',
            get: 375,
            expend: 0.0,
            sum: 94,
            iron: '44'
          },
          {
            value: false,
            name: '20181014',
            get: 392,
            expend: 0.2,
            sum: 98,
            iron: '44'
          },
          {
            value: false,
            name: '20181013',
            get: 408,
            expend: 3.2,
            sum: 87,
            iron: '45'
          },
          {
            value: false,
            name: '20181012',
            get: 452,
            expend: 25.0,
            sum: 51,
            iron: '22'
          },
          {
            value: false,
            name: '20181011',
            get: 518,
            expend: 26.0,
            sum: 65,
            iron: '6'
          }
        ]
      }
    }
}
</script>

