class Zeprj.Router extends Backbone.Router
  constructor: (options) ->
    @on "all", @storeRoute
    @history = []
    super options

  storeRoute: ->
    @history.push Backbone.history.fragment

  previous: ->
    if @history.length > 1
      @navigate @history[@history.length-2], true

  canGoPrevious: -> @history.length > 1