Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Branch = Backbone.Model.extend
    urlRoot: 'branches'

  Entities.Branches = Sky.Collection.extend
    url: 'branches'
    model: Entities.Branch

  API =
    getBranchEntities: (options)->
      result = new Entities.Branches()
      result.fetch options
      result
    getBranchEntity: (id) ->
      result = new Entities.Branch {id: id}
      result.fetch()
      result

  Zeprj.reqres.setHandler 'branch:entities', (options)->
    API.getBranchEntities options
  Zeprj.reqres.setHandler 'branch:entity', (id)->
    API.getBranchEntity id
