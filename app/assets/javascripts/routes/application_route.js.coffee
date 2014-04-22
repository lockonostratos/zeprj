Zeprj.ApplicationRoute = Ember.Route.extend
  model: ->
    account: @store.find('account', 0)
    merchantAccount: @store.find('merchantAccount', 0)