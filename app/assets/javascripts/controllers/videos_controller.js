Vine.VideosIndexController = Ember.ArrayController.extend(Ember.SortableMixin, {
	sortProperties: ['createdAt'],
	sortAscending: false
});

Vine.VideosTagController = Ember.ArrayController.extend(Ember.SortableMixin, {
	sortProperties: ['createdAt'],
	sortAscending: false
});