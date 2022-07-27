class Public::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    # current_user.orders.create(post_id: post.id)
      redirect_to user_path(current_user.id), notice: "購入が完了しました。ありがとうございました！"
  end

  def order
    @order = Order.new
    @post = Post.find(params[:post_id])
    # @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders.all
    @order_posts = Post.find(@orders.pluck(:post_id))
    # au@order = Order.find(params[:order_id])
  end

  def show
    @order = Order.find(params[:order_id])
    @post = Post.find(params[:id])
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:post_id, :user_id)
  end

end

