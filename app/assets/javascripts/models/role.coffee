Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Role = Backbone.Model.extend
    urlRoot: 'roles'

  Entities.Roles = Sky.Collection.extend
    url: 'roles'
    model: Entities.Role

  API =
    getRoleEntities: (options)->
      result = new Entities.Roles()
      result.fetch(options)
      result

    getRoleEntity: (id) ->
      result = new Entities.Role({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'role:entities', (options)->
    API.getRoleEntities(options)

  Zeprj.reqres.setHandler 'role:entity', (id)->
    API.getRoleEntity(id)