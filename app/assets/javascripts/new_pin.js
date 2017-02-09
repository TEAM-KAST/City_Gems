$(document).ready(function() {
  $("#map-placeholder").on("click", "#new-gem-button", function(event){
    event.preventDefault();
    var url = $(event.target).attr('href');
      $.ajax({
        url: url,
        type: 'get'
      }).done(function(data){
        var $popupForm = $(data).children().children('section');
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


    $('body').on("submit", "#new_pin", function(event) {
      event.preventDefault();
      var $form = $(this);
      var data = $form.serialize();
      $.ajax({
        type: 'post',
        url: '/pins',
        data: data,
        dataType: 'html',
        success: function(response) {
          console.log("RESPONSE", response)
          var $pintagForm = $(response);
           $('#new_pin').append($pintagForm);
        },
        fail: function(response) {
          console.log("fail", response);
        },
        error: function(response, jqXHR) {
          console.log("ERROR", response);
          console.log("xhr", jqXHR);
        }
      });
    });
  });
