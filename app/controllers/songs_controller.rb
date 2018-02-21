class SongsController < ApplicationController
  def index
    @songs = Song.all

    respond_to do |format|
      format.js { render "songs/index" }
    end
  end
end
