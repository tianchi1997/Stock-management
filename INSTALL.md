# Installation 

## Requirements

Charlotte requires:
* Rails 5.1.x
* Ruby 2.2.2+
* PostgreSQL 9.3+

## Installation steps
These installation steps assume that a PostgreSQL database has been set up and
can be accessed from machine where the application will be installed. Ruby
2.2.2+ must also be available on the machine.

1. Clone repository  
```
git clone https://github.com/thomasfedb/charlotte.git
cd charlotte
```
2. Fetch dependencies  
```
gem install bundle
bundle
```

3. Set up relevant configuration files in config directory. Particularly database.yml, secrets.yml and mailer settings.  

4. Run database migration  
```
rake db:migrate
```
5. Start rails server  
```
rails s
```
