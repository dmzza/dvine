Vine.Video = DS.Model.extend({
    url: DS.attr('string'),
    tags: DS.hasMany('Vine.Tag', { key: 'tag_ids' })
})

Vine.Video.FIXTURES = [
    {id: 1, url: 'https://vines.s3.amazonaws.com/videos/987DA350-D7E9-4B56-87F5-42E90ECBB05F-2153-000001DB859FB5DB_1.0.4.mp4?versionId=50XqaVfrybJSwJd0j3t8JkajXe1IEiwx', tag_ids: [1, 2, 4]},
    {id: 2, url: 'http://localhost:3000/local-vines/color.mp4', tag_ids: [2, 3, 4]}
];