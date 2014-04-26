# for more details see: http://emberjs.com/guides/views/

Zeprj.WarehousesView = Ember.View.extend
  templateName: 'warehouses'


Zeprj.WarehousesProductSummaries = Ember.View.extend
  didInsertElement: ->
    alert("Hello!")