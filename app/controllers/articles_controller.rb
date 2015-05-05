class ArticlesController < ApplicationController
	def index
		@articles=Article.all
		if params[ :title].present?
		@articles = @articles.where("title like ?", "%#{params[ :title]}%")			
		end	
		if params[ :teacher].present?
		@articles = @articles.where("teacher like ?", "%#{params[ :teacher]}%")			
		end		
		if params[ :place].present?
		@articles = @articles.where("place like ?", "%#{params[ :place]}%")			
		end
		if params[ :time].present?
		@articles = @articles.where("time like ?", "%#{params[ :time]}%")			
		end
		if params[ :degree].present?
		@articles = @articles.where("degree like ?", "%#{params[ :degree]}%")			
		end							
	end
	def show
		@article=Article.find(params[ :id])
	end
	def new
		@article=Article.new
	end
	def create
		@article=Article.new(article_params)	
		if @article.save
			redirect_to root_path
		else
			render :new
		end
	end
	def edit
		@article=Article.find(params[ :id])
	end
	def update
		@article=Article.find(params[ :id])
		if @article.update(article_params)
			redirect_to root_path
		else
			render :edit	
		end	
	end
	def destroy
		@article=Article.find(params[ :id])
		@article.destroy
		redirect_to root_path
	end
	private

	def article_params
		params.require( :article)	.permit( :title, :teacher, :place, :time, :degree)	
	end
end
