# README

This application automatically generates all declensions for the first name, middle name and surname registered in this application persons.

## Architecture 
This application consists  of two parts: 
* Single Page Application on the React that worked as a view and partly as a router.
* API manipulates data from the database

##Setup
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
   * DB_USERNAME - role in database that has rights to create database and to login;
   * DB_PASSWORD - password;
   * DB_NAME -(optional in development and test environment) - name for the database. 
   By default in development - `usernames_declensions`, in test - `usernames_declensions_test`;
   * DB_HOST - host (localhost -  if this database deployed local)
   * DB_PORT - port
* run `rake db:setup`