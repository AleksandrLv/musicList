$ ->
  $(".details").on 'click', ->
    $(this).parent().next('.collapse').collapse('toggle')

window.app = window.app or {}

$ ->
  new app.AppView()
  return
