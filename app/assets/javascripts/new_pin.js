$(document).ready(function() {

  if ($('.menu-link').text() === "Sign out"){
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

  } else {
    $("#map-placeholder").on("click", "#new-gem-button", function(event){
      // alert('You have to sign in to make a new gem!')
    })
  }



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
          var $pintagForm = $(response);
           $('#new_pin').append($pintagForm);
        },
        fail: function(response) {
          console.log("Something went wrong. :\'");
        },
        error: function(response) {
          console.log("Something went wrong. :\'")
        }
      });
    });
  });
