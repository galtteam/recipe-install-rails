file 'Gemfile' do
  put_to_end %Q{gem 'dotenv-rails', require: 'dotenv/rails-now'}
end

file '.gitignore' do
  put_to_end ".env"
  replace_line "", "database.yml"
end

copy_fixture '.env'
copy_fixture '.env.example'
copy_fixture 'config/database.yml', force: true
copy_fixture 'config/initializers/001_required_variables.rb'