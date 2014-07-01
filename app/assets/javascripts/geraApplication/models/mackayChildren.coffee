Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayChildren = Backbone.Model.extend
    urlRoot: 'mackay_children'

  Entities.MackayChildrens = Sky.Collection.extend
    url: 'mackay_children'
    model: Entities.MackayChildren

  API =
    getMackayChildrenEntities: (options)->
      result = new Entities.MackayChildrens()
      result.fetch options
      result
    getMackayChildrenEntity: (id, options) ->
      result = new Entities.MackayChildren {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayChildren:entities', (options)->
    API.getMackayChildrenEntities options
  Zeprj.reqres.setHandler 'mackayChildren:entity', (id, options)->
    API.getMackayChildrenEntity id, options
