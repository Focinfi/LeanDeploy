namespace :dev do
  desc "Overload db"
  task :overload_db do
    `rake db:drop`
    `rake db:create`
    `rake db:migrate`
    `rake db:seed`
  end

  desc "rspec test"
  task :task_name => [:dependent, :tasks] do
    
  end
end