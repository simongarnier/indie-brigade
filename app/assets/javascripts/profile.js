$(document).ready(function(){
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
});