class PostsController < ApplicationController

	# def create
	# 	render text: params[:post].inspect
	# end

	# def new

	# end

	# def create
	# 	@post = Post.new(params[:post].permit(:title, :lead, :text))

	# 	@post.save
	# 	redirect_to @post
	# end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text))

		if @post.save
			redirect_to @post
		else
			# send the post object back to the posts#new action
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :lead, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :lead, :text)
	end

end
