Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.EmptyTemporaryProductsView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyTemporaryProduct']

  class ThisApp.EmptyProductSummariesView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/emptyProductSummaries']


# TEMP PRODUCTS
  class ThisApp.TemporaryProductView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/temporaryProduct']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:click', @model, $(e.currentTarget).attr('editor')
      'click .delete.link': (e) -> @trigger 'item:delete', @model
    initialize: ->
      @listenTo @model, 'change', -> @render()

  class ThisApp.TemporaryProductsView extends Marionette.CollectionView
    itemView: ThisApp.TemporaryProductView
    emptyView: ThisApp.EmptyTemporaryProductsView
    tagName: 'ul'
    className: 'tile-container'
    initialize: ->
      @on 'itemview:edit:click', (e, model, attribute) -> @trigger 'edit:click', e, model, attribute
      @on 'itemview:item:delete', (e, model) -> @trigger 'item:delete', e, model

    addImport: (model, importQuality, importPrice) ->
      newImport = @collection.create {
        product_code: model.get 'product_code'
        warehouse_id: Zeprj.currentMerchantAccount.get 'current_warehouse_id'
        merchant_account_id: Zeprj.currentMerchantAccount.get 'id'
        name: model.get 'name'
        import_quality: importQuality
        import_price: importPrice
        skull_id: model.get 'skull_id'
      } , {
        wait: true
        success: (model, message) => @trigger 'item:create', model
        error: (model, error) -> Zeprj.log error
      }

  # PRODUCT SUMMARIES
  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['backbone/templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:click', @model, $(e.currentTarget).attr('editor')
      'click .up.link': -> @trigger 'import:click', @model
      'click .save.link': -> @trigger 'item:save', @model
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
      @on 'itemview:edit:click', (e, model, attribute) -> @trigger 'edit:click', e, model, attribute
      @on 'itemview:import:click', (e, model) ->  @trigger 'import:click', model
      @on 'itemview:item:save', (e, model) -> @trigger 'item:save', model
    onShow: ->
      $('input[inputmask-alias]').each ->
        $(@).inputmask($(@).attr('inputmask-alias'))
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

