class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @order = Order.new
    # @genre = Genre.find(params[:genre_id])
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
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "更新しました！"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "出品を削除しました"
  end

  def order_posts
    @user = User.find(params[:id])
    # @posts = @order.posts.all
    # @post = current_user.posts.find_by(order_id: @order_id)
    # @orders = @user.orders.all
    @posts = @user.posts.all
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :price, :genre_id, :image)
  end

end

