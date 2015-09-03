Workspace = Backbone.Router.extend(
  routes:
    'items/:item': 'musicItem'
    '?search=:query': 'search'

  musicItem: (item) ->
#    app.musics.at(item-1).trigger 'musicPage:show'
    return

  search: (query) ->
    app.musics.trigger 'filter', query
    return
)

app.workspace = new Workspace()
Backbone.history.start()
#Backbone.history.start pushState: true
