window.app = window.app or {}

app.Error = Backbone.View.extend(
  className: 'error404 page'

  template: _.template '<h2>Page not found 404</h2>'

  initialize: ->
    console.log 1234
    this.render()
    this.listenTo this, 'error404', this.show
    return

  render: ->
    this.$el.html this.template
    $('#content').append this.el
    return this

  show: ->
    $('header .btn').hide()
    $('.page').hide()
    this.$el.show()

)
