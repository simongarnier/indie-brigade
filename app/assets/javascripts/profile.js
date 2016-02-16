$(document).ready(function(){
  var baseAmount = $(".availabilities-container").children(".availability-elem").length
  var dev_id = $("input#dev_id").val()

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

  var additionnalAvailabilitiesHandler = function(){
    amount = $(".availabilities-container").children(".availability-elem").length - baseAmount + 1
    console.log(amount)
    $.ajax({
      url: "/devs/"+dev_id+"/availabilities_with_additionnals?amount="+amount,
      dataType: "json",
      cache: false,
      success: function(data){
        $(".availabilities-container").html(data.payload)
        $(".btn-plus").click(additionnalAvailabilitiesHandler)
        $(".btn-close").click(closeAvailabilityHandler);
      }
    })
  }

  var closeAvailabilityHandler = function(){
    el = $(this).parent();
    hiddentInput = $(this).parent().next("input");
    if(hiddentInput.length > 0){
      console.log(hiddentInput)
      $.ajax({
        url: "/devs/"+dev_id+"/remove_availability?availability_id="+hiddentInput.val(),
        dataType: "json",
        cache: false,
        success: function(data){
          hiddentInput.remove()
          baseAmount = baseAmount - 1
        }
      })
    }
    el.remove()
  }

  $(".btn-plus").click(additionnalAvailabilitiesHandler)

  $(".btn-close").click(closeAvailabilityHandler);
});