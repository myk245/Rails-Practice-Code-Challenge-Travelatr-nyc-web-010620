class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end 

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # if the post saves, that means that it passes the validations, 
    # so show the success message and redirect to the post's show page
    if @post.save 
      flash[:message] = "post successfully created"
      redirect_to post_path(@post)
    else
      # if the post does not save, it did not pass the validations, 
      # so we need to let the server know to display the error message 
      flash.now[:message] = @post.errors.full_messages
      render :new
    end
  end 

  def edit
    @post = Post.find(params[:id])
    @bloggers = Blogger.all
    @destinations = Destination.all 
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end 

  # first we need to find the post by its ID
  # then, we can grab the current number of likes by calling .likes on the post
  # to increase the number of likes, we increment the current number of likes by 1
  # (should take the user to the same page when the like button is pressed)
  # for the last step, we need to display the up-to-date number of likes in the post's show page 
  def updated_likes
    @post = Post.find_by_id(params[:id])
    @current_like = @post.likes
    @post.update(likes: (@current_like + 1))
    redirect_to post_path
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path 
  end 

  private 

  def post_params
    params.require(:post).permit!
  end 

end

# [x] Users should be able to create and edit a post
# [x] Users should be able to select a blogger from a dropdown menu
# [x] Users should be able to select a destination from a dropdown menu
# [x] A post should have a title
# [x] A post should have content longer than 100 characters
# [x] Users should be able to see a post's page with its title and content displayed. 
# On this page, a user should see:
# [x] A link to the page of that post's author
# [x] A link to the page of that post's destination
# [x] A like button link that increases the like count for that post (should take the user to the same page)