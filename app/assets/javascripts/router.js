Vine.Router.map(function() {
  this.resource('videos', { path: '/' }, function() {
    this.route('index');
    this.route('new');
    this.resource('video', { path: 'videos/:video_id' });
  });
});
