class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  #
  set :views, Proc.new { File.join(root, "../views/") }
  set :method_override, true

  def title
    @title ? "Wardrobe | #{ @title }" : "Wardrobe"
  end
end
