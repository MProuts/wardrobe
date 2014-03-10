class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  #
  set :views, Proc.new { File.join(root, "../views/") }
  set :method_override, true
  set :sessions, true

  get "/" do
    redirect to "/register"
  end

  def title
    @title ? "Wardrobe | #{ @title }" : "Wardrobe"
  end

  def header
    current_user? ? "#{current_user.username}'s Wardrobe" : "Wardrobe"
  end

  def current_user?

  end
end
