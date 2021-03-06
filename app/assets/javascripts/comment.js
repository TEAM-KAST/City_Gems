$(document).ready(function() {

/////page links listener/////
  $('#gem-show-container').on('click', '#comments-container', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = ($target.attr('href'));
    $.ajax ({
      url: url,
      method: "GET"
    }).done(function(data){
      var $form = $(data).children('form');
      $('body').append($form)
    })
  })

/////deletes comments/////
  $('#gem-show-container').on('click', '#delete', function(event){
    event.preventDefault()
    var $target = $(event.target)
    var url = $target.attr('href')
    $.ajax({
        url: url,
        method: 'DELETE',
        success: function(){
          $target.closest('#comment-start').remove()
        }
    })
  })

 /////edit submission form listener/////
  $('body').on('submit', '.edit_comment', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var $url = $('body').children('form')["0"].getAttribute('action')
    var data = $target.serialize()
    var $form = $(this).closest('form');
    $.ajax({
      url: $url,
      method: "PUT",
      data: data,
      dataType: 'JSON'
    }).done(function(data){
      var $commentId = $('body').children('form')["0"].getAttribute('action').substring(17)
      var spanId = "#comment-"+ $commentId
      $(spanId).html(data.content)
      $target.remove();
    })
  })

/////new comment submission form listener/////
  $('body').on('submit', '#new_comment', function(event){
    event.preventDefault();
    var $form = $(this);
    var data = $form.serialize();
    var $target = $(event.target)
    var $url = $('body').children('form')["0"].getAttribute('action');
    $.ajax ({
      url: $url,
      method: "POST",
      data: data,
      dataType: 'html'
    }).done(function(response){
      var $commentToPost = $(response).children('#gem-show-page').children('#gem-show-container').children('#comments-container').children('#comment-start:first')
      $('#comments-container').prepend($commentToPost)
      $target.remove();

    })
  })

/////Listener for cancel button/////
  $('body').on('click', '.mapboxgl-popup-close-button', function(event){
    event.preventDefault();
    this.parentElement.remove();
  })

});
