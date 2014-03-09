class ArticlesController < ApplicationController
  get "/articles" do
    @article_types = ArticleType.all
    @articles = Article.all

    erb :"articles/index"
  end

  get "/articles/new" do
    @article_types = ArticleType.all
    erb :"articles/new"
  end

  post "/articles" do
    binding.pry
    Article.create(params["article"])
    binding.pry

    redirect to("/articles")
  end

  post "/upload" do
    File.open('uploads/' + params['my_file'][:filename], "w") do |f|
      f.write(params['my_file'][:tempfile].read)
    end
  end

  get "/articles/:id" do
    @article = Article.find_by_id(params["id"])

    erb :"articles/show"
  end

  get "/articles/:id/edit" do
    @article_types = ArticleType.all
    @article = Article.find_by_id(params["id"])

    erb :"articles/edit"
  end

  put "/articles/:id" do
    Article.find_by_id(params["id"]).update_attributes(params["article"])

    redirect to("/articles/#{params["id"]}")
  end

  delete "/articles/:id" do
    Article.destroy(params["id"])

    redirect to("/articles")
  end
end
