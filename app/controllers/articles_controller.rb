class ArticlesController < ApplicationController
  get "/articles" do
    @tops = Article.where("article_type = 'top'").order('random()')
    @bottoms = Article.where("article_type = 'bottom'").order('random()')

    erb :"articles/index"
  end

  get "/articles/tops/new" do
    @type = "top"

    erb :"articles/new"
  end

  get "/articles/bottoms/new" do
    @type = "bottom"

    erb :"articles/new"
  end

  post "/articles/new" do
    Article.create(params["article"])

    redirect to("/articles")
  end

  post "/upload" do
    binding.pry
    File.open('uploads/' + params['my_file'][:filename], "w") do |f|
      f.write(params['my_file'][:tempfile].read)
    end
    return "The file was successfully uploaded!"
  end

  get "/articles/:id" do
    @article = Article.find_by_id(params["id"])

    erb :"articles/show"
  end

  get "/articles/:id/edit" do
    @article = Article.find_by_id(params["id"])

    erb :"articles/edit"
  end

  post "/articles/:id/edit" do
    Article.find_by_id(params["id"]).update_attributes(params["article"])

    redirect to("/articles/#{params["id"]}")
  end

  delete "/articles/:id" do
    Article.destroy(params["id"])

    redirect to("/articles")
  end
end
