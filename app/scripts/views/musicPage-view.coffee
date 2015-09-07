window.app = window.app or {}

app.MusicPageView = Backbone.View.extend(
  className: 'music'

  template: _.template $('#musicPageTemplate').html()

  events:
    'click .save': 'edit'
    'click .remove': 'removeMusic'

  initialize: ->
    this.render()
    this.listenTo this, 'musicPage:show', this.show
    return

  render: ->
    this.$el.html this.template this.model.attributes
    this.musicComposition =
      'performer': this.$('#edit-performer')
      'title': this.$('#edit-title')
      'genre': this.$('#edit-genre')
      'song': this.$('#edit-song')
    return this

  show: ->
    $('header .btn').hide()
    $('#content').html this.el
    return

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
