require 'spec_helper'

RSpec.describe SongsController, type: :controller do
  let(:artist_1) { Artist.create!(name: 'bob') }
  let(:artist_2) { Artist.create!(name: 'becky') }
  let(:artist_3) { Artist.create!(name: 'matz') }
  let(:album_1) { Album.create!(artist: artist_1, title: 'nope') }
  let(:album_2) { Album.create!(artist: artist_1, title: 'fun') }
  let(:album_3) { Album.create!(artist: artist_2, title: 'funky') }
  let(:song_1) { Song.create!(album: album, title: 'song') }
  let(:song_2) { Song.create!(album: album, title: 'songer') }
  let(:song_3) { Song.create!(album: album, title: 'songest') }

  it "matches an artist" do
    get :index, params: { artist: "bo" }, xhr: true

    debugger
    expect(response).to be 200
  end

  it "matches an artist" do
  end

  it "matches an artist" do
  end

  it "matches on mulitple fields" do
  end
end
