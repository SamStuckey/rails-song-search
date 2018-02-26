class SongsController < ApplicationController
  def index
    @songs = Song.find_by_query(
      song: params[:song],
      album: params[:album],
      artist: params[:artist]
    )

    respond_to do |format|
      format.js { render "songs/index" }
    end
  end
end
