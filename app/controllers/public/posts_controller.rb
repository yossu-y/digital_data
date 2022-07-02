class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "出品に成功しました！"
    else
      @books = Book.all
      render "new"
    end
  end

  def update
  end

  def destroy
    @post.destory
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :price, :genre_id, :image)
  end

end

