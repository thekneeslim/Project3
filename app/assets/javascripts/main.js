// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log("HELLO WORLD");

$(document).on('turbolinks:load', function() {

// BROWSING PAGE
  $('#selectMeetGreet').submit(function(e) {
    e.preventDefault();

    var greetID = $('#selectedMeetGreet').val()
    console.log("Greet ID:", greetID)
    // APPEND MEET & GREET DETAILS
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
      $("#infoOnClasses").empty()
      $("#sessionDetails").append(
        "<div class='card'>" +
          "<div class='card-block'>" +
            "<h4 class='card-title'>" + data.name + "</h4>" +
            "<p><b>Date:</b> </br>" + data.date + "</p>" +
            "<p><b>Time:</b> </br> " + data.start + "</p> </br>" +
            "<p><b>Venue:</b> </br>" + data.location + "</p>" +
            "<p><b>Description:</b> </br>" + data.description + "</p>" +
          "</div>" +
        "</div>"
      )
    })
    // APPEND STUDENT LIST
    $.ajax({
      url: '/students/search',
      method: 'GET',
      data: {id: greetID}
    }).done(function (data) {
      console.log("Returned Data:", data)
      $("#studentDetails").empty()
      $("#requestSelect").empty()

      for (var i = 0; i < data.length; i++ ) {
        $("#studentDetails").append(
          "<div class='card cardShadow media' id='" + data[i].id + "'>" +
            "<a class='courseLinks' href='/profile/=" + data[i].link + "'>" +
              "<div class='card-block'>" +
                "<div class='media-body'>" +
                  "<h4 class='card-title'>" + data[i].first_name + " " + data[i].last_name + "</h4>" +
                  "<h6 class='card-subtitle text-muted astheticLine'>" + data[i].one_liner + "</h6></br>" +
                  "<p><img src='../../images/education.png'/> " + data[i].qualification + " in " + data[i].degree + " at " + data[i].school + "</p>" +
                  "<div id='projectsTag" + data[i].id + "'>Projects:</br> </div>" +
                  "<div id='languageTag" + data[i].id + "'>Languages:</br> </div>" +
                "</div>" +
                "<div class='media-right'>" +
                  "<img class='media-object browseImage img-circle' src='" + data[i].profile_pic_url + "' />" +
                "</div>" +
              "</div>" +
            "</a>" +
          "</div>"
        )
        // INCLUDING PROJECTS
        if (data[i].projects.length > 0) {
          for (var k = 0; k < data[i].projects.length; k++) {
            $("#projectsTag"+ data[i].id + "").append(
              "<span class='tag blueColour tagSpacing'>"+ data[i].projects[k].name +"</span>"
            )
          }
        }
        // INCLUDING LANGUAGES
        if (data[i].languages.length > 0) {
          for (var k = 0; k < data[i].languages.length; k++) {
            $("#languageTag"+ data[i].id + "").append(
              "<span class='tag pinkColour tagSpacing'>"+ data[i].languages[k].name +"</span>"
            )
          }
        }
      }
    })
  })

})
