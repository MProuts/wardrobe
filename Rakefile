require './config/environment'
require 'sinatra/activerecord/rake'

task :environment do
  require './config/environment'
end

task :console => :environment do
  Pry.start
end

namespace :db do
  task :down do
    FileUtils.rm('./db/wardrobe_development.sqlite')
  end

  task :up do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end
