class PostsController < ApplicationController

	# def create
	# 	render text: params[:post].inspect
	# end

	def new

	end

	def create
		@post = Post.new(params[:post].permit(:title, :lead, :text))

		@post.save
		redirect_to @post
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	private
	def post_params
		params.require(:post).permit(:title, :lead, :text)
	end

end
