class PostsController < ApplicationController
	def index
		@new_post = Post.new #use @new_post in the view to render a form.
		@all_posts = Post.order(created_at: :desc).all #use @all_posts to render a list of all posts, sorted in descending order
	end
	
	def create
		@post = Post.new(post_prams)
		
		if @post.save
			redirect_to root_path
		end
		
	end
	
	private
	def post_prams
		params.require(:post).permit(:comment)
	end
		
end
