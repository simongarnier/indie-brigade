# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  adder = $('.ib-skill-adder')
  add = adder.children('.ib-skill-adder__add')
  role_select = adder.children('.ib-skill-adder__role_select')
  type_select = adder.children('.ib-skill-adder__type_select')
  skill_select = adder.children('.ib-skill-adder__skill_select')
  cancel = adder.children('.ib-skill-adder__cancel')
  ui_stack = []

  selected_role = null
  selected_skills = null

  add.click (event) ->
    ui_stack.push add
    HideUIExceptChildren adder, role_select, cancel

  role_select.children('.ib-button').click (event) ->
    selected_role = $(this).attr "value"
    ui_stack.push role_select
    HideUIExceptChildren adder, adder.children('.ib-skill-adder__skill_select.role_' + selected_role), cancel

  skill_select.children('.ib-button').click (event) ->
    selected_skills = $(this).attr "value"
    ui_stack.push $(this).parent()
    HideUIExceptChildren adder, type_select, cancel

  type_select.children('.ib-button').click (event) ->
    console.log $(this).attr "value"
    console.log selected_role
    console.log selected_skills
    HideUIExceptChildren adder, add

  cancel.children('.ib-button').click (event) ->
    [rest..., parent_ui] = ui_stack
    console.log parent_ui
    ui_stack = rest
    if parent_ui == add
      HideUIExceptChildren adder, parent_ui
    else
      HideUIExceptChildren adder, parent_ui, cancel



HideUIExceptChildren = (selector, children...) ->
  setTimeout ->
    selector.children().hide()
    for child in children
      child.show()
  , 250
