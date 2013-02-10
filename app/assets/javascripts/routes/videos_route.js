Vine.VideosIndexRoute = Ember.Route.extend({
	model: function() {
		return Vine.Video.find();
	}
});