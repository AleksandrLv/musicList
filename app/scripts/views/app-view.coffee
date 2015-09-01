window.app = window.app or {}

app.AppView = Backbone.View.extend(
  id: 'music-app'

  initialize: ->
    this.musicComposition =
      'performer': $('#performer')
      'title': $('#title')
      'genre': $('#genre')
      'song': $('#song')
    @log()
#      console.log 12345

    this.$filter = this.$('.filter')
    this.collapseAll = this.$('.collapse-all')[0]
    this.$musicList = this.$('#music-list')

    self = this
    $('#create-music').on 'click', ->
      self.createMusic()
      return
    return

    this.listenTo(app.Musics, 'all', this.addOne);

  events:
    'click #create-music': 'createMusic'
    'change .filter': 'log'
    'click': 'log'

  log: ->
    console.log 222

  createMusic: ->
    console.log 2
    obj = {}
    _.each this.musicComposition, ($input, field) ->
      obj[field] = $input.val()
      return
    console.log obj
    app.Musics.create(obj)
    return

  addOne: (music) ->
    console.log 246548
    view = new app.MusicView  model: music
    this.$musicList.append(view.render().el);
    return
)
