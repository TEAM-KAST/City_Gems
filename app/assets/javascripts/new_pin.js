$(document).ready(function() {
  $("#map-placeholder").on("click", "#new-gem-button", function(event){
    event.preventDefault();
    var url = $(event.target).attr('href');
      $.ajax({
        url: url,
        type: 'get'
      }).done(function(data){
        var $popupForm = $(data).children('section');
        $('body').append($popupForm);
        // Global Variable from _map.html
        if(addGemPopup){
          addGemPopup.remove();
          addGemPopup = null;
        }
      });
    });

    $('body').on('click', '#new_pin_cancel', function(event) {
      event.preventDefault();
      var $form = $(this).closest('section.popup-new-pin-form');
      $($form).remove();
    });


// We don't really need this
    $('body').on("submit", "#new_pin", function(event) {
      event.preventDefault();
      var $form = $(this);
      var data = $form.serialize();
      console.log(data)
      $.ajax({
        type: 'post',
        url: '/pins',
        data: data
      }).done(function(response) {
        console.log("RESPONSE", response)
        var $pintagForm = $(response).children('.pintag-form-container');
        debugger;
        // var $section = $form.closest('section.popup-new-pin-form');
        // $('.new-pin').append($pintagForm);
      }).error(function(response) {
        console.log("ERROR", response);
      })
    });


  });



    // debugger;

    //
  // $section.remove();
