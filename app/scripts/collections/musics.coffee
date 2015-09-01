window.app = window.app or {}

Musics = Backbone.Collection.extend(
  model: app.Music

  localStorage: new Backbone.LocalStorage 'musics-backbone'
)
app.Musics = new Musics()
