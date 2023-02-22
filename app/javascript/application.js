// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "./bootstrap"

(() => {
  const toastElList = document.querySelectorAll('.toast');
  [...toastElList].map(toastEl => new bootstrap.Toast(toastEl).show());
})();
