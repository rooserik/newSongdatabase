class ArtistsController < ApplicationController
  def index
    @artists=Artist.all
  end
  def show
    @artist=Artist.find(params[:id])
  end
  def new
    @artist=Artist.new
  end
  def edit
    @artist=Artist.find(params[:id])
  end

  def update
    @artist=Artist.find(params[:id])
    if @artist=Artist.update(artist_params)
      redirect_to @artist, notice: "artist succesfully edited"
    else
      render :edit, notice:"error, try again"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artist_path
  end

  def create
    if @artist=Artist.create(artist_params)
      redirect_to @artist, notice: "artist succesfully created"
    else
      render :new, notice: "error, try again"
    end
  end

private
  def artist_params
  params.require(:artist).permit(:name,:rec_company,:genre,:poster)
  end
end
