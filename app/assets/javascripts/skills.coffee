# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('form div.ib-clickable-skill').click (event) ->
    x = event.pageX - $(this).offset().left;
    offsets = $(this).children(".ib-skills-offset")
    input = $(this).children("input")

    if x < $(this).width()/3          # free
      input.val("free")
      offsets.removeClass("col-xs-4")
      offsets.addClass("col-xs-0")
    else if x < ($(this).width()/3)*2 # minor
      input.val("minor")
      offsets.first().removeClass("col-xs-0")
      offsets.first().addClass("col-xs-4")
      offsets.last().removeClass("col-xs-4")
      offsets.last().addClass("col-xs-0")
    else                              # major
      input.val("major")
      offsets.removeClass("col-xs-0")
      offsets.addClass("col-xs-4")
