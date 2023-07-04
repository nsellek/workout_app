# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin '@fortawesome/fontawesome-free', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.3.0/js/all.js'

# custom js
pin 'utils', to: 'utils.js', preload: true
pin 'clients_invite', to: 'trainers/clients_invite.js', preload: true
pin 'new_workout', to: 'trainers/new_workout.js', preload: true
pin 'edit_workout', to: 'trainers/edit_workout.js', preload: true
pin 'add_set', to: 'clients/add_set.js', preload: true
