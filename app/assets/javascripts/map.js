$(document).ready(function() {
  $('#map-placeholder').on('click', '#new-gem-button', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = ($target.attr('href'))
    console.log(url)
    console.log($target)
    $.ajax({
      url: url,
      method: 'GET',
      success: function(response) {
        $($target).html(response)
      }
    })


  });
});
