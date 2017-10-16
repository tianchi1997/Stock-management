# Charlotte
## Description

## Requirements

This template currently works with:

* Rails 5.1.x
* PostgreSQL 9.3 or above
* A scheduling daemon to remove expired items daily

## Installation

For installation details see [install](INSTALL.md).

## Usage

## What does it do?

## Dependencies

#### Charlotte has the following dependencies:

* Models
    * [ancestry][] - tree heirarchy in ActiveRecord
    * [scenic][] - database views in Rails
* Auditing
    * [audited][] - an ActiveRecord extension to log all changes to models
    * [paranoia][] - an ActiveRecord extension which keeps models even after they are deleted
* Authentication
    * [cancancan][] - an authorisation gem for Rails
    * [devise][] - an authentication implementation for Rails
* ReactJS
    * [react-rails][] - a ReactJS rails integration gem
    * [jbuilder][] - generates JSON objects for ReactJS components
* User Interface
    * [bootstrap_form][] - provides bootstrap form integration in Rails
    * [breadcrumbs_on_rails][] - a breadcrumb generator for Rails
    * [rails-assets-bootstrap-sass][] - a Bootstrap rails asset pipeline integration gem
    * [rails-assets-bootstrap-treeview][] - a Bootstrap treeview plugin
    * [rails-assets-select2][] - a select form for jquery
* Testing
    * [capybara][] - acceptance test framework for web applications
    * [database_cleaner][] - resets database state after each test
    * [factory_girl_rails][] - replacement for Rails fixtures
    * [geckodriver-helper][] - helper for install geckodriver for selenium
    * [rails-controller-testing][] - controller test macros for rspec
    * [rspec-rails][] - a ruby testing framework used to test behaviour of application
    * [selenium-webdriver][] - driver for capybara supporting javascript
    * [shoulda-matches][] - shortcuts for common ActiveRecord tests
    * [simplecov][] - code coverage reports

## How does it work?


[react-rails]: https://github.com/reactjs/react-rails
[jbuilder]: https://github.com/rails/jbuilder
[bootstrap_form]: https://github.com/bootstrap-ruby/rails-bootstrap-forms
[breadcrumbs_on_rails]: https://github.com/weppos/breadcrumbs_on_rails
[rails-assets-bootstrap-sass]: https://github.com/twbs/bootstrap-sass
[rails-assets-bootstrap-treeview]: https://github.com/jonmiles/bootstrap-treeview
[rails-assets-select2]: https://github.com/select2/select2
[ancestry]: https://github.com/stefankroes/ancestry
[scenic]: https://github.com/thoughtbot/scenic
[cancancan]: https://github.com/CanCanCommunity/cancancan
[devise]: https://github.com/CanCanCommunity/cancancan
[audited]: https://github.com/collectiveidea/audited
[paranoia]: https://github.com/rubysherpas/paranoia
[database_cleaner]: https://github.com/DatabaseCleaner/database_cleaner
[factory_girl_rails]: https://github.com/thoughtbot/factory_girl_rails
[rspec-rails]: https://github.com/rspec/rspec-rails
[shoulda-matches]: https://github.com/thoughtbot/shoulda-matchers
[simplecov]: https://github.com/colszowka/simplecov
[rails-controller-testing]: https://github.com/rails/rails-controller-testing
[capybara]: https://github.com/teamcapybara/capybara
[selenium-webdriver]: https://rubygems.org/gems/selenium-webdriver/versions/2.48.1
[geckodriver-helper]: https://github.com/DevicoSolutions/geckodriver-helper
