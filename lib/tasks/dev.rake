namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:kill_postgres_connections", "db:drop", "db:create", "db:migrate", "db:seed" ]

  desc "create_base_category"
  task :demo => :environment do

  end
end


namespace :db do

task :kill_postgres_connections => :environment do
  db_name = "#{File.basename(Rails.root)}_#{Rails.env}"
  sh = <<EOF
ps xa \
  | grep postgres: \
  | grep #{db_name} \
  | grep -v grep \
  | awk '{print $1}' \
  | xargs kill
EOF
  puts `#{sh}`
end

  desc "Truncate all existing data"
  task :truncate => "db:load_config" do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection
      DatabaseCleaner.clean_with :truncation
    end
  end

end
