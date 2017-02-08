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
        console.log("DONE", $('.popup-new-pin-form'))
        var $section = $form.closest('section.popup-new-pin-form');
        $.ajax({
          url: 'pintags/new',
          type: 'get'
        }).done(function(data){
          console.log("DONE", data);
          // debugger;
          var $pintagForm = $(data).children('.pintag-form-container');
          $('.new-pin').append($pintagForm);
        // $section.remove();
      }).error(function(response) {
        console.log("ERROR", response);
      })
    });

  });
  });
