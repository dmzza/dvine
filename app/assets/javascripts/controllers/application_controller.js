Vine.ApplicationController = Ember.Controller.extend({
  currentPathChanged: function() {
    var page;

    // Thanks: http://www.pansapien.com/2013/01/27/using-google-analytics-with-ember-js/
    if (!Ember.isNone(_gaq)) {
      // Assume that if there is a hash component to the url then we are using
      // the hash location strategy. Otherwise, we'll assume the history
      // strategy.
      page = window.location.hash.length > 0 ?
             window.location.hash.substring(1) :
             window.location.pathname;

      _gaq.push(['_trackPageview', page]);
    }
  }.observes('currentPath')
});
