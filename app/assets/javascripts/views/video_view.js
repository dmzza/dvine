Vine.VideoBoxView = Ember.View.extend({
	mouseEnter: function(e) {
		videos = document.getElementsByTagName("video");
		$.each(videos, function(i, v) {
			v.pause();
		});
		this.$("video")[0].play();
	},
	touchEnd: function(e) {
		videos = document.getElementsByTagName("video");
		$.each(videos, function(i, v) {
			v.pause();
		});
		this.$("video")[0].play();
	}
});