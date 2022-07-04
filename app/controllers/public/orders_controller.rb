class Public::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post.user_id = current_user.id
    @order = Order.new(order_params)
    @order.save
      redirect_to posts_path, notice: "購入が完了しました。ありがとうございました！"
  end

  def order
    @post = Post.find(params[:post_id])
  end

  def index
    #@posts = @order.posts.all
    # @post = current_user.posts.find_by(order_id: @order_id)
    # @orders = @user.orders.all
    # @posts = @user.posts.all
    @posts = Post.all
  end

  def show
  end

  def thanks
  end

  private

  def order_params
    params.permit(:post_id, :user_id)
  end

end
