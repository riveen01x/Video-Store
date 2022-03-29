// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("jquery")

import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'select2'
import 'select2/dist/css/select2.css'
import 'easy-autocomplete'


require('../src/index');

require('easy-autocomplete')

require('./nested-forms/addFields')
require('./nested-forms/removeFields')

//Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")


import "trix/dist/trix.css"

$(document).on("turbolinks:load", () => {
 $('.select2').select2();
})


import "controllers"


