file 'Gemfile' do
  common_gems = <<~CMN
    gem 'pg'
    gem 'rails_dt'
    gem 'faker'
    gem 'factory_bot_rails'
  CMN

  put_to_end common_gems

  development_test_gems = <<~DTG
    gem 'byebug', platform: :mri
    gem 'pry-rails'
    gem 'letter_opener_web'
    gem 'letter_opener'
  DTG

  indent 2 do
    put_after_line development_test_gems, "group :development, :test do"
  end

  development_gems = <<~DEV
    gem 'binding_of_caller'
    gem 'rubocop', require: false
    gem 'awesome_print'
    gem 'better_errors'
  DEV

  indent 2 do
    put_after_line development_gems, "group :development do"
  end
end