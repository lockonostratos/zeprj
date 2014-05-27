#class Sky.Router extends Backbone.Router
#  constructor: (options) ->
#    @on "all", @storeRoute
#    @history = []
#    super options
#
#  storeRoute: ->
#    @history.push Backbone.history.fragment
#
#  previous: ->
#    if @history.length > 1
#      @navigate @history[@history.length-2], true
#
#  canGoPrevious: -> @history.length > 1
#

# namespace function from the coffeescript faq
window.Sky = {}
class Sky.Collection extends Backbone.Collection
  fetch: (options) ->
    url = @url
    url += '/' + options.action if !!options && !!options.action
    opt =
      url: url
    _.extend opt, options
    Backbone.Collection.prototype.fetch.call @, opt

#Selection view!
class Sky.SelectionControl extends Marionette.ItemView
  collection: {}
  tagName: 'select'
  events:
    'click option': 'onOptionClick'
  onOptionClick: ->
    Zeprj.log 'Click event called!'

  initialize: ->
    @listenTo @collection, 'sync', -> @render()

  render: ->
    el = @$el
    key = @options.keyElement
    val = @options.valueElement
    @collection.each (model)->
      option = "<option value='" + model.attributes[key] + "'>" + model.attributes[val] + "<\/option>"
      el.append option

#Structural classes! -------------------------------------------------------------->
Sky.moduleKeywords = ['included', 'extended']

class Sky.MultiExtensible
  @include: (obj) ->
    throw('include(obj) requires obj') unless obj
    for key, value of obj.prototype when key not in Sky.moduleKeywords
      @::[key] = value

    included = obj.included
    included.apply(this) if included
    @

class Sky.Singleton
  instance = null
  constructor: (@baseType, @constructorParams) ->
  getInstance: ->
    console.log @baseType
    instance ?= new @baseType(@constructorParams)

class Sky.a
  logger: ->
    console.log 'Logger called from a!'
class Sky.c
  printer: ->
    console.log 'Printer called from c!'

class Sky.b extends Sky.MultiExtensible
  @include Sky.a
  @include Sky.c

  logger: ->
    Sky.a::logger.call @
    Sky.c::printer.call @

#Static helpers! -------------------------------------------------------------->
class Sky.Helpers
  @getAttributesArray: (obj)->
    result = []
    for key of obj
      result.push key
    result


#Sky editor! -------------------------------------------------------------->
class Sky.Editor
  @getAttributesArray: (obj)->
    result = []
    for key of obj
      result.push key
    result

  @onStartEditHandler: (editor, model, editOptions, attribute) ->
    editOptions.currentModel = model

    currentOption = editOptions.optionOf attribute
    if currentOption.mask isnt null
      editor.inputmask currentOption.mask, currentOption.maskOptions
    else editor.inputmask 'remove'
    editor.val (model.get attribute)
    editor.attr 'attr', attribute

  @onTabNavigationHandler: (e, editOptions) ->
    currentAttr = $(e.currentTarget).attr('attr')
    if e.shiftKey
      nextAttr = editOptions.previousKeyOf currentAttr
      $(e.currentTarget).attr('attr', nextAttr)
      $(e.currentTarget).val(editOptions.currentModel.get(nextAttr))
    else
      nextAttr = editOptions.nextKeyOf currentAttr
      $(e.currentTarget).val(editOptions.currentModel.get(nextAttr))
      $(e.currentTarget).attr('attr', nextAttr)

  @onEditingHandler: (editor, editOptions) ->
    editOptions.currentModel.set (editor.attr 'attr'), (editor.inputmask 'unmaskedvalue')

class Sky.Editor.RenderOption
  constructor: (@editable = true, @mask=null, @maskOptions={} ) ->

class Sky.Editor.EditOptions
  currentModel: null
  attributes: []
  constructor: (@options) ->
    for key of options
      @attributes.push key if options[key]['editable']
  nextKeyOf: (attribute) ->
    current = @attributes.indexOf attribute
    if current >= 0 and current < @attributes.length
      @currentKey = @attributes[if current == @attributes.length - 1 then 0 else current + 1]
  previousKeyOf: (attribute) ->
    current = @attributes.indexOf attribute
    if current >= 0 and current < @attributes.length
      @currentKey = @attributes[if current == 0 then @attributes.length - 1 else current - 1]
  optionOf: (key) -> @options[key]