Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Permission = Backbone.Model.extend
    urlRoot: 'permissions'

  Entities.Permissions = Sky.Collection.extend
    url: 'permissions'
    model: Entities.Permission

  API =
    getPermissionEntities: (options)->
      result = new Entities.Permissions()
      result.fetch(options)
      result

    getPermissionEntity: (id) ->
      result = new Entities.Permission({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'permission:entities', (options)->
    API.getPermissionEntities(options)

  Zeprj.reqres.setHandler 'permission:entity', (id)->
    API.getPermissionEntity(id)