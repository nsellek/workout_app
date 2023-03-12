// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "@fortawesome/fontawesome-free"

// custom JS
import 'clients_invite'
import 'new_workout'
// import 'clients'

(() => {
  const toastElList = document.querySelectorAll('.toast');
  [...toastElList].map(toastEl => new bootstrap.Toast(toastEl).show());

  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
})();
