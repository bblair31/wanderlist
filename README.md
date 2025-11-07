# Wanderlist 🧳✈️🚞🚙

![CI Status](https://github.com/bblair31/wanderlist/workflows/CI/badge.svg)
[![Ruby Version](https://img.shields.io/badge/ruby-3.3.6-red.svg)](https://www.ruby-lang.org/)
[![Rails Version](https://img.shields.io/badge/rails-7.2-red.svg)](https://rubyonrails.org/)

A modern social media application centered around shared travel experiences, recommendations, and messaging built with Rails 7.2, Hotwire, and Bootstrap 5.

## Features

- **User Authentication** - Secure user accounts with editable profile information
- **Travel Reviews** - Create, read, edit, and delete reviews of cities worldwide
- **Social Features** - Browse other users' profiles and their travel experiences
- **Messaging** - Direct messaging between users about shared travel experiences
- **Advanced Search** - Filter and search reviews by country and city
- **Modern UI** - Responsive design with Bootstrap 5 and Hotwire/Turbo

## Tech Stack

- **Ruby** 3.3.6
- **Rails** 7.2.2
- **Database** SQLite3 (development/test)
- **Frontend**
  - Hotwire (Turbo + Stimulus)
  - Bootstrap 5.3
  - Importmap for JavaScript
- **Testing**
  - RSpec
  - FactoryBot
  - Shoulda Matchers
  - SimpleCov (code coverage)
- **Code Quality**
  - RuboCop (Ruby linter)
  - Bundle Audit (security)
- **CI/CD** GitHub Actions

## Getting Started

### Prerequisites

- Ruby 3.3.6
- Bundler 2.x
- SQLite3

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/bblair31/wanderlist.git
   cd wanderlist
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the development server**
   ```bash
   rails server
   ```

5. **Visit the application**

   Open your browser and navigate to `http://localhost:3000`

### Running Tests

```bash
# Run the full test suite
bundle exec rspec

# Run RuboCop linter
bundle exec rubocop

# Check for security vulnerabilities
bundle exec bundle-audit check --update
```

## Development

### Code Quality

This project follows modern Rails best practices and enforces code quality through:

- **RuboCop** - Automated code style checking
- **RSpec** - Comprehensive test coverage
- **GitHub Actions** - Continuous integration on every push

### Key Improvements (2025)

This codebase has been modernized with:

- ✅ Upgraded from Rails 5.2 → 7.2
- ✅ Upgraded from Ruby 2.3 → 3.3.6
- ✅ Migrated from CoffeeScript to modern JavaScript
- ✅ Added Hotwire (Turbo + Stimulus) for reactive UI
- ✅ Upgraded Bootstrap 4 → Bootstrap 5
- ✅ Refactored models with scopes and modern patterns
- ✅ Improved controllers with better error handling
- ✅ Added pagination with Pagy
- ✅ Comprehensive test suite with RSpec
- ✅ CI/CD pipeline with GitHub Actions
- ✅ Security improvements and SQL injection fixes

## Built With

* [Ruby on Rails 7.2](https://rubyonrails.org/) - Web framework
* [Hotwire](https://hotwired.dev/) - Modern frontend framework
* [Bootstrap 5](https://getbootstrap.com/) - UI framework
* [SQLite3](https://www.sqlite.org/) - Database
* [RSpec](https://rspec.info/) - Testing framework
* [Stimulus](https://stimulus.hotwired.dev/) - JavaScript framework
* [Turbo](https://turbo.hotwired.dev/) - SPA-like page acceleration

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
 
