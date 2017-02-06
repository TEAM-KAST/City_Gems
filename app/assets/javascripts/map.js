$(document).ready(function() {
  $('#map-placeholder').on('click', '#new-gem-button', function(event){
    event.preventDefault();
    var $target = $(event.target)
    var url = ($target.attr('href'))
    var $targetParent = ($target.parent())
    console.log(longytutu)
    console.log(latytat)
    $.ajax({
      url: url,
      method: 'GET',
      success: function(response) {
        $($targetParent).html(response)
          debugger
          $('#pin_form').children('pin_lat').value(latytat) //need to figure this out
          $('#pin_form').getElementById("lng").value = longytutu



      }
    })


  });
});
