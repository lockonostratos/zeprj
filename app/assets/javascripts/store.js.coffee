# http://emberjs.com/guides/models/using-the-store/
#App.ApplicationStore = DS.Store.extend
#  adapter: DS.RESTAdapter

#App.ApplicationAdapter = DS.FixtureAdapter;

App.Adapter = DS.RESTAdapter.extend({
  bulkCommit: false
});

App.ApplicationStore = DS.Store.extend({
  revision: 12,
  adapter:  App.Adapter
});
