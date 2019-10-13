# Username Declensions  [![CircleCI][circle-ci-image]][circle-ci] [![Reviewed by Hound][hound-badge-image]][hound]

Declines last name, first name, middle name for added users. Works only for russian names thanks [Petrovich](https://github.com/petrovich/petrovich-ruby).

This application consists of two parts: 
* Single Page Application on the React that worked as a view and partly as a router.
* API manipulates data from the database. (Documentation [there](doc/api/v1.yml))

Web site deployed on [heroku](https://usernames-declensions.herokuapp.com/).

Latest builds on [dockerhub](https://hub.docker.com/r/evanilukhin/usernames_declensions).

## Setup
#### Ruby 
* install ruby. Version [there](.ruby-version)
* install bundler `gem install bundler`
* run `bundle install`
#### JS
* install YARN from [there](https://yarnpkg.com/lang/en/docs/install)
* run `yarn install`
#### Database
To prepare the database you must:
* install postgres or get credentials for the existed database
* add the next environment variables:
   * DB_LOGIN - role in database that has rights to create database and to login;
   * DB_PASS - password;
   * DB_NAME -(optional in development and test environment) - name for the database. 
   By default in development - `usernames_declensions`, in test - `usernames_declensions_test`;
   * DB_HOST - host (localhost -  if this database deployed local)
   * DB_PORT - port
* run `rake db:setup`
* run `rake db:migrate`

After it, run `bin/rails s`.

### ..or

* install [docker](https://docs.docker.com/install/) and [docker-composer](https://docs.docker.com/compose/install/)
* run `docker-compose up`

In both cases server will be available on `localhost:3000`.

## Features

What there are and what there aren't:

:heavy_check_mark: Almost 100% test coverage (only backend)

:heavy_check_mark: Cool API

:heavy_check_mark: Automatic tests by using Circle-CI

:heavy_check_mark: Fantastic documentation for the API 

:whale:  Docker. Autobuilds in docker-hub.


:x: Handling errors on the front-end

:x: Documentation for errors in the openapi specification

:skull_and_crossbones: Fantastic(seriously) SPA. (I didn't add no one css file)

:skull_and_crossbones: Unrivaled protection from attacks (Don't show this site to OWASP)

:skull_and_crossbones: Absolutely readable React code (I spent only 4 hours on it and I don't know React)

 
[hound-badge-image]: https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg
[hound]: https://houndci.com
[circle-ci-image]: https://circleci.com/gh/evanilukhin/usernames_declensions/tree/master.svg?style=svg
[circle-ci]: https://circleci.com/gh/evanilukhin/usernames_declensions/tree/master
