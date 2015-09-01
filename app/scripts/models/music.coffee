window.app = window.app or {}

app.Music = Backbone.Model.extend(
  defaults:
    performer: ""
    title: ""
    genre: ""
    song: ""
)
