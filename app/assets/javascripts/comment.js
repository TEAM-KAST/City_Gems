$(document).ready(function() {
  $('.model-link-container').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = ($target.attr('href'));
    $.ajax ({
      url: url,
      method: "GET"
    }).done(function(data){
      var $form = $(data).closest('form');
      $('body').append($form)
    })
  })
});

$(document).ready(function() {
  $('#gem-show-container').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = ($target.attr('href'));
    $.ajax ({
      url: url,
      method: "GET"
    }).done(function(data){
      var $form = $(data).closest('form');
      $('body').append($form)
    })
  })
});
