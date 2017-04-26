crystal_sidekiq_server: bash -c "cd crystal && crystal src/crystal_server.cr"
ruby_sidekiq_server: bash -c "cd ruby_on_rails && bundle exec sidekiq -q default"
rails_server: bash -c "cd ruby_on_rails && bundle exec rails s -p 3210"