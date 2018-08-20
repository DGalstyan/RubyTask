# Rails Single Page Task

The application uses:

* "Devise":https://github.com/plataformatec/devise for user management and authentication
* "Bootstrap":http://getbootstrap.com/ or "Foundation":http://foundation.zurb.com/ front-end frameworks

## Dependencies

Before generating your application, you will need:

* The Ruby language - version 2.3.1
* The Rails gem - version 4.2.5

Getting the Application
Local
You have several options for getting the code on your own machine. You can fork or clone.

#### Database

Use SQLite for development on Mac or Linux.

#### Template Engine

The example application uses the default "ERB" Rails template engine and Haml template engine.


### Use RVM

I recommend using "RVM":https://rvm.io/, the Ruby Version Manager, to create a project-specific gemset for the application.

### Gems

Here are the gems used by the application:

* "Devise":http://github.com/plataformatec/devise for authentication and user management

These gems make development easier:

* "ransack":https://github.com/activerecord-hackery/ransack - Object-based searching
* "kaminari":https://github.com/kaminari/kaminari - A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs

Front-end framework:

* "bootstrap":https://github.com/twbs/bootstrap-rubygem - Bootstrap for CSS and JavaScript

Code style framework

* "rubocop":https://github.com/rubocop-hq/rubocop - A Ruby static code analyzer and formatter, based on the community Ruby style guide
Just type rubocop in a Ruby project's folder and watch the magic happen.
<pre>
$ rubocop
</pre>

### Install the Required Gems

If you used the "Rails Composer":http://railsapps.github.io/rails-composer/ tool to generate the example app, the application template script has already run the @bundle install@ command.

If not, you should run the @bundle install@ command to install the required gems on your computer:

<pre>
$ bundle install
</pre>

You can check which gems are installed on your computer with:

<pre>
$ gem list
</pre>

Keep in mind that you have installed these gems locally. When you deploy the app to another server, the same gems (and versions) must be available.

### Set the Database

Prepare the database and add the default user to the database by running the commands:

<pre>
$ rake db:migrate
$ rake db:seed
</pre>

Use @rake db:reset@ if you want to empty and reseed the database.

h2. Test the App

You can check that your application runs properly by entering the command:

<pre>
$ rails server
</pre>

To see your application in action, open a browser window and navigate to "http://localhost:3000/":http://localhost:3000.

You should see a home page with a navigation bar.

Click the "Sign up" and create new user.

You'll see a page with a form that is used to register a new account.

Click the "Sign in" and login with admin user.

1. Username: admin@admin.com
2. Password: admin123

You'll see a page with users.

### RSpec Test Suite

The application contains a suite of RSpec tests. To run:

<pre>
$ rspec
</pre>
