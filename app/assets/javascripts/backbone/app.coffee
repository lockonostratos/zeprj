#= require libraries/underscore
#= require libraries/backbone
#= require libraries/backbone.marionette
#= require libraries/knockout
#= require libraries/knockback
#= require libraries/sky
#= require libraries/jquery.splitter
#= require libraries/hammer
#= require libraries/jquery.hammer
#= require_tree ./templates
#= require_self
#= require_tree .



window.Zeprj = new Marionette.Application()
#Debugger & Options
Zeprj.debugMode = true
Zeprj.log = (message) ->
  console.log message if Zeprj.debugMode

#Route & Navigations
Zeprj.getCurrentRoute = -> Backbone.history.fragment
Zeprj.navigate = (route, options = {}) ->
  Backbone.history.navigate(route, options)
  Zeprj.log 'Navigating to ' + route

#Regions
Zeprj.addRegions
  navigationRegion: '#navigation-region'
  optionRegion: '#option-region'
  mainRegion: '#main-region'
  afterMainRegion: '#after-main-region'
  endingRegion: '#ending-region'

#Default Initializer!
Zeprj.on 'initialize:after', (options) ->
  Zeprj.MetroApp.Controller.renderGlobalUi()
  if Backbone.history
    Backbone.history.start()
    if @getCurrentRoute() == ''
      Zeprj.trigger 'navigate:metro'
    else
      Zeprj.trigger 'navigate:' + @getCurrentRoute()







