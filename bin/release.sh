#! /bin/bash

bundle exec rails db:migrate
bundle exec rails after_party:run
