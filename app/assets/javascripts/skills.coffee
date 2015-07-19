# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('input.ib-search').focus (event) ->
    $('nav.ib-nav-will-get-hidden').animate {opacity:0}, 100
  $('input.ib-search').blur (event) ->
    $('nav.ib-nav-will-get-hidden').animate {opacity:1}, 100
