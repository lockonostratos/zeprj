Zeprj.module "CustomerApp.Customer", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  class ThisApp.EmptyTemporaryProductsView extends Marionette.ItemView
    template: JST['templates/customer/home/emptyTemporaryProduct']
    className: 'empty-view import-temporaries'

  class ThisApp.EmptyCustomerSummariesView extends Marionette.ItemView
    template: JST['templates/customer/home/emptyCustomerSummaries']
    className: 'empty-view import-summaries'