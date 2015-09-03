window.app = window.app or {}

app.MusicView = Backbone.View.extend(
  tagName: 'li'

  template: _.template $('#itemTemplate').html()

  events:
    'change input': 'edit'
    'click .delete': 'cleanField'
    'click .remove': 'removeMusic'

  initialize: ->
    this.listenTo this.model, 'change', this.render
    this.listenTo this.model, 'destroy', this.remove
    this.listenTo this.model, 'visible', this.toggleVisible
    return

  log: ->
    console.log this.model.get 'performer'

  render: ->
    this.$el.html this.template this.model.attributes
    this.bind()
    return this

  bind: ->
    self = this
    this.$(".details").on 'click', ->
      self.$('.collapse').collapse('toggle')

  edit: (e) ->
    obj = {}
    field = e.target.dataset.editfield
    value = e.target.value.trim()
    obj[field] = value
    this.model.save obj

  toggleVisible: (fl) ->
    if fl
      this.$el.removeClass 'hidden'
    else
      this.$el.addClass 'hidden'

  cleanField: (e) ->
    obj = {}
    field = e.target.dataset.deletefield
    obj[field] = ""
    this.model.save obj

  removeMusic: ->
    this.model.destroy()
)
