#Zeprj.module "CustomerApp.Test", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
#  ThisApp.addInitializer ->
#    ThisApp.Caption = 'CREATE AREA'
#    ThisApp.layout = new ThisApp.TestView
#      model: Zeprj.request 'geraArea:entities'
##
##  ThisApp.Controller =
##    renderInto: (region) ->
##      region.show ThisApp.layout