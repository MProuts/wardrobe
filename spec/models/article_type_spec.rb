require_relative '../spec_helper.rb'

describe ArticleType do
  before(:each) do
    @article_type = ArticleType.create()
  end

  it "should be able to have a name" do
    @article_type.name = "shoe"
    @article_type.save

    expect(ArticleType.find_by(:name => "shoe")).to eq(@article_type)
  end

  it "should be able to have articles" do
    article = Article.create()
  end
end

