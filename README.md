
# Wanderlist 🧳✈️🚞🚙

Social media application centered around shared travel experiences, recommendations, and messaging

[Demo Video](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)

User Stories:
 - A user has an account with editable profile information
 - A user can view all of their past reviews and the cities they have traveled to
 - A user can browse other users' profiles
 - A user can create, read, edit, delete reviews of cities.
 - A user can browse through all cities' reviews in the world and filter by country
 - A user can message other users about shared experiences and travel recommendations


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing

1. Fork and Clone this repository

2. Install all required gems
 
```
bundle install
```
  * *NOTE*: If you get an error message about needing to install Bundler, from the command line run `gem install bundler`
  
3. Created new PostgreSQL development database

```
rails db:create
```

4. Run all database migrations and establish schema

```
rails db:migrate
```

5. Seed the database with given seed data from seeds.rb

```
rails db:seed
```

6. Start the Rails Server

```
rails start
```

7. Check to see if browser can communicate with the database

  * Open your default browser and navigate to localhost:3000 (or whatever address is listed in the command line at 'Listening on tcp:'


__Ctrl + c will stop the server when you are done testing

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Full stack framework
* [SQLite3](https://www.sqlite.org/index.html) - SQL database engine
* [Faker Gem](https://github.com/stympy/faker) - Factory for generating seed data
* [Bootstrap](https://getbootstrap.com/docs/4.1/getting-started/introduction/) - Open source toolkit for developing with HTML, CSS, and JS
* [City-State Gem](https://github.com/loureirorg/city-state) - Gem for populating database with all cities and countries

## Contributors

* [Tiffany Choong](https://github.com/TurtleFeeder)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements

* [Jose Aguinaga](https://codepen.io/jjperezaguinaga/pen/yuBdq) - Wanderlist landing page SVG built off this base
* Background Images (freepik)
  * [Travel Map](https://www.freepik.com/free-vector/travel-background-in-flat-style_1843724.htm)
  * [Skyline](https://www.freepik.com/free-vector/black-and-white-city-skyline_764693.htm)
  * [Passport](https://www.freepik.com/free-vector/hand-drawn-passport-wit-stamps_1268075.htm)
* [Bootstrap Theme: Flatly](https://bootswatch.com/flatly/)
 
