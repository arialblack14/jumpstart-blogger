class ArticlesController < ApplicationController
	before_filter :require_login, only: [ :new, :create, :edit, :update, :destroy ]

	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title}' was just created!"

		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title} was updated!'"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id]).destroy

		redirect_to articles_path
		flash.notice = "Article '#{@article.title}' was deleted"
	end
end
