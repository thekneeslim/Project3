// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tether
//= require turbolinks
//= require bootstrap

//= require_tree .

$(document).on('turbolinks:load', function() {
  console.log('DOM loaded');

  var carousel = $(".carousel"),
      currdeg  = 0;

  $("#next").on("click", { d: "n" }, rotate);
  $("#prev").on("click", { d: "p" }, rotate);

  function rotate(e){
    if(e.data.d=="n"){
      currdeg = currdeg - 90;
    }
    if(e.data.d=="p"){
      currdeg = currdeg + 90;
    }
    carousel.css({
      "-webkit-transform": "rotateY("+currdeg+"deg)",
      "-moz-transform": "rotateY("+currdeg+"deg)",
      "-o-transform": "rotateY("+currdeg+"deg)",
      "transform": "rotateY("+currdeg+"deg)"
    });
  }

  // ========================== INFORMATION BAR ==========================

    var identity = 0;
    $('#prev').click(function() {
      $("#infoProfile").css("visibility", "hidden")
      $("#infoVideo").css("visibility", "hidden")
      $("#infoProjects").css("visibility", "hidden")
      $("#infoExperiences").css("visibility", "hidden")
      identity--
      console.log("Prev:", identity);

      if (identity < 0) {
        identity = 3
      }

      console.log("Prev 2:", identity);
      if (identity == 0) {
        $("#infoProfile").css("visibility", "visible")
      } else if (identity == 1 ) {
        $("#infoVideo").css("visibility", "visible")
      } else if (identity == 2) {
        $("#infoProjects").css("visibility", "visible")
      } else {
        $("#infoExperiences").css("visibility", "visible")
      }

    })

    $('#next').click(function() {
      $("#infoProfile").css("visibility", "hidden")
      $("#infoVideo").css("visibility", "hidden")
      $("#infoProjects").css("visibility", "hidden")
      $("#infoExperiences").css("visibility", "hidden")

      identity++
      console.log(identity)
      if (identity > 3) {
        identity = 0
      }
      console.log(identity)
      if (identity == 0) {
        $("#infoProfile").css("visibility", "visible")
      } else if (identity == 1 ) {
        $("#infoVideo").css("visibility", "visible")
      } else if (identity == 2) {
        $("#infoProjects").css("visibility", "visible")
      } else {
        $("#infoExperiences").css("visibility", "visible")
      }
    })

})
