Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.RolePermission = Backbone.Model.extend
    urlRoot: 'role_permissions'

  Entities.RolePermissions = Sky.Collection.extend
    url: 'role_permissions'
    model: Entities.RolePermission

  API =
    getRolePermissionEntities: (options)->
      result = new Entities.RolePermissions()
      result.fetch(options)
      result

    getRolePermissionEntity: (id) ->
      result = new Entities.RolePermission({id: id})
      result.fetch()
      result

  Zeprj.reqres.setHandler 'rolePermissions:entities', (options)->
    API.getRolePermissionEntities(options)

  Zeprj.reqres.setHandler 'rolePermission:entity', (id)->
    API.getRolePermissionEntity(id)