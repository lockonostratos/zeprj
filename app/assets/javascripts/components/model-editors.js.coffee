Zeprj.ModelEditorsComponent = Ember.Component.extend
  keys: (->
    keys = []
    for key in Object.keys(@model._attributes)
      keys.push key

    keys
  ).property()
