#Ember.Application.initializer(
#  name: 'currentAccount'
#  after: 'store'
#
#  initialize: (container) ->
#    store = container.lookup('store:main')
##    account = App.Account.find('current')
##    container.lookup('controller:currentAccount').set('content', account)
##    container.typeInjection('controller', 'currentAccount', 'controller:CurrentAccount')
#)