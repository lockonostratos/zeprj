Zeprj.Account = DS.Model.extend
  email: DS.attr('string')
  display_name: DS.attr('string')

Zeprj.Account.FIXTURES = [
  { id: 1, email: 'cloud@', display_name: 'cloud'},
  { id: 2, email: 'lee@', display_name: 'llee'},
  { id: 3, email: 'hao@', display_name: 'hao'},
  { id: 4, email: 'son@', display_name: 'son'},
  { id: 5, email: 'louch@', display_name: 'louch'}
];