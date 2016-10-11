// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log("HELLO WORLD");

$(document).on('turbolinks:load', function() {

  $('#selectMeetGreet').submit(function(e) {
  e.preventDefault();

  var greetID = $('#selectedMeetGreet').val()
  console.log("Greet ID:", greetID)

  getSessionInfo(greetID)

  function getSessionInfo(apple) {
    $.ajax({
      url: '/events/'+ apple,
      type: 'POST',
      data: {id: apple}
    }).done(function (data) {
      console.log("Returned Data:", data)
    })
  }
})

  // $('#countrySearch').submit(function(e) {
  //   e.preventDefault();
  //
  //   var countryID = $('#countrySelected').val()
  //   console.log(countryID)
  //
  //   getCountrySelectedInfo(countryID)
  //
  //   function getCountrySelectedInfo(apple) {
  //     $.ajax({
  //       url: '/login/home/idinfo',
  //       type: 'POST',
  //       data: {id: apple}
  //     }).done(function (data) {
  //       coordinates = [data.latitude, data.longitude];
  //       mymap.setView(coordinates, 7);
  //       drawMap(mapType)
  //     })
  //   }
  // })
})
