class SongsController < ApplicationController
  def index
    @songs = Song.all
    unless params[:song].blank?
      @songs = @songs.where("songs.title LIKE ?", "%#{params[:song]}%")
    end
    unless params[:album].blank?
      @songs = @songs.joins(:album).where("albums.title LIKE ?", "%#{params[:album]}")
    end
    unless params[:artist].blank?
      @songs = @songs.joins(:artist).where("artists.name LIKE ?", "%#{params[:artist]}%")
    end

    @songs.all.limit(10)

    respond_to do |format|
      format.js { render "songs/index" }
    end
  end
end
