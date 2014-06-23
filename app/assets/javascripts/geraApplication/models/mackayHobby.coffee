Zeprj.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.MackayHobby = Backbone.Model.extend
    urlRoot: 'mackay_hobbies'

  Entities.MackayHobbies = Sky.Collection.extend
    url: 'mackay_hobbies'
    model: Entities.MackayHobby

  API =
    getMackayHobbyEntities: (options)->
      result = new Entities.MackayHobbies()
      result.fetch options
      result
    getMackayHobbyEntity: (id, options) ->
      result = new Entities.MackayHobby {id: id}
      result.fetch(options)
      result

  Zeprj.reqres.setHandler 'mackayHobby:entities', (options)->
    API.getMackayHobbyEntities options
  Zeprj.reqres.setHandler 'mackayHobby:entity', (id, options)->
    API.getMackayHobbyEntity id, options
