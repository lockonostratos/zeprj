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

MetroView = Backbone.Marionette.ItemView.extend
  template: JST['backbone/templates/metroView']

Zeprj = new Backbone.Marionette.Application

Zeprj.addRegions
  mainRegion: '#main-region'
  afterMainRegion: '#after-main-region'
  endingRegion: '#ending-region'

Zeprj.on 'initialize:after', (options) ->
  if Backbone.history
    Backbone.history.start()

Zeprj.addInitializer ->
  Zeprj.accounts = new Accounts()

  Zeprj.mainRegion.show(new MetroView())
  Zeprj.afterMainRegion.show(new FormView { collection: Zeprj.accounts })
  Zeprj.endingRegion.show(new AccountsView { collection: Zeprj.accounts })

Zeprj.start()