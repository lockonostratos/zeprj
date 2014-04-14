# http://emberjs.com/guides/models/using-the-store/

Zeprj.ApplicationStore = DS.Store.extend
  adapter: DS.RESTAdapter.create()