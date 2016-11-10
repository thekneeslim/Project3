$(document).on('turbolinks:load', function() {
  console.log("HELLO WORLD");

// BROWSING PAGE
  $('#selectMeetGreet').submit(function(e) {
    e.preventDefault();
    $("#chooseSessionSelector").css("color", "white")
    $("#date").css("text-shadow", "-1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black")
    $("#date").css("background-image", "url('/images/backdrop2.png')")

    var greetID = $('#selectedMeetGreet').val()
    // console.log("Greet ID:", greetID)
    // APPEND MEET & GREET DETAILS
    $.ajax({
      url: '/events/search',
      method: 'GET',
      data: {id: greetID}
    }).done(function (data) {
      // console.log("Returned Data:", data)
      var start = new Date(data.start)
      var hoursStart = start.getHours()
      var minStart = start.getMinutes()
      var end = new Date(data.end)
      var hoursEnd = end.getHours()
      var minEnd = end.getMinutes()

      $("#sessionDetails").empty()
      $("#infoOnClasses").empty()
      $("#sessionDetails").append(
        "<div class='card'>" +
          "<div class='card-block'>" +
            "<h4 class='card-title'>" + data.name + "</h4>" +
            "<h6 class='card-subtitle text-muted'>" + data.description + "</h6>" +
            "<hr>" +
            "<p><b>Date:</b> </br>" + moment(data.date).format("DD MMM YYYY") + "</p>" +
            "<p><b>Time:</b> </br>2:00PM to 6:00PM</p>" +
            // "<p><b>Time:</b> </br> " + data.start + " to " + data.end + "</p>" +
            // "<p><b>Time:</b> </br> " + hoursStart + ":" + minStart + " to " + hoursEnd + ":" + minEnd + "</p> </br>" +
            // "<p><b>Time:</b> </br> " + data.start.format('ha') + " to " + moment(data.end).tz('Asia/Singapore').format('ha') + "</p> </br>" +
            // "<p><b>Time:</b> </br> " + moment(data.start).format('ha') + " to " + moment(data.end).format('ha') + "</p> </br>" +
            "<p><b>Venue:</b> </br>" + data.address_one + "</br>" + data.address_two + "</br>" + data.address_three +"</p>" +
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
      // console.log("Returned Data:", data)
      $("#studentDetails").empty()
      $("#requestSelect").empty()

      for (var i = 0; i < data.length; i++ ) {
        $("#studentDetails").append(
          "<div class='card cardShadow media studentCard' id='card" + data[i].id + "'>" +
            "<a class='courseLinks'>" +
              "<div class='card-block'>" +
                "<div class='media-body'>" +
                  "<h4 class='card-title'>" + data[i].first_name + " " + data[i].last_name + "</h4>" +
                  "<h6 class='card-subtitle text-muted astheticLine'>" + data[i].one_liner + "</h6></br>" +
                  "<p><img src='/images/job.png'/> " + data[i].works[0].title + " at " + data[i].works[0].company + "</p>" +
                  "<p><img src='/images/education.png'/> " + data[i].qualification + " in " + data[i].degree + " at " + data[i].school + "</p>" +
                  "<p>" +
                    "<a class='browseIcons' href='mailto:" + data[i].email + "'><img src='/images/email.png'/></a>" +
                    "<a class='browseIcons' href='" + data[i].website + "'><img src='/images/website.png'/></a>" +
                    "<a class='browseIcons' href='" + data[i].github + "'><img src='/images/github.png'/></a>" +
                    "<a class='browseIcons' href='" + data[i].linkedin + "'><img src='/images/linkedin.png'/></a>" +
                  "</p>" +
                  "<div id='projectsTag" + data[i].id + "'>Projects:</br> </div>" +
                  "<div id='languageTag" + data[i].id + "'>Proficiencies:</br> </div>" +
                "</div>" +
                "<div class='media-right'>" +
                  "<img class='media-object browseImage img-circle' src='" + data[i].profile_pic_url + "' />" +
                "</div>" +
              "</div>" +
            "</a>" +
          "</div>" +
          "<div id='forModals'>" +
          "</div>"
        )

        // INCLUDE MODALS
        $("#forModals").append(
          '<div class="modal fade" id=modalcard'+ data[i].id + ' tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
            '<div class="modal-dialog" role="document">' +
              '<div class="modal-content">' +
                '<div class="modal-header">' +
                  '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
                    '<span aria-hidden="true">&times;</span>' +
                  '</button>' +
                  "<h3>Projects</h3>" +
                '</div>' +
                '<div class="modal-body">' +
                  '<div class="container-fluid bd-example-row" id="modalProjects' + data[i].id + '"><div>' +
                '</div>' +
              '</div>' +
            '</div>' +
          '</div>'
        )

        // INCLUDING PROJECTS
        if (data[i].projects.length > 0) {
          for (var k = 0; k < data[i].projects.length; k++) {
            $("#projectsTag"+ data[i].id + "").append(
              "<span class='tag blueColour tagSpacing'>"+ data[i].projects[k].name +"</span>"
            )
            $("#modalProjects"+ data[i].id + "").append(
                '<div class="row">' +
                  '<div class="col-md-5 col-md-offset-1 col-xs-12">' +
                    '<h4>' + data[i].projects[k].name + '</h4>' +
                    '<br>' +
                    "<p><a href='" + data[i].projects[k].github + "'><img src='/images/github.png'/> Github</a></p>" +
                    "<p><a href='" + data[i].projects[k].site + "'><img src='/images/website.png'/> Website</a></p>" +
                  '</div>' +
                  '<div class="col-md-6 col-xs-12">' +
                    '<iframe src="' + data[i].projects[k].project_gifs + '" width="200px" height="200px" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>' +
                  '</div>' +
                '</div>'
            )
            if (data[i].projects[k+1]) {
              $("#modalProjects"+ data[i].id + "").append("<hr>")
            }
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

$(document).on('click','.studentCard',function(){
   var clickedID = $(this).attr('id');
  //  console.log(clickedID);
    $('#modal' + clickedID + '').modal('show')
 })


})
