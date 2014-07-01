#= require_tree ../../templates/darius

mixOf = (base, mixins...) ->
  class Mixed extends base
  for mixin in mixins by -1 #earlier mixins override later ones
    for name, method of mixin::
      Mixed::[name] = method
  Mixed

window.Darius = {}

class Darius.App
  constructor: (@appName, @module) ->
    @module.Caption = @appName

  #INTERNALS
  iRenderInto: (region) ->
    @renderInto region
    console.log 'always run'

class Darius.ImportApp extends Darius.App
  renderInto: (region) ->
    console.log 'from Import App'
#
#class Darius.AppGroup
#  renderInto

class Darius.GridRowView extends Marionette.ItemView
  initialize: (options) ->

  template: JST['templates/darius/grid/row']
  tagName: 'tr'
  events:
    'click': 'onClick'

  onClick: -> Zeprj.log @model

  render: ->
#    @$el.attr 'class', 'alt' if @options.index % 2
    @$el.empty().append (@template {model: @model.toJSON(), options: @options})

class Darius.GridView extends Marionette.CompositeView
  template: JST['templates/darius/grid/grid']
  itemView: Darius.GridRowView
  itemViewOptions: (model) ->
    @options.index = @collection.indexOf(model) + 1
    @options

  serializeData: ->
    data = Backbone.Marionette.ItemView.prototype.serializeData.apply(this, arguments)
    data.columns = @options.columns
    data

#  emptyView: Darius.GridEmptyView
  itemViewContainer: ".grid-content"

  initialize: ->
    @collection = @options.collection
    @collection.on 'reset', -> @render()
#
#  render: ->
#    @$el.html (@template @collection)

class Darius.Grid extends Marionette.ItemView
  constructor: (@url, @columns) ->