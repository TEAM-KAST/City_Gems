$(document).ready(function() {
  $('#menu_icon').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = ($target.attr('href'));
    $.ajax ({
      url: url,
      method: "GET"
    }).done(function(data){
      console.log(data)
      // var $form = $((data).closest('#id'));
      $('body').append($form)
    })
  })
});
