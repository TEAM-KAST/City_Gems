$(document).ready(function() {
  $("PLACE ON MAP").on("click", function(event){
    event.preventDefault()

      $.ajax({
        url: '/prototypes/' + id,
        type: 'get',
      }).done(function(data){
        $this.append(data)
      })

    })
  })
