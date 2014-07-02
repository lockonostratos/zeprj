Zeprj.module "WarehouseApp.Inventory", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.ProductSummaryView extends Marionette.ItemView
    template: JST['templates/warehouse/import/productSummary']
    className: 'item-tile'
    tagName: 'li'
    events:
      'click span[editor]': (e) -> @trigger 'edit:model:property', @model, $(e.currentTarget).attr('editor')
      'click .up.link': -> @trigger 'create:import', @model
      'click .save.link': -> @trigger 'sync:edit', @model
    initialize: ->
      @listenTo @model, 'change', -> @render()
