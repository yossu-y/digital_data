class Public::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end

end
