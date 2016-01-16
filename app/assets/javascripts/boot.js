$(function(){
	$('body')
		.on('click','.nav-burger, .nav-close', function(){ toggleMenu($(this)); })
		.on("click","[data-action='tabSlide']", function(event){ tabSlide($(this)); })

	$(".input-label").Input();

	function tabSlide(obj){
		var target = obj;
		if(target.hasClass("active")){
			$("#"+target.attr("data-section-id")).slideUp();
			target.removeClass("active");
		}else{
			$("#"+target.attr("data-section-id")).slideDown();
			target.addClass("active");
		}
	}

	function toggleMenu(obj){

		if(obj.hasClass("nav-burger")){
			console.log(2);
			$(".nav-menu")
			.css("display", "block")
			.animate({
					right: "0px"
				}, 
				300, 
				function() {
				// Animation complete.
			});
		}else{
			$(".nav-menu")
			.animate({
					right: "-345px"
				}, 
				300, 
				function() {
					$(".nav-menu")
					.css("display", "none")
				}
			);
		}
	}
})