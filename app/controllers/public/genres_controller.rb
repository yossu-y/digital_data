class Public::GenresController < ApplicationController

  def genre_posts
    # @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
  end

end
