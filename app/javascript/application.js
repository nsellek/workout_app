// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "@fortawesome/fontawesome-free"
import "jquery"
import "jquery_ujs"
import "jquery-ui"

// custom JS
// Trainers JS
import 'trainers/clients_invite'
import 'trainers/new_workout'
import 'trainers/edit_workout'
import 'trainers/client_dashboard'

// Clients JS
import 'clients/add_set'
import 'clients/pick_exercise'
// import 'clients'

document.addEventListener('turbo:load', () => {
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
});
