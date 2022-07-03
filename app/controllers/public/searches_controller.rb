class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @users = User.search(params[:search], params[:keyword])
    else @range = "出品"
      @posts = Post.search(params[:search], params[:keyword])
    end

  end
end
