window.app = window.app or {}

app.AppView = Backbone.View.extend(

  el: '#music-app'

  initialize: ->
    this.musicComposition =
      'performer': $('#performer')
      'title': $('#title')
      'genre': $('#genre')
      'song': $('#song')

    this.filter = this.$('.filter')[0]
    this.collapseAll = this.$('.collapse-all')[0]
    this.$musicList = this.$('#music-list')
    this.form = this.$('.formAddMusic')[0]

    this.listenTo app.musics, 'add', this.addOne
    this.listenTo app.musics, 'reset', this.addAll
    this.listenTo app.musics, 'filter', this.filterMusics

    app.musics.fetch({reset: true});
    return

  events:
    'click #create-music': 'createMusic'
    'click .collapse-all': 'collapseAll'
    'keypress .filter': 'filterQuery'

  createMusic: ->
    obj = {}
    _.each this.musicComposition, ($input, field) ->
      obj[field] = $input.val()
      return
    obj.order = app.musics.nextOrder()
    app.musics.create(obj)
    this.form.reset()
    return

  addOne: (music) ->
    view = new app.MusicView  model: music
    this.$musicList.append(view.render().el);
    return

  addAll: ->
      this.$musicList.html ''
      app.musics.each this.addOne, this
      return

  collapseAll: ->
    if this.collapseAll.checked
      $('.collapse').collapse('show')
    else
      $('.collapse').collapse('hide')
    return

  filterQuery: (e) ->
    if e.which is 13
      query = this.filter.value.trim()
      if query is ""
        this.showAll()
        app.workspace.navigate ''
        return
      app.workspace.navigate '#/?search=' + query, trigger: true #Почему trigger не влияет???
    return

  filterMusics: (query) ->
    app.musics.each (music) ->
      fl = false
      for field of music.attributes
        if music.attributes[field] is query
          fl = true
          break
      if fl
        music.trigger 'visible', on
      else
        music.trigger 'visible', off
    return

  showAll: ->
    app.musics.each (music) ->
      music.trigger 'visible', on
)
