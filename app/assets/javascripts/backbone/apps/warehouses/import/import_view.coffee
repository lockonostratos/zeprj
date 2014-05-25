Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.temporaryProductView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/temporaryProduct']

  ThisApp.productSummaryView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/productSummary']
    className: 'product-summary-tile'
    tagName: 'li'
    events:
      'click span': (e)-> @trigger 'clicked', @model, $(e.currentTarget).attr('editor')
    initialize: ->
      @listenTo @model, 'change', -> @render()

  ThisApp.emptyTemporaryProductsView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/emptyTemporaryProduct']

  ThisApp.emptyProductSummariesView = Marionette.ItemView.extend
    template: JST['backbone/templates/warehouse/import/emptyProductSummaries']

  ThisApp.temporaryProductsView = Marionette.CollectionView.extend
    itemView: ThisApp.temporaryProductView
    emptyView: ThisApp.emptyTemporaryProductsView

  ThisApp.productSummariesView = Marionette.CompositeView.extend
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
