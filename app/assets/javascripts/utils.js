
//LISTENER
$("body")
	.on("click","[data-action='tabSlide']", function(event){ tabSlide($(this)); })
	.on("click","h1", function(event){console.log(1)})


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