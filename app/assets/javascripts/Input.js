(function( $ ){
  $.fn.Input = function( options ) {
   
   this.each(function(){
    var input = $(this).find("input[type='text']");
    var label = $(this).find("label");
    input.focus(function(){
      label.animate({'font-size' : '0.75rem', 'top' : '-15px'}, 500);
    })
    input.on('blur',function(){
      if($(this).val() == ""){
        label.animate({'font-size' : '1rem', 'top' : '0px'});
      }
    })
   })
  };
})( jQuery );