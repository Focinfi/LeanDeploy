namespace :local do
  desc "Run server with puma"
  task :s do
    `rails s -p 12345`
  end
end
