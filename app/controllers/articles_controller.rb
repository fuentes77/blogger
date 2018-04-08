class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
	@article = Article.find(params[:id])
	@comment = Comment.new
	@comment.article_id = @article.id
	@tag = Tag.new
	#@tag.article_id = @article.id
  end 

  def create
    @article = Article.new(article_params)
    @article.save
    #redirect_to article_path(@article)
    redirect_to action: 'index'
    flash.notice = "Article '#{@article.title}'has been created!"
  end

  def new 
   @article = Article.new
  end

def update
  @article = Article.find(params[:id])
  @article.update(article_params)

  flash.notice = "Article '#{@article.title}' Updated!"

  redirect_to article_path(@article)
end

  def destroy
	@article = Article.find(params[:id])
	@article.destroy
	redirect_to action: 'index'
	flash.notice = "Article '#{@article.title}' has been removed!"
  end

  def edit
    @article = Article.find(params[:id])
  end  


end
