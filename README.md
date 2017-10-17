# Charlotte

## Description

Charlotte is a stock management web program running on Ruby on Rails intended for use with medical stock items, that are a mix of perishable and non-perishable items.
This product has been designed to be used on both PC's and tablets with an on-screen numberpad for stocktaking.

## What does it do?

Charlotte has the following capabilities:
* Item Expiry
    * A stock item can be set to expire.
    * When an item passes expiry date, it will automatically be removed from the available amount in the stock check.
    * The expired amounts still remain in the total amount that are shown beside the available amount inside the parentheses.
* Stock Checking
    * The quantity of each items in locations can be accessed by simply seleting a location in the 'Locations' page.
    * If a user need to know where a stock item is located the quantity of each stock item can be accessed by selecting a stock item in the 'Stock Items' page.
    * Each item can be clicked to access the item's audit page detailed below.
* Stock Taking
    * Users with appropriate permissions can perform a stocktake on the selected location.
    * This can be done through keyboard and mouse input or by touchscreen input using the numberpad.
    * Items that can expire will have a date-picker 
* Stock Reporting
    * Users with appropriate permissions can generate a report page that lists all the items and the amount required for the current location and all the sublocations within.
    * Users can expand the report to also generate a summary of each sublocation by selecting the 'Display Sub-Locations' option.
    * An order report can be generated by selecting the 'Order Report' option. This will filter out any items that are stocked to or above the required amount.
    * The expiry date can be displayed for items that allow it by selecting the 'Display Expiry Dates' option.
    * An order report from any location can be downloaded as a CVS file to be used outside the program.
* Auditing
    * When performing a stocktake, the time of change, the user and the amount will be recorded any time a change is made.


## Requirements

Charlotte requires:
* Rails 5.1.x
* Ruby 2.2.2+
* PostgreSQL 9.3+

## Installation

For installation details see [install](INSTALL.md).


## Dependencies

#### Charlotte has the following dependencies:

* Models
    * [acts_as_list][] - ordered list in ActiveRecord
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
    * [select2-rails][] - a select form for jquery including bootstrap theme
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
[acts_as_list]: https://github.com/swanandp/acts_as_list
[ancestry]: https://github.com/stefankroes/ancestry
[scenic]: https://github.com/thoughtbot/scenic

[audited]: https://github.com/collectiveidea/audited
[paranoia]: https://github.com/rubysherpas/paranoia

[cancancan]: https://github.com/CanCanCommunity/cancancan
[devise]: https://github.com/CanCanCommunity/cancancan

[react-rails]: https://github.com/reactjs/react-rails
[jbuilder]: https://github.com/rails/jbuilder

[bootstrap_form]: https://github.com/bootstrap-ruby/rails-bootstrap-forms
[breadcrumbs_on_rails]: https://github.com/weppos/breadcrumbs_on_rails
[rails-assets-bootstrap-sass]: https://github.com/twbs/bootstrap-sass
[rails-assets-bootstrap-treeview]: https://github.com/jonmiles/bootstrap-treeview
[select2-rails]: https://github.com/argerim/select2

[capybara]: https://github.com/teamcapybara/capybara
[database_cleaner]: https://github.com/DatabaseCleaner/database_cleaner
[factory_girl_rails]: https://github.com/thoughtbot/factory_girl_rails
[geckodriver-helper]: https://github.com/DevicoSolutions/geckodriver-helper
[rails-controller-testing]: https://github.com/rails/rails-controller-testing
[rspec-rails]: https://github.com/rspec/rspec-rails
[selenium-webdriver]: https://rubygems.org/gems/selenium-webdriver/versions/2.48.1
[shoulda-matches]: https://github.com/thoughtbot/shoulda-matchers
[simplecov]: https://github.com/colszowka/simplecov
