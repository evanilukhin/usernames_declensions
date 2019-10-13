# Username Declensions  [![CircleCI][circle-ci-image]][circle-ci] [![Reviewed by Hound][hound-badge-image]][hound]

This application automatically generates all declensions for the first name, middle name and last_name registered in this application persons.

## Architecture 
This application consists  of two parts: 
* Single Page Application on the React that worked as a view and partly as a router.
* API manipulates data from the database

## Setup
### JS
Install YARN from [there](https://yarnpkg.com/lang/en/docs/install)
### Ruby 
* install ruby. Version [there](.ruby-version)
* install bundler `gem install bundler`
* run `bundle install`
### Database
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

[hound-badge-image]: https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg
[hound]: https://houndci.com
[circle-ci-image]: https://circleci.com/gh/evanilukhin/usernames_declensions/tree/master.svg?style=svg
[circle-ci]: https://circleci.com/gh/evanilukhin/usernames_declensions/tree/master