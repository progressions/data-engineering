# Setup and Installation

## Dependencies

* Ruby 2.1.1
* Rails 4.1.0
* Bundler
* MySQL database

Clone into a directory.

Install gems:

```
bundle install
```

Create databases:

```
rake db:create
rake db:migrate
```

Start Rails server:

```
rails s
```

You should be good to go!

Tests are run using Rspec:

```
rspec
```
