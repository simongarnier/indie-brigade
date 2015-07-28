# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
delay = (time, fn, args...) ->
  setTimeout fn, time, args...

hideUIExceptChildren = (selector, children...) ->
  delay 250, ->
    selector.children().hide()
    for child in children
      child.show()




$ ->
  adder = '.ib-skill-adder'
  remove = '.ib-skill-remove'
  add = '.ib-skill-adder__add'
  role_select = '.ib-skill-adder__role_select'
  type_select = '.ib-skill-adder__type_select'
  skill_select = '.ib-skill-adder__skill_select'
  cancel = '.ib-skill-adder__cancel'
  button = '.ib-button'

  ui_stack = []

  selected_role = null
  selected_skill = null

  subscribeToAjaxEvents = () ->
    $(remove).on 'ajax:success', (event, data, status) ->
      $(this).parents('.ib-removable-cell').remove()

    $(remove).on 'ajax:error', (event, data, status) ->
      console.log("error")

  subscribeToAjaxEvents()

  #adding a skill
  $(add).click (event) ->
    ui_stack.push $(this).target
    hideUIExceptChildren $(adder), $(role_select), $(cancel)

  $(role_select).children(button).click (event) ->
    selected_role = $(this).attr "value"
    ui_stack.push $(role_select)
    hideUIExceptChildren $(adder), $(adder).children('.ib-skill-adder__skill_select.role_' + selected_role), $(cancel)

  $(skill_select).children('.ib-button').click (event) ->
    selected_skill = $(this).attr "value"
    ui_stack.push $(this).parent()
    hideUIExceptChildren $(adder), $(type_select), $(cancel)

  $(type_select).children('.ib-button').click (event) ->
    selected_type = $(this).attr "value"
    $.ajax
      url: window.location.pathname
      type: "POST"
      data: {
        skill_id: selected_skill
        type: selected_type
      }
      success: (data)->
        $(adder).parent().after(data['partial'])
        subscribeToAjaxEvents()
        componentHandler.upgradeAllRegistered()
      error: ->
        console.log("error")

    hideUIExceptChildren $(adder), $(add)

  $(cancel).children('.ib-button').click (event) ->
    [rest..., parent_ui] = ui_stack
    ui_stack = rest
    if parent_ui == add
      hideUIExceptChildren $(adder), $(parent_ui)
    else
      hideUIExceptChildren $(adder), $(parent_ui), $(cancel)
