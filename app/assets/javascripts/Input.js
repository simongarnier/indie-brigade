(function( $ ){
  $.fn.Input = function( options ) {
   
   this.each(function(){
    var input = $(this).find("input");
    var label = $(this).find("label");

    input.focus(function(){
      label.animate({'font-size' : '0.75rem', 'top' : '-15px'}, 150);
    })
    input.on('blur',function(){
      if($(this).val() == ""){
        label.animate({'font-size' : '0.9rem', 'top' : '0px'});
      }
    })

    input.on("change", function(){ $(this).trigger("focus") })

    if(input.val() != 'undefined' && input.val() != ""){
      input.trigger("focus");
    }
   })
  };

  $.fn.Tabs = function(options){
    this.each(function(i,value){
      var tabGlobal = $(this);
      
    });
  }
})( jQuery );