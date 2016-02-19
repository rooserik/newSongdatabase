class SongsController < ApplicationController
  def index
  @songs=Song.all
  end
  def show
  @song=Song.find(params[:id])
  end
  def new
  @song=Song.new
  @artists=Artist.all
  end
  def create
    if @song=Song.create(song_params)
      redirect_to @song, notice: "song succesfully created"
    else
      render :new, notice: "error, try again"
    end
  end

  private
  def song_params
    params.require(:song).permit(:name,:duration,:artist_id,:album)
  end

end
