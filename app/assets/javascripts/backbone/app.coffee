#= require libraries/underscore
#= require libraries/backbone
#= require libraries/backbone.marionette
#= require_tree ./templates
#= require_self
#= require_tree .


window.Zeprj = new Marionette.Application()
#Debugger & Options
Zeprj.debugMode = true
Zeprj.log = (message) ->
  console.log message if Zeprj.debugMode

#Helpers
Zeprj.toRailsUrl = (scope, url) ->
  if scope.isNew then custom = '/' + scope.id else custom = ''
  url + custom + '.json'

#Route & Navigations
Zeprj.getCurrentRoute = -> Backbone.history.fragment
Zeprj.navigate = (route, options = {}) ->
  Backbone.history.navigate(route, options)
  Zeprj.log 'Navigating to ' + route

#Regions
Zeprj.addRegions
  mainRegion: '#main-region'
  afterMainRegion: '#after-main-region'
  endingRegion: '#ending-region'

#Default Initializer!
Zeprj.on 'initialize:after', (options) ->
  if Backbone.history
    Backbone.history.start()
    if @getCurrentRoute() == '' then Zeprj.trigger('navigate:metro')






