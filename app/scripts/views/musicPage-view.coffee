window.app = window.app or {}

app.MusicPageView = Backbone.View.extend(
  className: 'music'

  template: _.template $('#musicPageTemplate').html()

  events:
    'click .save': 'edit'
    'click .remove': 'removeMusic'

  initialize: ->
    this.musicComposition =
      'performer': $('#performer')
      'title': $('#title')
      'genre': $('#genre')
      'song': $('#song')

    this.listenTo this.model, 'musicPage:show', this.render
    return

  render: ->
    $('header .btn').hide()

    this.$el.html this.template this.model.attributes
    return this

  edit: ->
    obj = {}
    _.each this.musicComposition, ($input, field) ->
      obj[field] = $input.val()
      return
    this.model.save obj
    return

  removeMusic: ->
    this.model.destroy()
)
