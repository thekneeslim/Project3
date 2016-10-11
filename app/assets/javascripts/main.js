// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log("HELLO WORLD");

$(document).on('turbolinks:load', function() {

  $('#selectMeetGreet').submit(function(e) {
    e.preventDefault();

    var greetID = $('#selectedMeetGreet').val()
    console.log("Greet ID:", greetID)

    $.ajax({
      url: '/events/search',
      method: 'GET',
      data: {id: greetID}
      // data: {id: this.value},
      // data: {data}
      // dataType: 'json'
    }).done(function (data) {
      console.log("Returned Data:", data)
      $("#sessionDetails").empty()
      $("#sessionDetails").append(
        "<h4>" + data.name + "</h4> <br>" +
        "<p><b>Date:</b> </br>" + data.date + "</p>" +
        "<p><b>Time:</b> </br> " + data.start + "</p> </br>" +
        "<p><b>Venue:</b> </br>" + data.location + "</p>" +
        "<p><b>Description:</b> </br>" + data.description + "</p>"
      )

      $("#studentDetails").append("<p>" + data+ "</p>")
    })
  })
})
