class SongsController < ApplicationController
  def search
    @songs = Song.all
    respond_to do |format|
      format.js { render json: @songs }
    end
  end
end
