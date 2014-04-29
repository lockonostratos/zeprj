#Zeprj.WarehousesHomeController = Ember.ArrayController.extend()

#Zeprj.WarehousesProductSummariesController = Ember.ArrayController.extend()

Zeprj.WarehousesImportController = Ember.Controller.extend
  needs: ['warehousesHome']
  productSummariesBinding: 'controllers.warehousesHome'
