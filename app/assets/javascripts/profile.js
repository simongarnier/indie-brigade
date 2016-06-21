$(document).ready(function(){
  $(".lang-select").chosen()
  $(".softwares-select").chosen()
  $(".primary-skills-select").chosen()
  $(".major-skills-select").chosen({max_selected_options: 3})
  $(".minor-skills-select").chosen({max_selected_options: 5})

  $(".favorite-link").on("click", function(e){
    var star = $(e.target);
    if(star.hasClass("fa-star-o")){
      star.addClass("fa-star");
      star.removeClass("fa-star-o");
    } else {
      star.addClass("fa-star-o");
      star.removeClass("fa-star");
    }
  });

  var additionnalAvailabiltyHandler = function(){
    amount = $(".availabilities-container").children(".availability-elem").length
    $.ajax({
      url: "/account/dev/additional_availability?amount="+amount,
      dataType: "json",
      cache: false,
      success: function(data){
        $(".availabilities-container").append(data.payload)
        $(".btn-close").click(closeAvailabilityHandler);
      }
    })
  }

  var closeAvailabilityHandler = function(){
    el = $(this).parent();
    hiddentInput = $(this).parent().next("input");
    if(hiddentInput.length > 0){
      availability_id = hiddentInput.val();
      hiddentInput.remove()
      $.ajax({
        url: "/account/dev/remove_availability?availability_id="+availability_id,
        dataType: "json",
        cache: false,
      })
    }
    el.remove()
  }

  var toggleUnavailableHandler = function(){
    if(this.checked){
      $(".hidden-when-unavailable").hide()
    }else{
      $(".hidden-when-unavailable").show()
    }
  }

  if($(".unavailable-checkbox")[0].checked){
    $(".hidden-when-unavailable").hide()
  }

  $(".btn-plus").click(additionnalAvailabiltyHandler)
  $(".btn-close").click(closeAvailabilityHandler);

  $(".unavailable-checkbox").change(toggleUnavailableHandler)


  $('.banner-input input[type=file]').change(function(e){
    $(this).parent().find(".file-name").text(e.target.files[0].name);
  });
  $('.avatar-input input[type=file]').change(function(e){
    $(this).parent().find(".file-name").text(e.target.files[0].name);
  });
});
