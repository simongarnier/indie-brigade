# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('div.ib-clickable-skill').click ->
    $(this)
      .siblings(".ib-skills-offset")
      .toggleClass("col-xs-0 col-xs-4")
