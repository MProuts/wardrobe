require './config/environment'
require 'sinatra/activerecord/rake'

namespace :db do
  task :down do
    FileUtils.rm('./db/development.db')
  end

  task :up do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end
