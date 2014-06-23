Zeprj.module "CustomerApp.Detail", (ThisApp, Zeprj, Backbone, Marionette, $, _) ->
  ThisApp.MackayPersonalView = Marionette.ItemView.extend
    template: JST['templates/customer/detail/mackayPersonal']
    className: 'content'
    ui:
      last_name: '#last_name'
      firt_name: '#first_name'
      position: '#position'
      company_name: '#company_name'
      company_address: '#company_address'
      company_phone: '#company_phone'
      date_of_birth: '#date_of_birth'
      place_of_birth: '#place_of_birth'
      home_town: '#home_town'
      home_address: '#home_address'
      home_addres: '#home_addres'
      home_phone: '#home_phone'
      height: '#height'
      weight: '#weight'
      comment: '#comment'

    initialize: ->
     @listenTo @model, 'change', -> @render()

    onShow: ->
      $(document).foundation()
    events:
      'click input[id=update-personal]': ->
        @model.save({
          last_name: @ui.last_name.val()
          firt_name: @ui.firt_name.val()
          position: @ui.position.val()
          company_name: @ui.company_name.val()
          company_address: @ui.company_address.val()
          company_phone: @ui.company_phone.val()
          date_of_birth: @ui.date_of_birth.val()
          place_of_birth: @ui.place_of_birth.val()
          home_town: @ui.home_town.val()
          home_address: @ui.home_address.val()
          home_addres: @ui.home_addres.val()
          home_phone: @ui.home_phone.val()
          height: @ui.height.val()
          weight: @ui.weight.val()
          comment: @ui.comment.val()
        }, {
          success: -> Zeprj.log 'success'
          error: -> Zeprj.log 'error'
        })

