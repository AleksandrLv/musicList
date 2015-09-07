window.app = window.app or {}

app.MusicPageView = Backbone.View.extend(
  className: 'error404'

  template: _.template '<h2>404</h2>h2'

  initialize: ->
    this.listenTo app.workspace, 'router:error404', this.show
    return

  render: ->
    $('header .btn').hide()
    this.$el.html this.template
    return this

  show: ->
    $('#music-app').html(this.el)
)
