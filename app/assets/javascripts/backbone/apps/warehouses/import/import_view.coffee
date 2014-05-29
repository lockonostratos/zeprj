Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.TemporaryProductView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/temporaryProduct']

  class ThisApp.EmptyTemporaryProductsView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyTemporaryProduct']

  class ThisApp.EmptyProductSummariesView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyProductSummaries']

  class ThisApp.TemporaryProductsView extends Marionette.CollectionView
    itemView: ThisApp.TemporaryProductView
    emptyView: ThisApp.EmptyTemporaryProductsView

  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e)-> @trigger 'clicked', @model, $(e.currentTarget).attr('editor')
    initialize: ->
      @listenTo @model, 'change', -> @render()

  class ThisApp.ProductSummariesView extends Marionette.CompositeView
    template: JST['backbone/templates/warehouse/import/productSummaries']
    className: 'import-product-summary-wrapper'
    itemView: ThisApp.ProductSummaryView
    itemViewContainer: ".tile-container"
    emptyView: ThisApp.EmptyProductSummariesView
    ui:
      skyEditor: '#sky-editor'
      importQuality: '#import-quality'
      importPrice: '#import-price'

    initialize: ->
      @on 'itemview:clicked', (e, model, attribute) -> @trigger 'item:click', e, model, attribute
    onShow: ->
      $('input[inputmask-alias]').each ->
        $(@).inputmask($(@).attr('inputmask-alias'))
        Zeprj.log $(@).attr('inputmask-alias')
    events:
      'keyup #sky-editor': 'editAction'
      'keydown #sky-editor': 'keydownAction'
      'click #sky-new': 'createAction'
    editAction: -> @trigger 'model:editing'
    keydownAction: (e)->
      if e.keyCode == 9
        e.preventDefault()
        @trigger 'editor:tab', e
    createAction: ->
      @collection.add(new Zeprj.Entities.ProductSummary)

