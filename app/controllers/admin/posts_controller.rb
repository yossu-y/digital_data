class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path, notice: "出品を削除しました。"
    end
  end

end
