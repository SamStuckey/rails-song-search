class SongsController < ApplicationController
  def search
    @songs = Song.all

    respond_to do |format|
      format.js { render 'songs/search' }
    end
  end
end
