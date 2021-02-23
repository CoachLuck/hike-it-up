# Hike It Up
A website to view and rate the best hiking spots around!
This project is built on **Ruby** using **Sinatra**, and **ActiveRecord** utilizing **PostgreSQL** for data storage. *Hike It Up* was built as a portfolio project at [Flatiron School](https://flatironschool.com/). 

## Why?
This was a great way to get used to building out a project using in the [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) structure. I wanted to explore the possibilites of using **Sinatra** to build a web application and create object relations between users and something. Taking one of my passions, hiking, and merging it with my new found knowledge I arrived at *Hike It Up*. 

What I hoped to learn:
* How to successfully authenticate a user within a sinatra application using bcrypt
* How to utilize HTML forms along with Sinatra to perform CRUD based operations
* How to build a MVC structured application

## Running the Application
I hope to get this up and running for free on a heroku server. In the meantime feel free to clone this project and follow the steps below to get started.

* Clone this project.
* CD into the projects directory.
* Run `bundle install`
* Run `APP_ENV=production bundle exec rackup -p 9292`
* Navigate to [localhost:9292](http://localhost:9292/)

## Information
* [MVP Structure](#most-viable-product-structure)
* [Stretch Features](#stretch-features )

### Most Viable Product Structure
Thinking of the base structure I went ahead and created models for `users`, `trails`, `reviews`, and `trail images`. Although only needed views for my `users` and `trails` models, as the others were children of these models. 

Thus the structure for our objects looked like:
```ruby

# user
  has_many: :reviews
  has_many: :trails, through: :reviews

# trail
  has_many: :reviews
  has_many: :trail_images
  
  # active record will automatically set this association for us
  # has_many: :users, through: :reviews
  
# review
  belongs_to: :user
  belongs_to: :trail
  
# trail image
  belongs_to: :trail

```

#### What can anyone do?
* View all trails
* View all users

#### What can a user do if they log in?
* Edit their own profile information
* Edit trail information
* Leave a review on a trail

To implement this I created [migrations](https://www.github.com/CoachLuck/hike-it-up/db/migrate) using **Rake** to create the associated tables for the models I just created.

### Stretch Features

#### What can anyone do?
- [ ] Allow users to search trails by name
- [ ] Allow users to search for a user by name/username

#### What can a user do if they log in?
- [X] Add an image to a trail
- [X] [Add captions to images](https://www.github.com/CoachLuck/hike-it-up/db/migrate/20210222173851_add_captions_to_images.rb)
- [ ] Delete/Edit their reviews


