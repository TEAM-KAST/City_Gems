$(document).ready(function(){
  $("#menu-icon").click(function(){
    event.preventDefault();
    $("#menu-div").slideToggle();
  });
  $("#filter-li-menu").click(function(){
    $("#explore").slideToggle();
  });


});
