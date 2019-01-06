class BectorController < ApplicationController
  def top
    @posts = Post.all
  end
end
