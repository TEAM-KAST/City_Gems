$(document).ready(function() {
  console.log("I'm LISTENING!!!!")
  $("#map-placeholder").on("click", "#new-gem-button", function(event){
      console.log("I LISTENED!!!!")
      event.preventDefault()
      var url = $(event.target).attr('href');
      console.log(url);
        $.ajax({
          url: url,
          type: 'get'
        }).done(function(data){
          console.log(data)
          var popupForm = $(data).children('section')
          $('body').append(popupForm)
          $('.mapboxgl-popup').remove();
        })
      })
    })
