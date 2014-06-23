Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.CustomerDetailView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/detailCustomer']
    className: 'content'
    ui:
      Name: '#gera-customer-name'
      Area: '#gera-area'
      Search: '#gera-search'
      MackayPersonal: '#mackay_personal_view'
      MackayEducation: '#mackay_education_view'
      Accordion: '#accordion'
    initialize: ->
      @model = Zeprj.request 'geraCustomer:entity', 10
      @listenTo @model, 'change', ->
        @render()
        @.$el.find('.collapsible').collapsible()
#        $('.collapsible').collapsible()
    onShow: ->

    events:
      'click a[id=mackay_personal]': ->
        if !ThisApp.mackayPersonalView
          ThisApp.mackayPersonalView = new ThisApp.MackayPersonalView
            model: Zeprj.request 'mackayPersonal:entity', (@model.get 'id')
        @ui.MackayPersonal.html(ThisApp.mackayPersonalView.render().$el)

      'click a[id=mackay_education]': ->
        if !ThisApp.mackayEducationView
          ThisApp.mackayEducationView = new ThisApp.MackayEducationView
            model: Zeprj.request 'mackayEducation:entity', (@model.get 'id')
        @ui.MackayEducation.html(ThisApp.mackayEducationView.render().$el)


#
#      'click input[id=add_customer]': ->
#        model = new Zeprj.Entities.GeraCustomer
#          name: @ui.Name.val()
#          gera_area_id: @ui.Area.val()
#          gera_account_id: Zeprj.currentAccount.get('id')
#
#        if @ui.Area.val() != "" and @ui.Name.val() != ""
#          model.save {},
#            success: ->
#
#          modelmackay = new Zeprj.Entities.MackayProfile
#            gera_customer_id: Zeprj.currentAccount.get('id')
#            last_updator_id: Zeprj.currentAccount.get('id')
#            notes: Zeprj.currentAccount.get('id')
#          modelmackay.save()
#      'click input[id=seach_customer]': ->
#
#

#
#      'click a[id=mackay_education]': ->
#        newMackayEducation = new ThisApp.MackayEducationView
#          model: Zeprj.request 'mackayPersonal:entities'#
#        @ui.MackayEducation.html(newMackayEducation.render().$el)









