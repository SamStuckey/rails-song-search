require 'spec_helper'

RSpec.describe Song, type: :model do
  describe "#find_by_query" do
    let(:artist_1) { Artist.create!(name: 'bob') }
    let(:artist_2) { Artist.create!(name: 'becky') }
    let(:artist_3) { Artist.create!(name: 'matz') }

    let(:album_1) { Album.create!(artist: artist_1, title: 'bobs songs') }
    let(:album_2) { Album.create!(artist: artist_2, title: 'beckys bops') }
    let(:album_3) { Album.create!(artist: artist_3, title: 'the matz mambo') }

    let(:song_1) { Song.create!(album: album_1, title: 'fun') }
    let(:song_2) { Song.create!(album: album_1, title: '123') }
    let(:song_3) { Song.create!(album: album_2, title: 'hop') }
    let(:song_4) { Song.create!(album: album_2, title: 'funk') }
    let(:song_5) { Song.create!(album: album_3, title: 'bop') }
    let(:song_6) { Song.create!(album: album_3, title: 'run') }

    it "matches by song title" do
      expect(Song.find_by_query(song: "un")).to contain_exactly(song_1, song_4, song_6)
      expect(Song.find_by_query(song: "k")).to contain_exactly song_4
      expect(Song.find_by_query(song: "op")).to contain_exactly(song_3, song_5)
      expect(Song.find_by_query(song: "nope")).to be_empty
    end

    it "matches by artist name" do
      expect(Song.find_by_query(artist: "b")).to contain_exactly(song_1, song_2, song_3, song_4)
      expect(Song.find_by_query(artist: "bo")).to contain_exactly(song_1, song_2)
      expect(Song.find_by_query(artist: "bill")).to be_empty
    end

    it "matches by album title" do
      expect(Song.find_by_query(album: "b")).to contain_exactly(song_1, song_2, song_3, song_4)
      expect(Song.find_by_query(album: "bop")).to contain_exactly(song_3, song_4)
      expect(Song.find_by_query(album: "mambo no 5")).to be_empty
    end

    it "matches on multiple fields" do
      expect(Song.find_by_query(album: "b", song: "un")).to contain_exactly(song_1, song_4)
      expect(Song.find_by_query(album: "b", song: "u", artist: "matz")).to be_empty
      expect(Song.find_by_query).to contain_exactly(song_1, song_2, song_3, song_4, song_5, song_6)
    end
  end
end
