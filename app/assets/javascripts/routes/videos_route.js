Vine.VideosIndexRoute = Ember.Route.extend({
	model: function() {
		return Vine.Video.find();
	}
});

Vine.VideosNewRoute = Ember.Route.extend({
	model: function() {
		return Vine.Video.createRecord();
	},
	exit: function() {
		this._super();
		this.get('currentModel.transaction').rollback();
	},
	events: {
		save: function(video) {
			video.one('didCreate', this, function() {
				this.transitionTo('videos.index');
			});
			video.get('transaction').commit();
		},
		cancel: function() {
			this.transitionTo('videos.index');
		}
	}
});

Vine.VideosTagRoute = Ember.Route.extend({
	model: function(params) {
		this.set('tag', params.name);
		videos = Vine.Video.find();

		return videos.filter(function(video, i, list) {
				caption = video.get('caption')
				if(caption != null && caption.indexOf('#' + params.name) != -1) {
					return true;
				} else {
					return false;
				}
				
			});
	},
	setupController: function(controller, model) {
		controller.set('content', model);
		controller.set('tag', this.get('tag'));
	}
});