App.AccountsRoute = Ember.Route.extend
  model: -> @store.find('account')

App.AccountRoute = Ember.Route.extend
  model: (params) -> @store.find('account', params.id)
#App.AccountRoute = Ember.Route.extend