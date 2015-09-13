(function() {
  var delay, hideUIExceptChildren,
    slice = [].slice;

  delay = function() {
    var args, fn, time;
    time = arguments[0], fn = arguments[1], args = 3 <= arguments.length ? slice.call(arguments, 2) : [];
    return setTimeout.apply(null, [fn, time].concat(slice.call(args)));
  };

  hideUIExceptChildren = function() {
    var children, selector;
    selector = arguments[0], children = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return delay(250, function() {
      var child, i, len, results;
      selector.children().hide();
      results = [];
      for (i = 0, len = children.length; i < len; i++) {
        child = children[i];
        results.push(child.show());
      }
      return results;
    });
  };

  $(function() {
    var add, adder, button, cancel, remove, role_select, selected_role, selected_role_target, selected_skill, selected_skill_target, selected_type, selected_type_target, skill_select, subscribeToAjaxEvents, type_select, ui_stack;
    adder = '.ib-skill-adder';
    remove = '.ib-skill-remove';
    add = '.ib-skill-adder__add';
    role_select = '.ib-skill-adder__role_select';
    type_select = '.ib-skill-adder__type_select';
    skill_select = '.ib-skill-adder__skill_select';
    cancel = '.ib-skill-adder__cancel';
    button = '.ib-button';
    ui_stack = [];
    selected_role = null;
    selected_skill = null;
    selected_type = null;
    selected_role_target = null;
    selected_skill_target = null;
    selected_type_target = null;
    subscribeToAjaxEvents = function() {
      $(remove).on('ajax:success', function(event, data, status) {
        $(this).parents('.ib-removable-cell').remove();
        return $(".ib-button.skill_" + $(this).attr("value")).prop('disabled', false);
      });
      return $(remove).on('ajax:error', function(event, data, status) {
        return console.log("error");
      });
    };
    subscribeToAjaxEvents();
    $(add).click(function(event) {
      ui_stack.push($(this));
      return hideUIExceptChildren($(adder), $(role_select), $(cancel));
    });
    $(role_select).children(button).click(function(event) {
      selected_role = $(this).attr("value");
      selected_role_target = $(this);
      ui_stack.push($(role_select));
      return hideUIExceptChildren($(adder), $(adder).children('.ib-skill-adder__skill_select.role_' + selected_role), $(cancel));
    });
    $(skill_select).children('.ib-button').click(function(event) {
      selected_skill = $(this).attr("value");
      selected_skill_target = $(this);
      ui_stack.push($(this).parent());
      return hideUIExceptChildren($(adder), $(type_select), $(cancel));
    });
    $(type_select).children('.ib-button').click(function(event) {
      selected_type = $(this).attr("value");
      selected_type_target = $(this);
      $.ajax({
        url: window.location.pathname,
        type: "POST",
        data: {
          skill_id: selected_skill,
          type: selected_type
        },
        success: function(data) {
          $(adder).parent().after(data['partial']);
          if (selected_type === "main") {
            selected_type_target.prop('disabled', true);
          }
          selected_skill_target.prop('disabled', true);
          subscribeToAjaxEvents();
          return componentHandler.upgradeAllRegistered();
        },
        error: function() {
          return console.log("error");
        }
      });
      return hideUIExceptChildren($(adder), $(add));
    });
    return $(cancel).children('.ib-button').click(function(event) {
      var i, parent_ui, rest;
      rest = 2 <= ui_stack.length ? slice.call(ui_stack, 0, i = ui_stack.length - 1) : (i = 0, []), parent_ui = ui_stack[i++];
      ui_stack = rest;
      if (parent_ui === add) {
        return hideUIExceptChildren($(adder), $(parent_ui));
      } else {
        return hideUIExceptChildren($(adder), $(parent_ui), $(cancel));
      }
    });
  });

}).call(this);
