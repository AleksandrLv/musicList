window.app = window.app or {}

Musics = Backbone.Collection.extend(
  model: app.Music

  localStorage: new Backbone.LocalStorage 'musics-backbone'

  nextId: ->
    return if this.length then this.last().get('id') + 1 else 0

  comparator: 'id'
)
app.musics = new Musics()
