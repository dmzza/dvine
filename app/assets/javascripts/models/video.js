Vine.Video = DS.Model.extend({
    url: DS.attr('string'),
    caption: DS.attr('string'),
    tags: function() {
    	tags = [];
    	caption = this.get('caption');

    	if(caption != null) {
    		parsed = caption.split("#");
	    	$.each(parsed, function(i, tag) {
	    		if(i>0) {
		    		tagName = tag.split(" ")[0];
		    		if(tagName.length > 0)
		    			tags.push("#" + tagName);
		    	}
	    	});
    	}
    	
		return tags;
    }.property('caption')
})

Vine.Video.FIXTURES = [
    {id: 1, caption: '#snow #blizzard #nemo', url: 'https://vines.s3.amazonaws.com/videos/987DA350-D7E9-4B56-87F5-42E90ECBB05F-2153-000001DB859FB5DB_1.0.4.mp4?versionId=50XqaVfrybJSwJd0j3t8JkajXe1IEiwx'},
    {id: 2, caption: '#2013 #snow #timelapse', url: 'https://vines.s3.amazonaws.com/videos/1864618E-FF3B-4F2A-9D54-9F8B7D890281-2153-000001D89063B08D_1.0.4.mp4?versionId=9WP.k8ILgTO.Wyq6lwRSyvi4eyIH1ru8'}
];