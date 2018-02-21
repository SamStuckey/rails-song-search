class SearchController < ApplicationController
  def index
    @query = {}
  end

  def results
    debugger
    @songs = Song.all

    respond_to do |format|
      format.js { render "search/search" }
    end
  end

  private

  def query_params
    param.require(:query).permit(:album, :artist, :song)
  end
end
