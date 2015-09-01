window.app = window.app or {}

app.MusicView = Backbone.View.extend(
  tagName: 'li'

#    template: _.template $('#item-template').html()

  events:
    'change input': 'edit'
    'click .delete': 'cleanField'

  initialize: ->
    template: _.template $('#item-template').html()

  render: ->
    console.log 'rendering music ' + this.model.toJSON()
    this.$el.html this.template this.model.toJSON()
    return this
)
