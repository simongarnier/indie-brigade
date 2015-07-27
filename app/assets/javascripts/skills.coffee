# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
delay = (time, fn, args...) ->
  setTimeout fn, time, args...

HideUIExceptChildren = (selector, children...) ->
  delay 250, ->
    selector.children().hide()
    for child in children
      child.show()


$ ->
  adder = $('.ib-skill-adder')
  remove = $('.ib-skill-remove')
  add = adder.children('.ib-skill-adder__add')
  role_select = adder.children('.ib-skill-adder__role_select')
  type_select = adder.children('.ib-skill-adder__type_select')
  skill_select = adder.children('.ib-skill-adder__skill_select')
  cancel = adder.children('.ib-skill-adder__cancel')

  ui_stack = []

  selected_role = null
  selected_skill = null

  #adding a skill
  add.click (event) ->
    ui_stack.push add
    HideUIExceptChildren adder, role_select, cancel

  role_select.children('.ib-button').click (event) ->
    selected_role = $(this).attr "value"
    ui_stack.push role_select
    HideUIExceptChildren adder, adder.children('.ib-skill-adder__skill_select.role_' + selected_role), cancel

  skill_select.children('.ib-button').click (event) ->
    selected_skill = $(this).attr "value"
    ui_stack.push $(this).parent()
    HideUIExceptChildren adder, type_select, cancel

  type_select.children('.ib-button').click (event) ->
    selected_type = $(this).attr "value"
    $.ajax
      url: window.location.pathname
      type: "POST"
      data: {
        skill_id: selected_skill
        type: selected_type
      }
      success: (data)->
        console.log(data)
        adder.parent().after(data['partial'])
      error: ->
        console.log("error")

    HideUIExceptChildren adder, add

  cancel.children('.ib-button').click (event) ->
    [rest..., parent_ui] = ui_stack
    ui_stack = rest
    if parent_ui == add
      HideUIExceptChildren adder, parent_ui
    else
      HideUIExceptChildren adder, parent_ui, cancel

  remove.on 'ajax:success', (event, data, status) ->
    $(this).parents('.ib-removable-cell').remove()

  remove.on 'ajax:error', (event, data, status) ->
    console.log(data)
