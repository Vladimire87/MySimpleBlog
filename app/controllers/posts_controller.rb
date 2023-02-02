class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      # Handle the case where the post was not found
      # You could redirect to a different page, or render a 404 page
    end
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # Redirect to the show page for the new post
      redirect_to posts_path
    else
      # Render the new template again if the post couldn't be saved
      render :new
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
end
