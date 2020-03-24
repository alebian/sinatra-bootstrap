# Sinatra bootstrap

This is an opinionated Sinatra application with conventions similar to Rails. What includes:

* ActiveRecord
* Sidekiq

## Executables

In the `bin` folder there are scripts that let you:

* Start a cosole: `bin/console`
* Start the webapp: `bin/webapp`
* Start workers: `bin/workers`

Also the repo contains a Makefile with all you need.

## Database

The app is configured to use Postgres by default, you can check and change the configuration in the `config/database.yml` file.

If you don't want to use a database, you can remove the related dependencies (`sinatra-activerecord`, `pg` and `pagy`) and its usages.

### Connection pool

The connection pool is configured in the `activerecord` initializer and uses an environment variable named `DATABASE_CONNECTION_POOL`.

### Commands

[Sinatra activerecord](https://github.com/sinatra-activerecord/sinatra-activerecord) provides `rake` commands to perform database actions like Rails does.

#### Create migration

For example, to create a new migration you can run: `bundle exec rake db:create_migration NAME=migration_name`

## Webserver

This app uses puma as the webserver which you can configure with environment variables: `PUMA_WORKERS`, `PUMA_THREADS`, `WEBSERVER_PORT`.

### CORS

This app uses the [rack-cors](https://github.com/cyu/rack-cors) gem to provide cross domain access. You can configure this further in the `config.ru` file.

## Application

All your business logic and domain classes are intended to live in the `lib` folder. In this base application you have a `User` model example and not much more.

### Boot

All your classes are loaded using the `require_all` gem inside the `lib/boot.rb` file. You can require any other dependency you need in that file.

### Secrets

One thing that I like is to use environment variables for secrets (they are defined in `config/secrets.yml` like Rails) and raise an exception if there is one missing (how many times have you deployed an application and forgot to set an env variable?). For this I created a class called `Application` which handles all of that and has some other configuration like the logger.

You can use your secrets like: `Application.secrets.redis_url`.

## Web application

## Sidekiq

The Sidekiq configuration is pretty much the default in this repo. The config files are located in `config/sidekiq.yml` and `lib/initializers/sidekiq.rb`.

### Web UI

The Sidekiq's web UI is loaded in `/sidekiq` using basic authentication. You can change this in the `config.ru` file. The environment variables to set user and password are `SIDEKIQ_AUTH_USER` and `SIDEKIQ_AUTH_PASS` respectively.

## Docker

Docker configuration is provided and you can run the entire application using: `docker-compose up`.
