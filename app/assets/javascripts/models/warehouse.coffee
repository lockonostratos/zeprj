App.Warehouse = DS.Model.extend
  name: DS.attr('string')

App.Warehouse.FIXTURES = [
  { id: 1, name: 'cloud@' },
  { id: 2, name: 'lee@' },
  { id: 3, name: 'hao@' },
  { id: 4, name: 'son@' },
  { id: 5, name: 'louch@' }
];