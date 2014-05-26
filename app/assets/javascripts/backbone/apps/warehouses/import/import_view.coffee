Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.TemporaryProductView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/temporaryProduct']

  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/productSummary']
    className: 'product-summary-tile'
    tagName: 'li'
    events:
      'click span': (e)-> @trigger 'clicked', @model, $(e.currentTarget).attr('editor')
    initialize: ->
      @listenTo @model, 'change', -> @render()

  class ThisApp.EmptyTemporaryProductsView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyTemporaryProduct']

  class ThisApp.EmptyProductSummariesView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyProductSummaries']

  class ThisApp.TemporaryProductsView extends Marionette.CollectionView
    itemView: ThisApp.TemporaryProductView
    emptyView: ThisApp.EmptyTemporaryProductsView

  class ThisApp.ProductSummariesView extends Marionette.CompositeView
    template: JST['backbone/templates/warehouse/import/productSummaries']
    itemView: ThisApp.ProductSummaryView
    itemViewContainer: ".tile-container",
    emptyView: ThisApp.EmptyProductSummariesView

    initialize: ->
      @on 'itemview:clicked', (e, model, attribute) ->
        @trigger 'item:click', e, model, attribute
    events:
      'keyup #sky-editor': 'editAction'
      'keydown #sky-editor': 'keydownAction'
      'click #sky-new': 'createAction'
    editAction: (e) ->
      ThisApp.currentModel.set($(e.currentTarget).attr('attr'), $(e.currentTarget).val())
    keydownAction: (e)->
      if e.keyCode == 9
        e.preventDefault()
        @trigger 'editor:tab', e
      if $(e.currentTarget).attr('editor') is 'number'
        Zeprj.log 'should be number men!'
    createAction: ->
      @collection.add(new Zeprj.Entities.ProductSummary)

