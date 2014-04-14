# For more information see: http://emberjs.com/guides/routing/

Zeprj.Router.map ()->
  @resource('index', { path: ''} )
  @resource('warehouses')
  @resource('branches')
  @resource('option')