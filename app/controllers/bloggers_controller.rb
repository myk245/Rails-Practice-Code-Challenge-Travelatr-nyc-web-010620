class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all 
  end

  def show
    @blogger = Blogger.find(params[:id])
    @posts = @blogger.posts 

    # Thank you to Chett Tiller for walking  me through the below method and logic!
    # We start at 0 and then iterate through the array of all posts belonging to the user. 
    # For each post in the array, we grab the number of likes and then add it to the sum. 
    @total_likes = @posts.inject(0) {|sum, post| sum + post.likes}

    @most_liked_post= @posts.max_by { |post| post.likes }
  end

  def new
    @blogger = Blogger.new 
  end

  def create 
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      flash[:message] = "blogger successfully created!"
      redirect_to blogger_path(@blogger)
    else 
      flash.now[:message] = @blogger.errors.full_messages[0]
      @bloggers = Blogger.all
      render :new
    end
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
    @blogger.update(blogger_params)
    redirect_to blogger_path(@blogger)
  end 

  def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.delete
    redirect_to bloggers_path
  end 

  private 

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end 

end

# [x] Users should be able to create a new blogger
# [x] Bloggers should have unique names 
# [x] and ages above 0
# [x] and their bio should be over 30 characters long.
# [x] Users should be able to see the profile page of a blogger. 
# On this page, a user should see:
# [x] The total likes on all of that blogger's posts
# [] A link to that blogger's featured post (the post with the most likes)
# BONUS A list of that user's top 5 most written about destinations (the destinations with the most posts)