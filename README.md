[<img src="https://travis-ci.org/arekf/has_sti.svg?branch=master" alt="Build Status" />](https://travis-ci.org/arekf/has_sti) [<img src="https://codeclimate.com/github/arekf/has_sti/badges/gpa.svg" />](https://codeclimate.com/github/arekf/has_sti) [<img src="https://codeclimate.com/github/arekf/has_sti/badges/coverage.svg" />](https://codeclimate.com/github/arekf/has_sti) [<img src="https://badge.fury.io/rb/has_sti.svg" alt="Gem Version" />](http://badge.fury.io/rb/has_sti)

# has_sti

`has_sti` is an ActiveRecord extension that provides helper methods and scopes
for STI models.

## Installation
*   Add `has_sti` to your Gemfile:
```ruby
gem 'has_sti'
```

* Install with: bundle install


## Usage
We will use Ruby on Rails for this scenario. Let's say `User` model is a
parent STI class and you want to create child classes: `Admin` and `Reader`.
You start with defining STI as follows:

```ruby
class User < ActiveRecord::Base
end

class Admin < User
end

class Reader < User
end
```

Next step is creating migration for the database:
    rails generate migration AddTypeToUser type:string

Then, we need to migrate database:
    bundle exec rake db:migrate

Basic setup of STI is done. Here's where `has_sti` takes action.

Modify your `User` model to include `has_sti`:

```ruby
class User < ActiveRecord::Base
  has_sti :admin, :reader
end
```

And that's it. Now you have following methods and scopes available:
```ruby
some_admin = Admin.create

some_admin.admin? => true
some_admin.reader? => false

User.admin => [some_admin]
User.reader => []
```

You can also disable helper methods:
```ruby
class User < ActiveRecord::Base
  has_sti :admin, :reader, helper_methods: false
end
```

or scopes:
```ruby
class User < ActiveRecord::Base
  has_sti :admin, :reader, scopes: false
end
```

or even set it per child class:
```ruby
class User < ActiveRecord::Base
  has_sti :admin, scopes: false
  has_sti :reader, helper_methods: false
end
```

No configuration is required. Custom STI column name is supported.

## License
`has_sti` is released under the MIT license:
*   http://www.opensource.org/licenses/MIT


## Author
Arkadiusz Fal
*   http://arekf.net


Copyright © 2015
