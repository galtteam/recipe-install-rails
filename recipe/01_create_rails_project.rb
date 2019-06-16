project_name = ask("Enter new project name")
ruby_version = ask("Enter ruby version. Please note that version should be already installed")

run %Q{rails new #{project_name} --skip-bundle}

@current_dir = File.join(Dir.pwd, project_name)

file '.ruby-gemset' do
  clean_file!
  put_to_beginning project_name
end
file '.ruby-version' do
  clean_file!
  put_to_beginning ruby_version
end

file 'Gemfile' do
  replace_line %Q{ruby '#{ruby_version}'}, "ruby '"
end

run %Q{git init}
run %Q{git add . }
run %Q{git commit -m 'Initial commit' }