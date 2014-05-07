#= require libraries/underscore
#= require libraries/backbone
#= require libraries/backbone.marionette
#= require_tree ./backbone/templates


Account = Backbone.Model.extend()
Accounts = Backbone.Collection.extend
  model: Account

AccountView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/accountView']

NoAccountsView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/noAccountsView']

AccountsView = Backbone.Marionette.CollectionView.extend
  itemView: AccountView
  emptyView: NoAccountsView

FormView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/formView']
  events: {
    'click button': 'createNewAccount'
  }
  ui: {
    name: '#name'
    age: '#age'
  }

  createNewAccount: ->
    @collection.add {
      name: @ui.name.val()
      age: @ui.age.val()
    }
    @ui.name.val('')
    @ui.age.val('')

Zeprj = new Backbone.Marionette.Application

Zeprj.addRegions
  mainRegion: '#main-region'
  afterMainRegion: '#after-main-region'

Zeprj.on 'initialize:after', (options) ->
  if Backbone.history
    Backbone.history.start()

Zeprj.addInitializer ->
  Zeprj.accounts = new Accounts()

  Zeprj.mainRegion.show(new FormView { collection: Zeprj.accounts })
  Zeprj.afterMainRegion.show(new AccountsView { collection: Zeprj.accounts })

Zeprj.start()