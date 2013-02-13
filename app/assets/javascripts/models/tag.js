Vine.Tag = DS.Model.extend({
    name: DS.attr('string'),
    videos: DS.hasMany('Vine.Video', { key: 'video_ids' })
})

Vine.Tag.FIXTURES = [
    {id: 1, name: 'blizzard', videos: [1]},
    {id: 2, name: 'snow', videos: [1, 2]},
    {id: 3, name: 'nemo', videos: [2]},
    {id: 4, name: 'color', videos: [1, 2]},
    {id: 5, name: '2013', videos: []}
];