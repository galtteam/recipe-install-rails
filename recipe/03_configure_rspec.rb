FileUtils.rm_rf File.join(Dir.pwd, "test")

file 'Gemfile' do
  test_gems = <<~TST
    gem 'rspec-rails'

    gem 'capybara-screenshot'
    gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
    gem 'fuubar'
    gem 'database_cleaner'
    gem 'launchy', require: false
    gem 'simplecov', require: false
    gem 'rspec-retry'
    gem 'guard'
    gem 'guard-rspec'
    gem 'guard-bundler'
  TST

  indent 2 do
    put_after_line test_gems, "group :test do"
  end
end

copy_fixture 'spec/controllers/.gitkeep'
copy_fixture 'spec/factories/.gitkeep'
copy_fixture 'spec/features/.gitkeep'
copy_fixture 'spec/fixtures/.gitkeep'
copy_fixture 'spec/models/.gitkeep'
copy_fixture 'spec/support/capybara.rb'
copy_fixture 'spec/support/database_cleaner.rb'
copy_fixture 'spec/support/factory_bot.rb'
copy_fixture 'spec/support/shoulda.rb'
copy_fixture 'spec/rails_helper.rb'
copy_fixture 'spec/spec_helper.rb'

copy_fixture 'config/initializers/generators_config.rb'