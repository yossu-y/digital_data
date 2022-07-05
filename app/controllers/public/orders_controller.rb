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
    @post = Post.find(params[:post_id])
  end

  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders.all
    # @order = @user,order.find(params[:id])
    @order_posts = Post.find(@orders.pluck(:post_id))
  end

  def show
    @order = Order.find(params[:id])
    @post = Post.find(params[:id])
  end

  def thanks
  end

  private

  def order_params
    params.permit(:post_id, :user_id)
  end

end

