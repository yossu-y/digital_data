class Public::OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post.user_id = current_user.id
    @order = Order.new(order_params)
    # @order = current_user.orders.find_by(post_id: params[:order][:post_id])
    @order.save
      redirect_to posts_path, notice: "購入が完了しました。ありがとうございました！"
  end

  def order
    @post = Post.find(params[:post_id])
  end

  def thanks
  end

  def user_orders
    @user = User.find(params[:id])
    @orders = Order.all
    # @order = Order.find(params[:id])
    # @posts = @order.posts.all
    # @post = current_user.posts.find_by(order_id: @order_id)
    # @orders = @user.orders.all
    # @posts = @user.orders.posts.all
  end

  private

  def order_params
    params.require(:order).permit(:post_id, :user_id)
  end

end
