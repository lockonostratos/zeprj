# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource('index', { path: ''} )
  @resource('warehouses', ->
    @resource('warehouse', { path: '/:id' })
  )
  @resource('branches')
  @resource('option')
  @resource('accounts', ->
    @resource('account', {path: '/:auth_token'})
  )