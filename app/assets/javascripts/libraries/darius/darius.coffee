mixOf = (base, mixins...) ->
  class Mixed extends base
  for mixin in mixins by -1 #earlier mixins override later ones
    for name, method of mixin::
      Mixed::[name] = method
  Mixed

window.Darius = {}

class Darius.App
  constructor: (@appName, @module) ->
    @module.Caption = @appName

  #INTERNALS
  iRenderInto: (region) ->
    @renderInto region
    console.log 'always run'

class Darius.ImportApp extends Darius.App
  renderInto: (region) ->
    console.log 'from Import App'
#
#class Darius.AppGroup
#  renderInto