class Public::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new(order_params)
    @order.save
      redirect_to posts_path, notice: "購入が完了しました。ありがとうございました！"
  end

  def order
    @post = Post.find(params[:post_id])
  end

  def index
    # @post = current_user.posts.find_by(order_id: @order_id)
    # @orders = @user.orders.all
    # @posts = @user.posts.all
    @order = current_user.orders.all
    @posts = Post.all
    # @posts = current_user.orders.find_by(post_id: @post_id)
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

