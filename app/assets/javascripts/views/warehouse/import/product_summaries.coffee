Zeprj.module "WarehouseApp.Import", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->

  # SINGLE -------------------------------------------------------------------------------------------------------->
  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:click', @model, $(e.currentTarget).attr('editor')
      'click .up.link': -> @trigger 'import:click', @model
      'click .save.link': -> @trigger 'item:save', @model
    initialize: ->
      @listenTo @model, 'change', -> @render()

  # COLLECTION ---------------------------------------------------------------------------------------------------->
  class ThisApp.ProductSummariesView extends Marionette.CompositeView
    template: JST['templates/warehouse/import/productSummaries']
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
