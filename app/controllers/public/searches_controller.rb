class Public::SearchesController < ApplicationController

  def search
    @keyword = params[:keyword]

    if @keyword == "ユーザー"
      @users = User.search(params[:search], params[:keyword])
    else @keyword = "出品"
      @post = Post.search(params[:search], params[:keyword])
    end

  end
end
