# SmartSeeds
Gem for an auto-smart generating the seeds in your Rails app. 
It defines types columns in a model and generates random values for each of these fields.

## Usage

For example `Entity` model has `name`, `age`, `is_human` attributes.

All you need to do is run this command: `SmartSeeds.plant(Entity)`
```
> SmartSeeds.plant(Entity)
   (0.1ms)  begin transaction
  SQL (0.4ms)  INSERT INTO "entities" ("id", "name", "age", "is_human", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["id", 369], ["name", "Heil"], ["age", 344], ["is_human", false], ["created_at", 2017-01-15 16:10:50 UTC], ["updated_at", 2017-01-15 16:10:50 UTC]]
   (1.8ms)  commit transaction
 => true 

```
And we've got an object in a database:
```
> Entity.last
  Entity Load (0.2ms)  SELECT  "entities".* FROM "entities" ORDER BY "entities"."id" DESC LIMIT ?  [["LIMIT", 1]]
 => #<Entity id: 1, name: "Heil", age: 344, is_human: false, created_at: "2017-01-15 16:10:50", updated_at: "2017-01-15 16:10:50"> 

```
### Custom values
If you want to override some default values, you can send it in a hash:

```
> SmartSeeds.plant(Entity, {name: 'Aleah'})
   (0.1ms)  begin transaction
  SQL (0.4ms)  INSERT INTO "entities" ("id", "name", "age", "is_human", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["id", 167], ["name", "Aleah"], ["age", 374], ["is_human", false], ["created_at", 2017-01-15 16:15:15 UTC], ["updated_at", 2017-01-15 16:15:15 UTC]]
   (1.6ms)  commit transaction
 => true 
```

### Faker
The gem has a simple integration with [Faker](https://github.com/stympy/faker).

That means if you have a AR model which called like a some Faker class and an attribute called like a some faker method in that class 
a value will be generated by Faker gem. 

For example: Model `Superhero` has the `name` and `power` attributes, so the value will be generated by `Faker::Superhero.name` and `Faker::Superhero.power`. [Superhero doc](https://github.com/stympy/faker/blob/master/doc/superhero.md).
```
> SmartSeeds.plant(Superhero)
   (0.7ms)  begin transaction
  SQL (2.8ms)  INSERT INTO "superheros" ("name", "power", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "Cheetah Skull"], ["power", "Magic"], ["created_at", 2017-01-22 23:33:20 UTC], ["updated_at", 2017-01-22 23:33:20 UTC]]
   (0.9ms)  commit transaction
 => #<Superhero id: 8, name: "Ultra Firebird", power: "Magic", created_at: "2017-01-22 23:33:20", updated_at: "2017-01-22 23:33:20"> 

```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'smart_seeds'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install smart_seeds
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
