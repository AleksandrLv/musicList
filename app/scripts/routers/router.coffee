window.app = window.app or {}

Workspace = Backbone.Router.extend(
  routes:
    'items/:item': 'musicItem'
    '?search=:query': 'search'
    '': 'mainPage'

  musicItem: (item) ->
    app.app ?= new app.AppView()
    app.musicPages ?= []
    model = app.musics.get(item)
    if model
      app.musicPages[item] ?= new app.MusicPageView model: model
      app.musicPages[item].trigger 'musicPage:show'
    else
      console.log "error 404"
    return

  mainPage: ->
    app.app ?= new app.AppView()

  search: (query) ->
    console.log "router search"
    app.app ?= new app.AppView()
    app.app.show()
)

app.workspace = new Workspace()
Backbone.history.start()
#Backbone.history.start pushState: true
