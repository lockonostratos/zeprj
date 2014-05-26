Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.temporaryProductView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/temporaryProduct']

  class ThisApp.productSummaryView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/productSummary']
    className: 'product-summary-tile'
    tagName: 'li'
    events:
      'click span': (e)-> @trigger 'clicked', @model, $(e.currentTarget).attr('editor')
    initialize: ->
      @listenTo @model, 'change', -> @render()

  class ThisApp.emptyTemporaryProductsView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyTemporaryProduct']

  class ThisApp.emptyProductSummariesView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyProductSummaries']

  class ThisApp.temporaryProductsView extends Marionette.CollectionView
    itemView: ThisApp.temporaryProductView
    emptyView: ThisApp.emptyTemporaryProductsView

  class ThisApp.productSummariesView extends Marionette.CompositeView
    template: JST['backbone/templates/warehouse/import/productSummaries']
    itemView: ThisApp.productSummaryView
    itemViewContainer: ".tile-container",
    emptyView: ThisApp.emptyProductSummariesView
    ui:
      skyEditor: '#sky-editor'

    initialize: ->
      @bindUIElements()
      @on 'itemview:clicked', (e, model, attribute) ->
        @trigger 'item:click', model, attribute
        $('#sky-editor').val(model.get attribute)
        $('#sky-editor').attr('attr', attribute)
        Zeprj.log @skyEditor
    events:
      'keydown #sky-editor': 'editAction'
    editAction: (e) ->
      ThisApp.currentModel.set($(e.currentTarget).attr('attr'), $(e.currentTarget).val())
