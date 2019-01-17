class BectorController < ApplicationController
  def top
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id:params[:id])
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/bector/top")
  end

end
