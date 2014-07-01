#= require libraries/underscore
#= require libraries/backbone
#= require libraries/backbone.marionette
#= require libraries/darius/darius
#= require libraries/backbone-ui
#= require libraries/knockout
#= require libraries/knockback
#= require_directory ../libraries/jquery.inputmask
#= require libraries/accounting
#= require libraries/sky
#= require libraries/jquery.splitter
#= require libraries/hammer
#= require libraries/jquery.hammer
#= require libraries/jquery.mousewheel
#= require libraries/jquery.collapsible


#= require_tree ../templates
#= require_self
#= require_tree ../views
#= require_tree ../controllers
#= require_tree ../models

#TODO: OBSOLETE - WILL BE DELETE
#= require_tree ./viewmodels
#= require_tree ./apps
#= require_tree ../geraApplication/models


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
    Backbone.history.start()#{pushState: true})
    if @getCurrentRoute() == ''
      Zeprj.trigger 'navigate:metro'
    else
      Zeprj.trigger 'navigate:' + @getCurrentRoute()







