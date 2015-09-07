window.app = window.app or {}

app.AppView = Backbone.View.extend(

  id: "music-app"

  template: _.template $('#mainTemplate').html()

  initialize: ->
    this.listenTo app.musics, 'add', this.addOne
    this.listenTo app.musics, 'reset', this.addAll
    this.listenTo app.workspace, 'route:mainPage', this.show
    this.listenTo app.workspace, 'route:search', this.filterMusics

    this.render()
    app.musics.fetch reset: true
    return

  events:
    'click #create-music': 'createMusic'
    'click .collapse-all': 'collapseAll'
    'keypress .filter': 'filterQuery'

  render: ->
    this.$el.html this.template
    this.musicComposition =
      'performer': this.$('#performer')
      'title': this.$('#title')
      'genre': this.$('#genre')
      'song': this.$('#song')

    this.filter = this.$('.filter')[0]
    this.collapseAll = this.$('.collapse-all')[0]
    this.$musicList = this.$('#music-list')
    this.form = this.$('.formAddMusic')[0]
    return

  show: ->
    $('header .btn').show()
    $('#content').html this.el
    return

  createMusic: ->
    obj = {}
    _.each this.musicComposition, ($input, field) ->
      obj[field] = $input.val()
      return
    obj.id = app.musics.nextId()
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
      $('.collapse').collapse 'show'
    else
      $('.collapse').collapse 'hide'
    return

  filterQuery: (e) ->
    if e.which is 13
      query = this.filter.value.trim()
      if query is ""
        this.showAll()
        app.workspace.navigate ''
        return
      app.workspace.navigate '#/?search=' + query, trigger: false #Почему trigger не влияет???
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
