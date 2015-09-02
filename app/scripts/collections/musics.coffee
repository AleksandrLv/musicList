window.app = window.app or {}

Musics = Backbone.Collection.extend(
  model: app.Music

  localStorage: new Backbone.LocalStorage 'musics-backbone'

  nextOrder: ->
    return if this.length then this.last().get('order') + 1 else 1

  comparator: 'order'
)
app.musics = new Musics()
