Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.CustomerDetailView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/detailCustomer']
    className: 'content'
    ui:
      skyEditor: '#sky-editor'
      MackayProfile: '#mackay_profile_view'
      MackayPersonal: '#mackay_personal_view'
      MackayEducation: '#mackay_education_view'
      MackayFamily: '#mackay_family_view'
      MackayHobby: '#mackay_hobby_view'
      MackayLifeStyle: '#mackay_life_style_view'
      MackayAndCompany: '#mackay_and_company_view'
      MackayCareer: '#mackay_career_view'

    initialize: ->
      @model = Zeprj.request 'geraCustomer:entity', 10
      @listenTo @model, 'change', ->
        @render()
        @.$el.find('.collapsible').collapsible()
    onShow: ->
      $

    events:
      'click a[id=mackay_personal]': (e) ->
        if !ThisApp.mackayPersonalView
          ThisApp.mackayPersonalView = new ThisApp.MackayPersonalView
            model: Zeprj.request 'mackayPersonal:entity', (@model.get 'id')
          ThisApp.mackayPersonalView.on 'edit:mackayPersonal:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayPersonal.html(ThisApp.mackayPersonalView.render().$el)

      'click a[id=mackay_education]': ->
        if !ThisApp.mackayEducationView
          ThisApp.mackayEducationView = new ThisApp.MackayEducationView
            model: Zeprj.request 'mackayEducation:entity', (@model.get 'id')
          ThisApp.mackayEducationView.on 'edit:mackayEducation:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayEducation.html(ThisApp.mackayEducationView.render().$el)

      'click a[id=mackay_career]': ->
        if !ThisApp.mackayCareerView
          ThisApp.mackayCareerView = new ThisApp.MackayCareerView
            model: Zeprj.request 'mackayCareer:entity', (@model.get 'id')
          ThisApp.mackayCareerView.on 'edit:mackayCareer:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayCareer.html(ThisApp.mackayCareerView.render().$el)

      'click a[id=mackay_family]': ->
        if !ThisApp.mackayFamilyView
          ThisApp.mackayFamilyView = new ThisApp.MackayFamilyView
            model: Zeprj.request 'mackayFamily:entity', (@model.get 'id')
          ThisApp.mackayFamilyView.on 'edit:mackayFamily:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayFamily.html(ThisApp.mackayFamilyView.render().$el)

      'click a[id=mackay_hobby]': ->
        if !ThisApp.mackayHobbyView
          ThisApp.mackayHobbyView = new ThisApp.MackayHobbyView
            model: Zeprj.request 'mackayHobby:entity', (@model.get 'id')
          ThisApp.mackayHobbyView.on 'edit:mackayHobby:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayHobby.html(ThisApp.mackayHobbyView.render().$el)

      'click a[id=mackay_life_style]': ->
        if !ThisApp.mackayLifeStyleView
          ThisApp.mackayLifeStyleView = new ThisApp.MackayLifeStyleView
            model: Zeprj.request 'mackayLifeStyle:entity', (@model.get 'id')
          ThisApp.mackayLifeStyleView.on 'edit:mackayLifeStyle:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayLifeStyle.html(ThisApp.mackayLifeStyleView.render().$el)

      'click a[id=mackay_and_company]': ->
        if !ThisApp.mackayAndCompanyView
          ThisApp.mackayAndCompanyView = new ThisApp.MackayAndCompanyView
            model: Zeprj.request 'mackayAndCompany:entity', (@model.get 'id')
          ThisApp.mackayAndCompanyView.on 'edit:mackayAndCompany:model:property', (model, attribute) =>
            @trigger 'edit:model:property', model, attribute
        @ui.MackayAndCompany.html(ThisApp.mackayAndCompanyView.render().$el)
