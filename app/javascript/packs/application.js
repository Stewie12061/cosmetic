// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import * as Routes from 'routes'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"

const images = require.context("../images", true)
import '../stylesheets/application.scss'

import 'bootstrap'

import * as EventService from '../services/event_service'
EventService.start()
window.Routes = Routes
