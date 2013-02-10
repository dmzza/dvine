Vine.Router.map(function() {
  this.resource('videos', { path: '/' }, function() {
    this.route('index');
  });
});
