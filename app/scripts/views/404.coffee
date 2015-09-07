window.app = window.app or {}

app.Error = Backbone.View.extend(
  className: 'error404'

  template: _.template '<h2>Page not found 404</h2>'

  initialize: ->
    console.log 1234
    this.render()
    this.listenTo this, 'error404', this.show
    return

  render: ->
    $('header .btn').hide()
    this.$el.html this.template
    return this

  show: ->
    $('#content').html this.el
)
