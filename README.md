# community-events-rails-api
opensource rails API only app for community events

# Dev Reference
REFRENCE: https://medium.com/otavio-henrique/creating-simple-rest-api-with-rails-5-1ba71b37cad

# Creating API only app
rails new library --api -d postgresql -T

# Installing Rspec
group :development, :test do
  gem 'rspec-rails', '~> 3.6'
end

# Add factory girl to your gemfile
gem 'factory_girl'

# Setting API Versioning
gem 'versionist'

# Creating Database
rails db:create

# Starting Rails App
rails s

# Creating version in a namespace in routes.rb
rails generate versionist:new_api_version v1 V1 --path=value:v1

# Defining resources in routes.rb
resources :books

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# Making Controllers and views with scaffold
rails g controller super_admin/admin index show new create edit update destroy

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# removing columns from table using migration
rails generate migration RemoveAdminIdFromAnimals admin_id:bigint

# add column in table using migration
rails generate migration add_email_to_users email:string

# update column name - rails g migration UpdateColumnVendors
rename_column :table, :old_column, :new_column

# Joins
products = Product.joins(:types)

# update column type to datetime - rails g migration change_date_string_to_datetime
def change
    remove_column :payments, :date
    add_column :payments, :date, :datetime
end

# RAILS ERD GEM
Rails ERD - Generate Entity-Relationship Diagrams for Rails applications
https://github.com/voormedia/rails-erd
Run: bundle exec erd