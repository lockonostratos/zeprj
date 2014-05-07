Ember.Handlebars.registerBoundHelper 'dynamicInput', (key, currentKey, options) ->
  options.hash.valueBinding = 'model.' + key
#  if key == currentKey then options.h
  Ember.Handlebars.helpers.input.apply(this, [options])
