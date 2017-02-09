$(document).ready(function() {
  $('#gem-show-container').on('click',  function(event){
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

  $('body').on('submit', '.edit_comment', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = $('body').children('form')["0"].getAttribute('action')
    var data = $target.serialize()
    console.log('URL', url)
    var $form = $(this).closest('form');
    $.ajax({
      url: url,
      method: "PUT",
      data: data,
      dataType: 'JSON'
    }).done(function(data){
      debugger;
      var $old_content = $('#comment-field').children().children('span')
      $($old_content).html(data.content)
      $target.remove();
      console.log($target)
      console.log(data.content)

    })
  })



});
