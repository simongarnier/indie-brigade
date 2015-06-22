# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $('div.ib-clickable-skill').click ->
    offsets = $(this).children(".ib-skills-offset")
    if !offsets.hasClass("col-xs-4") #initial position
      offsets.first().toggleClass("col-xs-0 col-xs-4")
    else if !offsets.hasClass("col-xs-0") #great position
      offsets.toggleClass("col-xs-0 col-xs-4")
    else
      offsets.last().toggleClass("col-xs-0 col-xs-4")
