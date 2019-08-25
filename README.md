# DojoBook

## Prerequesites

To run the server in development mode, you'll need:

* ruby interpreter version according to `.ruby-version`. Using [rvm] or [rbenv]
is advisable
* PostgreSQL database version 9.3 or higher. On OS X, using the [Postgres.app] is the
simplest way to get it running.
* [Redis] is also used to schedule background jobs. On OS X, you can install it
via homebrew.

## Setting up

* `bundle install` to get all required gems
* `bundle exec rake db:create` to create the database
* `bundle exec rake db:setup` to create the database schema and seed data
* `bundle exec hookup` To make your database schema sync after using `git checkout`

## Running

`rails server`
`redis-server`
`bundle exec sidekiq`

This will run the Rails server on <http://localhost:3000>, redis server on port 6379, and [Sidekiq] job
processor.

[Redis]: http://redis.io
[rvm]: http://rvm.io
[rbenv]: http://rbenv.org
[Postgres.app]: http://postgresapp.com/
[Sidekiq]: http://sidekiq.org/

## Continous Integration Tasks

`rake ci:build:commit` # Runs all tests

`rake ci:build:rubocop` # Runs RuboCop code format verification

`rake ci:build:rubycritic` # Runs RubyCritic code complexity verification

`rake ci:build:simplecov` # Runs rspec with code coverage analysis and profile

`rake ci:build:documentation` # Runs documentation generate and verifies its coverage
