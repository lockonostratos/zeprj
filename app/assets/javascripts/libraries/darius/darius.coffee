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

  onClick: -> @trigger 'row:click', @model

  render: ->
#    @$el.attr 'class', 'alt' if @options.index % 2
    @$el.empty().append (@template {model: @model.toJSON(), options: @options})

class Darius.Grid extends Marionette.CompositeView
  template: JST['templates/darius/grid/grid']
  itemView: Darius.GridRowView
  itemViewContainer: ".grid-content"
  itemViewOptions: (model) ->
    @options.index = @collection.indexOf(model) + 1
    @options

  serializeData: ->
    data = Backbone.Marionette.ItemView.prototype.serializeData.apply(this, arguments)
    data.columns = @options.columns
    data
  ui:
    rowDetail: '.row-detail'

  initialize: ->
    Zeprj.testGird = @
    @on 'itemview:row:click', (e, model) -> @onRowClick(model)
    @collection = @options.collection
    @collection.on 'reset', ->
      @render()

  onRowClick: (model) ->
    return if !@options.rowDetail
    @options.rowDetail.model.set model.toJSON()
    @options.rowDetail.render()
    @ui.rowDetail.empty().append @options.rowDetail.$el

  add: (model) ->
    @collection.add model
    @onRowClick(model)


class Darius.Model
  @SingleFetch: (url, option = null)->
    result = new Backbone.Model()
    result.url = url

    if option then result.fetch(option) else result.fetch()
    result