source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use Postgres for dev and production
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'squeel', github: 'danielrhodes/squeel'
gem 'slim'  # add slim support
gem 'slim-rails'    # replace the .erb with .slim
gem 'bootstrap-sass'    # add bootstrap to rails
gem 'autoprefixer-rails'    # adds browsers prefixes to css
gem 'nprogress-rails'   # customizable progressbar with turbolinks support
gem 'font-awesome-rails'    # only if you need more icons
gem 'simple_form'   # always install when working with forms

gem 'devise'
gem 'gravatarify'
gem 'public_activity'
gem 'auto_html'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'



# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

end

group :production do

  gem 'rails_12factor'
  gem 'unicorn'
end
