# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin '@fortawesome/fontawesome-free', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.3.0/js/all.js'
pin 'highcharts', to: 'https://code.highcharts.com/11.1/highcharts.js'
pin 'jquery', to: 'jquery3.min.js', preload: true
pin 'jquery_ujs', to: 'jquery_ujs.js', preload: true
pin 'jquery-ui', to: 'jquery-ui.js', preload: true

# custom js
pin 'utils', to: 'utils.js', preload: true
pin_all_from 'app/javascript/trainers', under: 'trainers'
pin_all_from 'app/javascript/clients', under: 'clients'
