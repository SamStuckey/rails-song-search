class SongsController < ApplicationController
  def index
    @songs = Song.all
    unless params[:song].blank?
      @songs = @songs.where(title: params[:song])
    end
    unless params[:album].blank?
      @songs = @songs.joins(:album).where(albums: { title: params[:album] })
    end
    unless params[:artist].blank?
      @songs = @songs.joins(:artist).where(artists: { name: params[:artist] })
    end

    @songs.all

    respond_to do |format|
      format.js { render "songs/index" }
    end
  end
end
