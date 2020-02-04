class BloggerssController < ApplicationController
  def index
    @bloggers = Blogger.all 
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new 
  end

  def create 
    @blogger = Blogger.new(blogger_params)
    @blogger.save 
    redirect_to blogger_path(@blogger)
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
    redirect to bloggers_path
  end 

  private 

  def blogger_params
    params.require(:blogger).permit[:name, :age, :bio]
  end 

end

# Users should be able to create a new blogger
# Bloggers should have unique names and ages above 0, and their bio should be over 30 characters long.
# Users should be able to see the profile page of a blogger. On this page, a user should see:
# The total likes on all of that blogger's posts
# A link to that blogger's featured post (the post with the most likes)
# BONUS A list of that user's top 5 most written about destinations (the destinations with the most posts)