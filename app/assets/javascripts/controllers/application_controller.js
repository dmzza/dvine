Vine.ApplicationController = Ember.Controller.extend({
  currentPathChanged: function() {
    var page;

    // Track the page in Google Analytics
    if (!Ember.isNone(_gaq)) {
      // Assume that if there is a hash component to the url then we are using
      // the hash location strategy. Otherwise, we'll assume the history
      // strategy.
      page = window.location.hash.length > 0 ?
             window.location.hash.substring(1) :
             window.location.pathname;

      // You need your Google Analytics code already loaded for _ga to be initialized
      _gaq.push(['_trackPageview', page]);
    }
  }.observes('currentPath')
});
