require 'spec_helper'

RSpec.describe "search", type: :request do
  before(:each) do
    artist = Artist.create!(name: 'someone')
    album = Album.create!(artist: artist, title: 'foo')
    song = Song.create!(album: album, title: 'bar')
  end

  it 'creates assets' do
    expect(Song.count).to eq 1
  end

  it 'creates assets again' do
    expect(Song.count).to eq 1
  end
end
