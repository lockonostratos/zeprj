# For more information see: http://emberjs.com/guides/routing/

Zeprj.Router.map ()->
  @resource('warehouses', ->
    @resource('warehouse', { path: '/:id' })
    @route('home', { path: '/home' })
    @route('import', { path: '/import' })
    @route('export', { path: '/export' })
    @route('transport', { path: '/transport' })
    @route('check', { path: '/check' })
  )
  @resource('branches')
  @resource('option')
  @resource('accounts', ->
    @resource('account', {path: '/:auth_token'})
  )