// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//require("@rails/ujs").start()
//require("turbolinks").start()
//require("@rails/activestorage").start()
//require("channels")

//require("jquery")


$(document).on('turbolinks:load', function() {

  // Header Auto Padding
  //リサイズされたときの処理
  $(window).on('load resize', function() {
    var navbarHeight = $(".navbar").outerHeight()
    $("body").css("padding-top", navbarHeight + "px")
    var footerHeight = $("footer").outerHeight()
    $("body").css("padding-bottom", footerHeight + "px")

    if ($(".main-container").length > 0) {
      var windowHeight = $(window).outerHeight()
      $(".main-container").css("height", (windowHeight - navbarHeight - footerHeight + 1) + "px")
    }
  });

  // $(window).reload(function() {
  //   var navbarHeight = $(".navbar").outerHeight()
  //   $("body").css("padding-top", navbarHeight + "px")
  //   var footerHeight = $("footer").outerHeight()
  //   $("body").css("padding-bottom", footerHeight + "px")

  //   if ($(".main-container").length > 0) {
  //     var windowHeight = $(window).outerHeight()
  //     $(".main-container").css("height", (windowHeight - navbarHeight - footerHeight + 1) + "px")
  //   }
  // });

});

window.$ = window.jQuery = require('jquery');
require('packs/raty')